import 'package:eduha/common/color_values.dart';
import 'package:eduha/common/validator.dart';
import 'package:eduha/service/firebase_service.dart';
import 'package:eduha/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorValues.backgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: theme.headline1,
                ),
                Text(
                  'Please enter your email address',
                  style: theme.bodyText1,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextField(
                  label: 'Email',
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => Validator().emailValidator(value),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () async {
                    bool shouldNavigate = await FirebaseService()
                        .resetPassword(context, _emailController.text.trim());

                    if (shouldNavigate) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Reset Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
