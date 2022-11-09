import 'dart:async';

import 'package:eduha/common/navigate.dart';
import 'package:eduha/ui/sign_up/join.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboarding/onboarding_pages.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int? _initScreen;

  Future _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _initScreen = prefs.getInt('screen');

    Timer(Duration(seconds: 3), () {
      _initScreen == 1
          ? Navigate.navigatorPushAndRemove(context, JoinView())
          : Navigate.navigatorPushAndRemove(context, OnBoarding());
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
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
