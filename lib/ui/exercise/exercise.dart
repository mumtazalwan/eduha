import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduha/common/color_values.dart';
import 'package:eduha/model/detail_course.dart';
import 'package:eduha/service/api_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../service/firebase_service.dart';

class ExerciseView extends StatefulWidget {
  final String learningPath, course, lesson;
  final int index;

  const ExerciseView(
      {Key? key,
      required this.index,
      required this.learningPath,
      required this.course,
      required this.lesson})
      : super(key: key);

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  DetailCourseModel? _model;
  bool _isLoaded = false;
  int? _isTrue;
  double _progress = 0;

  Future _getApi() async {
    _model = await ApiService().getDetailCourse(1111);
    if (mounted) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getApi();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1.5,
        title: LinearPercentIndicator(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          backgroundColor: const Color(0XFFc0c0c0),
          progressColor: ColorValues.green,
          lineHeight: 7,
          percent: _progress,
          animation: true,
          animateFromLastPercent: true,
          barRadius: const Radius.circular(3),
        ),
        actions: [
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              } else {
                return Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Row(
                    children: [
                      Text(
                        '${snapshot.data!['progress']}',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.flash_on_outlined,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: _isLoaded
          ? _progress == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        'Find the result',
                        style: theme.headline1,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      color: const Color(0XFFF6F6F6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Text(
                              _model!.exercise[widget.index].question,
                              style: theme.subtitle2,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 15.h),
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              var model =
                                  _model!.exercise[widget.index].foExe[index];

                              return Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                color: (_isTrue == index + 1)
                                    ? Colors.black.withOpacity(0.1)
                                    : null,
                                child: RadioListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 10.w),
                                  title: Text(
                                    model.text,
                                    style: theme.bodyText1,
                                  ),
                                  value: model.isCorrect,
                                  groupValue: _isTrue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _isTrue = value!;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                minimumSize: Size(50.w, 40.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: () async {
                                int correctAnswer = _model!
                                    .exercise[widget.index].correctAnswear;
                                if (_isTrue == correctAnswer) {
                                  setState(() {
                                    _progress = 1;
                                  });
                                  await FirebaseService().saveProgressExercise(
                                      widget.learningPath,
                                      widget.course,
                                      'exercise',
                                      widget.lesson,
                                      _progress);
                                } else if (_isTrue == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      padding: const EdgeInsets.all(15),
                                      duration: const Duration(seconds: 1),
                                      content: Text(
                                        'Please choose answer first!',
                                        style: GoogleFonts.inter(),
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      padding: const EdgeInsets.all(15),
                                      duration: const Duration(seconds: 1),
                                      content: Text(
                                        'Uppss, your answer is wrong!',
                                        style: GoogleFonts.inter(),
                                      ),
                                    ),
                                  );
                                  setState(() {
                                    _isTrue = null;
                                  });
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Congratulation your answer is correct!',
                          style: theme.headline2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Lottie.asset('assets/lottie/finish.json',
                            height: 280.h),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: Size(50.w, 40.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Finish'),
                      ),
                    ],
                  ),
                )
          : Center(
              child: Lottie.asset('assets/lottie/cubes_loader.json',
                  height: 200.h),
            ),
    );
  }
}
