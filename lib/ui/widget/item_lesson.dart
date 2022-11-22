import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduha/common/navigate.dart';
import 'package:eduha/model/detail_course.dart';
import 'package:eduha/ui/exercise/exercise.dart';
import 'package:eduha/ui/lesson/lesson.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../common/color_values.dart';

class ItemLesson extends StatefulWidget {
  int index, id;
  List<CourseFoundation> course;
  List<Exercise> exercise;
  String learningPath, courseTitle;

  ItemLesson(
      {Key? key,
      required this.course,
      required this.exercise,
      this.index = 0,
      required this.id,
      required this.learningPath,
      required this.courseTitle})
      : super(key: key);

  @override
  State<ItemLesson> createState() => _ItemLessonState();
}

class _ItemLessonState extends State<ItemLesson> {
  bool _isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.exercise.isNotEmpty) {
      _isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    color: Color(0XFFE5E5E5),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      (widget.index + 1).toString(),
                      style: GoogleFonts.inter(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    widget.course[widget.index].materialName,
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 225.h,
            child: _isVisible
                ? ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 20.w),
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigate.navigatorPush(
                            context,
                            LessonView(
                              id: widget.course[widget.index].id,
                              learningPath: widget.learningPath,
                              course: widget.courseTitle,
                              lesson: widget.course[widget.index].mainTitle,
                              indexCourse: widget.index,
                            ),
                          );
                        },
                        child: Container(
                          width: 235.w,
                          margin: EdgeInsets.only(right: 20.w),
                          padding: const EdgeInsets.all(15),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 120.h,
                                child: Image.asset(
                                  'assets/pre-algebra/${widget.course[widget.index].imgPath}.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                widget.course[widget.index].mainTitle,
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                widget.course[widget.index].mainDescription,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              _progressIndicatorCourse(
                                  widget.course[widget.index].mainTitle),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigate.navigatorPush(
                            context,
                            ExerciseView(
                              index: widget.index,
                              learningPath: widget.learningPath,
                              course: widget.courseTitle,
                              lesson:
                                  widget.exercise[widget.index].exerciseTitle,
                            ),
                          );
                        },
                        child: Container(
                          width: 235.w,
                          margin: EdgeInsets.only(right: 20.w),
                          padding: const EdgeInsets.all(15),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 120.h,
                                child: Image.asset(
                                  'assets/pre-algebra/a.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                widget.exercise[widget.index].exerciseTitle,
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                widget.exercise[widget.index].exerciseDesc,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              _progressIndicatorExercise(
                                  widget.exercise[widget.index].exerciseTitle),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 20.w),
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigate.navigatorPush(
                            context,
                            LessonView(
                              id: widget.course[widget.index].id,
                              learningPath: widget.learningPath,
                              course: widget.courseTitle,
                              lesson: widget.course[widget.index].mainTitle,
                              indexCourse: widget.index,
                            ),
                          );
                        },
                        child: Container(
                          width: 235.w,
                          margin: EdgeInsets.only(right: 20.w),
                          padding: const EdgeInsets.all(15),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 120.h,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                widget.course[widget.index].mainTitle,
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                widget.course[widget.index].mainDescription,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              _progressIndicatorCourse(
                                  widget.course[widget.index].mainTitle),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 235.w,
                        margin: EdgeInsets.only(right: 20.w),
                        padding: const EdgeInsets.all(15),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 120.h,
                              color: Colors.blueAccent.withOpacity(0.5),
                              child: const Center(
                                child: Icon(
                                  Icons.lock_sharp,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'Extra Practice',
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Solve a problem to strengthen your skill',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _progressIndicatorCourse(String title) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(widget.learningPath)
          .doc(widget.courseTitle)
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

  Widget _progressIndicatorExercise(String title) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(widget.learningPath)
          .doc(widget.courseTitle)
          .collection('exercise')
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
