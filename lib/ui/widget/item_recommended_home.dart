import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/color_values.dart';

class Recommended extends StatefulWidget {
  final category, course_name, course_desc, image;

  const Recommended(
      {Key? key, this.category, this.course_name, this.course_desc, this.image})
      : super(key: key);

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15.w),
        padding: EdgeInsets.all(15),
        width: 200.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: Colors.grey)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/courses/${widget.image}.svg',
                    width: 160.w,
                    height: 130.h,
                  ),
                ),
              ),
              Text(widget.course_name, style: GoogleFonts.inter(fontSize: 18.sp)),
              SizedBox(height: 15.h),
              LinearPercentIndicator(
                padding: const EdgeInsets.all(0),
                percent: 0.2,
                barRadius: Radius.circular(2),
                backgroundColor: ColorValues.green.withOpacity(0.2),
                progressColor: ColorValues.green,
              ),
            ],
          ),
        ));
  }
}
