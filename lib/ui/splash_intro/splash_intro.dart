import 'dart:async';

import 'package:eduha/common/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../onboarding/onboarding_pages.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigate.navigatorReplacement(context, OnBoarding());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white.withOpacity(0.4),
        child: Center(
          child: Image.asset('assets/images/logo.png', width: 270.w),
        ),
      )),
    );
  }
}
