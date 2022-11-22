import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduha/model/course_learning.dart';
import 'package:eduha/ui/detail_course/detail_course.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/color_values.dart';
import '../../common/navigate.dart';

class ItemCourse extends StatelessWidget {
  List<CourseFoundation> model = [];
  int index;

  ItemCourse({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigate.navigatorPush(
          context,
          DetailCourseView(
              id: model[index].materialId,
              title: model[index].foundationName,
              desc: model[index].description,
              img: model[index].coursePath,
              titleLearningPath: 'Math Foundation'),
        );
      },
      child: Container(
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
              'assets/courses/${model[index].coursePath}.svg',
              width: 100.w,
              height: 100.h,
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                model[index].foundationName,
                style: GoogleFonts.inter(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            _progressIndicator(model[index].foundationName),
          ],
        ),
      ),
    );
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

          return e.exists && e.data()!.containsKey('progress')
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
