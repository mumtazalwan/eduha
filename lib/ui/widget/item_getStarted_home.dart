import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/color_values.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(width: 0.5, color: Colors.grey)),
      child: Wrap(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15),
            child: Image.asset('assets/pre-algebra/a.png', fit: BoxFit.fill,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Logic",
                  style: GoogleFonts.inter(
                      fontSize: 11.sp, fontWeight: FontWeight.w400)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text("Elementary Mathematic",
                      style: GoogleFonts.inter(fontSize: 18.sp))),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: GoogleFonts.inter(
                    fontSize: 12.sp, fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20.h),
              LinearPercentIndicator(
                padding: const EdgeInsets.all(0),
                percent: 0.2,
                barRadius: Radius.circular(2),
                backgroundColor: ColorValues.green.withOpacity(0.2),
                progressColor: ColorValues.green,
              ),
              SizedBox(height: 20.h),
              Container(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(3))),
                  onPressed: () {},
                  child: Text("Resume Course",
                      style: GoogleFonts.inter(fontSize: 12.sp)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
