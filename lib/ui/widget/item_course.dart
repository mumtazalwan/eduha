import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/color_values.dart';

class ItemCourse extends StatelessWidget {
  String title;
  bool isOne;

  ItemCourse({Key? key, required this.title, this.isOne = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 200.h,
      margin: EdgeInsets.only(right: 15.w),
      padding: const EdgeInsets.all(15),
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
              title,
              style: GoogleFonts.inter(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          isOne ? _progressIndicator(title) : _progressIndicator2(title),
        ],
      ),
    );
  }

  Widget _progressIndicator(String title) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Math Foundation')
          .doc('Pre-Algebra')
          .collection('course')
          .doc(title)
          .snapshots(),
      builder: (_, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return Container();
        } else {
          var e = snapshot.data!;

          return snapshot.data!.exists
              ? LinearPercentIndicator(
                  padding: const EdgeInsets.all(0),
                  percent: e['progress'],
                  barRadius: const Radius.circular(1),
                  backgroundColor: ColorValues.green.withOpacity(0.2),
                  progressColor: ColorValues.green,
                )
              : Container();
        }
      },
    );
  }

  Widget _progressIndicator2(String title) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Math Foundation')
          .doc('Commercial Math')
          .collection('course')
          .doc(title)
          .snapshots(),
      builder: (_, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return Container();
        } else {
          var e = snapshot.data!;

          return snapshot.data!.exists
              ? LinearPercentIndicator(
                  padding: const EdgeInsets.all(0),
                  percent: e['progress'],
                  barRadius: const Radius.circular(1),
                  backgroundColor: ColorValues.green.withOpacity(0.2),
                  progressColor: ColorValues.green,
                )
              : Container();
        }
      },
    );
  }
}
