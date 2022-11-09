import 'dart:async';

import 'package:eduha/common/navigate.dart';
import 'package:eduha/ui/bottom_navigation/bottom_navigation.dart';
import 'package:eduha/ui/sign_up/join.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 60));
      setState(() => canResendEmail = true);
    } catch (e) {
      print(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? BtnNavigation()
      : Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'A verif has been send to your email',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Lottie.asset(
                    'assets/lottie/shifting_cubes.json',
                    height: 220.h,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  ElevatedButton(
                    onPressed: canResendEmail ? sendVerificationEmail : null,
                    child: Text('Resent Email'),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      if (!mounted) return;
                      Navigate.navigatorPushAndRemove(context, JoinView());
                    },
                    child: Text('Back'),
                  ),
                ],
              ),
            ),
          ),
        );
}
