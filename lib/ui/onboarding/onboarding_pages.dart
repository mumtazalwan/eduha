import 'package:eduha/common/navigate.dart';
import 'package:eduha/ui/sign_up/join.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool isLastPage = false;

  var basecolor = Colors.grey.withOpacity(0.2);
  var dotcolor = Colors.black;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(bottom: 50),
          color: Colors.grey.withOpacity(0.2),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 150.w,
                  child: Center(
                    child: Image.asset('assets/images/logo.png', width: 255.w),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() => isLastPage = index == 2);
                    },
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        color: Colors.white,
                        child: SafeArea(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200.w,
                              height: 150.w,
                              child: Center(
                                child: Text("Excel in math and science",
                                    style: GoogleFonts.inter(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Image.asset("assets/onboarding_img/1.png",
                                width: 260.w)
                          ],
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        color: Colors.white,
                        child: SafeArea(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200.w,
                              height: 100.w,
                              child: Center(
                                child: Text(
                                    "Unlock key ideas through problem solving",
                                    style: GoogleFonts.inter(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Image.asset("assets/onboarding_img/2.png",
                                width: 260.w),
                            Container(
                              width: 200.w,
                              height: 50.w,
                              child: Center(
                                child: Text(
                                    "Unlock key ideas through problem solving",
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        color: Colors.white,
                        child: SafeArea(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200.w,
                              height: 100.w,
                              child: Center(
                                child: Text(
                                    "People around the world use Eduha to learn",
                                    style: GoogleFonts.inter(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Image.asset("assets/onboarding_img/3.png",
                                width: 260.w),
                            Container(
                              width: 200.w,
                              height: 50.w,
                              child: Center(
                                child: Text(
                                    "Join a community of students, enthusiasts, olympiad, champions, researchers, and professionals",
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
      bottomSheet: isLastPage
          ? Container(
              height: 150.h,
              color: basecolor,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 75.h,
                child: TextButton(
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: dotcolor,
                      minimumSize: Size.fromHeight(65.h)),
                  onPressed: () {
                    Navigate.navigatorPush(context, JoinView());
                  },
                ),
              ))
          : Container(
              color: basecolor,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 150.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 50.h,
                    child: TextButton(
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                        child: Text("SKIP",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ))),
                  ),
                  Container(
                    height: 50.h,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: SwapEffect(
                          dotWidth: 10.w,
                          dotHeight: 10.h,
                          dotColor: basecolor,
                          activeDotColor: dotcolor),
                      onDotClicked: (index) {
                        controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                    ),
                  ),
                  Container(
                    height: 50.h,
                    child: TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Text("NEXT",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ))),
                  )
                ],
              ),
            ),
    );
  }
}
