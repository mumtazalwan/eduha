import 'package:eduha/common/color_values.dart';
import 'package:eduha/model/detail_course.dart';
import 'package:eduha/model/learning_path.dart';
import 'package:eduha/service/api-service.dart';
import 'package:eduha/ui/widget/item_learning_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../widget/item_course.dart';

class CourseView extends StatefulWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  LearningPathModel? _learningPathModel;
  DetailCourseModel? _detailCourseModel;
  DetailCourseModel? _detailCourseModel2;
  bool _isLoaded = false;

  Future _getApi() async {
    _learningPathModel = await ApiService().getLearningPath();
    _detailCourseModel = await ApiService().getDetailCourse(1111);
    _detailCourseModel2 = await ApiService().getDetailCourse(1112);
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
      body: SafeArea(
        child: _isLoaded
            ? SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 30.h, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Popular Courses',
                              style: GoogleFonts.inter(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Popular with our users in the past month',
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 20.w, right: 5.w),
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (_, index) {
                                var model =
                                    _detailCourseModel!.courseFoundation[index];

                                return ItemCourse(
                                  title: model.mainTitle,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Recommended for beginners',
                              style: theme.headline5,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 20.w, right: 5.w),
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (_, index) {
                                var model = _detailCourseModel2!
                                    .courseFoundation[index];

                                return ItemCourse(
                                  title: model.mainTitle,
                                  isOne: false,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Popular Leaning Paths',
                              style: theme.headline5,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  _learningPathModel?.learningPath.length,
                              itemBuilder: (_, index) {
                                var model =
                                    _learningPathModel!.learningPath[index];

                                return ItemLearningPath(
                                  id: model.id,
                                  title: model.nameCourse,
                                  image: model.coursePath,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Lottie.asset('assets/lottie/cubes_loader.json',
                    height: 200.h),
              ),
      ),
    );
  }
}
