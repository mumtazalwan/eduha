import 'package:eduha/common/navigate.dart';
import 'package:eduha/service/firebase_service.dart';
import 'package:eduha/ui/home.dart';
import 'package:eduha/ui/log_in/log_in.dart';
import 'package:eduha/ui/sign_up/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/color_values.dart';

class JoinView extends StatefulWidget {
  const JoinView({Key? key}) : super(key: key);

  @override
  State<JoinView> createState() => _JoinViewState();
}

class _JoinViewState extends State<JoinView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 225.w,
                      ),
                      SizedBox(
                        height: 210.h,
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
                          width: size.width,
                          height: 55.h,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                height: 34.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Join using Google',
                                style: theme.subtitle1,
                              ),
                            ],
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
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
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
                        onTap: () {
                          Navigate.navigatorPush(
                              context, const CreateAccountView());
                        },
                        child: Container(
                          width: size.width,
                          height: 55.h,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidEnvelope,
                                size: 22.h,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                'Create account',
                                style: theme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 250.h,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      color: ColorValues.grey,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigate.navigatorPush(context, LogInView());
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
                                    decoration: TextDecoration.underline,
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
    );
  }
}
