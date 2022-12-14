import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduha/common/color_values.dart';
import 'package:eduha/model/detail_course.dart';
import 'package:eduha/service/api_service.dart';
import 'package:eduha/service/firebase_service.dart';
import 'package:eduha/ui/widget/item_lesson.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../common/navigate.dart';
import '../lesson/lesson.dart';

class DetailCourseView extends StatefulWidget {
  final int id, length;
  final String title, titleLearningPath, desc, img;

  const DetailCourseView(
      {Key? key,
      required this.id,
      required this.title,
      required this.desc,
      required this.img,
      required this.titleLearningPath,
      required this.length})
      : super(key: key);

  @override
  State<DetailCourseView> createState() => _DetailCourseViewState();
}

class _DetailCourseViewState extends State<DetailCourseView> {
  DetailCourseModel? _detailCourseModel;
  bool _isLoaded = false;

  Future _getApi() async {
    _detailCourseModel = await ApiService().getDetailCourse(widget.id);
    _initLearningPath();
    print('Total Length D = ${widget.length}');
    if (mounted) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  Future _initLearningPath() async {
    await FirebaseService()
        .initLearningPath(widget.titleLearningPath, widget.title);
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
      body: SafeArea(
        child: _isLoaded
            ? StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection(widget.titleLearningPath)
                    .doc(widget.title)
                    .snapshots(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Lottie.asset('assets/lottie/cubes_loader.json',
                          height: 200.h),
                    );
                  } else {
                    var e = snapshot.data!;

                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          elevation: 2,
                          pinned: true,
                          snap: false,
                          floating: false,
                          expandedHeight: 270.h,
                          automaticallyImplyLeading: false,
                          flexibleSpace: FlexibleSpaceBar(
                            titlePadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            title: Text(
                              widget.title,
                              style: theme.headline2,
                            ),
                            background: SvgPicture.asset(
                              'assets/courses/${widget.img}.svg',
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.desc,
                                        style: GoogleFonts.inter(
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                          minimumSize:
                                              Size(double.infinity, 40.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          textStyle: GoogleFonts.inter(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigate.navigatorPush(
                                            context,
                                            LessonView(
                                              id: _detailCourseModel!
                                                  .courseFoundation[e['index']]
                                                  .id,
                                              learningPath:
                                                  widget.titleLearningPath,
                                              course: widget.title,
                                              lesson: _detailCourseModel!
                                                  .courseFoundation[e['index']]
                                                  .mainTitle,
                                              indexCourse: e['index'],
                                              length: widget.length,
                                            ),
                                          );
                                        },
                                        child: const Text('CONTINUE COURSE'),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.only(top: 30.h, bottom: 10.h),
                                  color: ColorValues.grey,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _detailCourseModel
                                        ?.courseFoundation.length,
                                    itemBuilder: (_, index) {
                                      return ItemLesson(
                                        id: widget.id,
                                        index: index,
                                        course: _detailCourseModel!
                                            .courseFoundation,
                                        exercise: _detailCourseModel!.exercise,
                                        learningPath: widget.titleLearningPath,
                                        courseTitle: widget.title,
                                        length: widget.length,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              )
            : Center(
                child: Lottie.asset(
                  'assets/lottie/cubes_loader.json',
                  height: 200.h,
                ),
              ),
      ),
    );
  }
}
