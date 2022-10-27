import 'package:eduha/common/color_values.dart';
import 'package:eduha/common/navigate.dart';
import 'package:eduha/common/validator.dart';
import 'package:eduha/service/firebase_service.dart';
import 'package:eduha/ui/home.dart';
import 'package:eduha/ui/log_in/log_in.dart';
import 'package:eduha/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthdayController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoad = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/logo.png',
                                    width: 225.w,
                                  ),
                                  SizedBox(
                                    height: 100.h,
                                  ),
                                  CustomTextField(
                                    label: 'Email',
                                    controller: _emailController,
                                    textInputType: TextInputType.emailAddress,
                                    validator: (value) =>
                                        Validator().emailValidator(value),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomTextField(
                                    label: 'Password',
                                    controller: _passwordController,
                                    validator: (value) =>
                                        Validator().passwordValidator(value),
                                    isPassword: true,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomTextField(
                                    label: 'First Name',
                                    controller: _firstNameController,
                                    validator: (value) =>
                                        Validator().emptyValidator(value),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomTextField(
                                      label: 'Last Name',
                                      controller: _lastNameController),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  _customDatePicker(
                                      context, _birthdayController),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isLoad = true;
                                        });
                                        bool shouldNavigate =
                                            await FirebaseService().signUpEmail(
                                                _emailController.text,
                                                _passwordController.text,
                                                _firstNameController.text,
                                                _lastNameController.text,
                                                _birthdayController.text);
                                        print(
                                            'SHOULD NAVIGATE : $shouldNavigate');
                                        if (shouldNavigate) {
                                          Navigate.navigatorPush(
                                              context, Home());
                                        }
                                        setState(() {
                                          _isLoad = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: size.width / 1.2,
                                      height: 55,
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: ColorValues.greyButton,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.solidEnvelope,
                                            size: 22.h,
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            'Create Account',
                                            style: theme.subtitle1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                color: ColorValues.grey,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigate.navigatorPush(
                                              context, LogInView());
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Existing user? ',
                                            style: GoogleFonts.inter(
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Log in',
                                                style: GoogleFonts.inter(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                      Text(
                                        'By tapping Create account, I agree to Brain’s Terms and Privacy Policy.',
                                        style: GoogleFonts.inter(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: _isLoad,
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white.withOpacity(0.5),
                child: Center(
                  child:
                      Lottie.asset('assets/lottie/cubes_loader.json', height: 220.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customDatePicker(
      BuildContext context, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (value) => Validator().emptyValidator(value),
      style: GoogleFonts.inter(
        color: Colors.black.withOpacity(0.9),
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1.5, color: ColorValues.red),
        ),
        labelText: 'Birthday',
        labelStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1970),
          lastDate: DateTime.now(),
        );
        setState(() {
          if (selectedDate != null) {
            controller.text = DateFormat('yyyy -MM-dd').format(selectedDate);
          }
        });
      },
      onSaved: (value) {
        controller.text = value!;
      },
    );
  }
}
