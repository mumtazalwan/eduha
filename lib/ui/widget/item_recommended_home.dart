import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            border: Border.all(width: 0.5, color: Colors.grey)),
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
              Text(widget.course_name,
                  style: GoogleFonts.inter(fontSize: 18.sp)),
              SizedBox(height: 15.h),
              _progressIndicator(widget.course_name),
            ],
          ),
        ));
  }

  Widget _progressIndicator(String title) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Math Foundation')
          .doc(title)
          .snapshots(),
      builder: (_, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return Container();
        } else {
          var e = snapshot.data!;

          return e.exists &&
                  e.data()!.containsKey('progress') &&
                  e['progress'] > 0
              ? LinearPercentIndicator(
                  padding: const EdgeInsets.all(0),
                  percent: e['progress'] == 1 || e['progress'] > 1
                      ? 1.0
                      : e['progress'],
                  barRadius: const Radius.circular(2),
                  backgroundColor: ColorValues.green.withOpacity(0.2),
                  progressColor: ColorValues.green,
                )
              : Container();
        }
      },
    );
  }
}
