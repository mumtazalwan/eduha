import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/color_values.dart';

class ItemCourse extends StatelessWidget {
  const ItemCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 200.h,
      margin: EdgeInsets.only(right: 15.w),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/courses/math.svg',
            width: 100.w,
            height: 100.h,
          ),
          SizedBox(
            height: 30.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Mathematics',
              style: GoogleFonts.inter(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          LinearPercentIndicator(
            padding: const EdgeInsets.all(0),
            percent: 0.2,
            barRadius: Radius.circular(2),
            backgroundColor: ColorValues.green.withOpacity(0.2),
            progressColor: ColorValues.green,
          ),
        ],
      ),
    );
  }
}
