import 'package:eduha/model/course_learning.dart';
import 'package:eduha/service/api_service.dart';
import 'package:eduha/ui/widget/item_course.dart';
import 'package:eduha/ui/widget/item_course_learning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../common/color_values.dart';

class LearningPathView extends StatefulWidget {
  final String titleLearningPath;
  final int id;

  const LearningPathView({Key? key, required this.id, required this.titleLearningPath})
      : super(key: key);

  @override
  State<LearningPathView> createState() => _LearningPathViewState();
}

class _LearningPathViewState extends State<LearningPathView> {
  CourseLearningModel? _courseLearningModel;
  bool _isLoaded = false;

  Future getApi() async {
    _courseLearningModel = await ApiService().getCourseLearning(widget.id);
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
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoaded
            ? SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LEARNING PATH',
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        widget.titleLearningPath,
                        style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                        style: GoogleFonts.inter(
                          color: Colors.black.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            _courseLearningModel?.courseFoundation.length,
                        itemBuilder: (_, index) {
                          var model =
                              _courseLearningModel!.courseFoundation[index];

                          return ItemCourseLearning(
                            id: model.materialId,
                            title: model.foundationName,
                            titleLearningPath: widget.titleLearningPath,
                            desc: model.description,
                            image: model.coursePath,
                          );
                        },
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
