import 'package:eduha/common/navigate.dart';
import 'package:eduha/common/validator.dart';
import 'package:eduha/service/firebase_service.dart';
import 'package:eduha/ui/home.dart';
import 'package:eduha/ui/sign_up/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../common/color_values.dart';
import '../widget/custom_text_field.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                                  height: 140.h,
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
                                  height: 5.h,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot password?',
                                      style: theme.bodyText2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _isLoad = true;
                                      });
                                      bool shouldNavigate =
                                          await FirebaseService().signInEmail(
                                            context,
                                              _emailController.text,
                                              _passwordController.text);

                                      if (shouldNavigate) {
                                        Navigate.navigatorPush(context, Home());
                                      }
                                      setState(() {
                                        _isLoad = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: size.width / 1.2,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(width: 1.2)),
                                    child: Center(
                                      child: Text(
                                        'Sign In',
                                        style: theme.subtitle2,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: Colors.grey.withOpacity(0.4),
                                        thickness: 1.5,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Text(
                                        'OR',
                                        style: theme.bodyText1,
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: Colors.grey.withOpacity(0.4),
                                        thickness: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    bool shouldNavigate =
                                        await FirebaseService().signInGoogle();

                                    if (shouldNavigate) {
                                      Navigate.navigatorPush(context, Home());
                                    }
                                  },
                                  child: Container(
                                    width: size.width / 1.2,
                                    height: 55,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 1.5),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/google.png',
                                          height: 34.h,
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Text(
                                          'Sign in with Google',
                                          style: theme.subtitle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 120.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              color: ColorValues.grey,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigate.navigatorPush(
                                        context, CreateAccountView());
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'No account yet ? ',
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Sign up',
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
      )),
    );
  }
}
