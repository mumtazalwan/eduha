import 'package:eduha/model/course_learning.dart';
import 'package:eduha/ui/detail_course/detail_course.dart';
import 'package:eduha/ui/widget/item_getStarted_home.dart';
import 'package:eduha/ui/widget/item_recommended_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../service/api-service.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  CourseLearningModel? _courseLearningModel;
  bool _isLoaded = false;

  Future getApi() async {
    _courseLearningModel = await ApiService().getCourseLearning2();
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
                  margin: EdgeInsets.only(top: 25.h, bottom: 15.h),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 10,
                              percent: 1,
                              center: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("1",
                                      style: GoogleFonts.inter(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold)),
                                  Icon(Icons.flash_on_outlined,
                                      color: Colors.amber, size: 24.sp)
                                ],
                              ),
                              progressColor: Colors.amber,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Welcome, Alwan!",
                                      style: GoogleFonts.inter(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold)),
                                  Flexible(
                                      child: Text(
                                    "Take your first steps to bilding ",
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 80,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Menyelesaikan pre-algebra",
                                      style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400)),
                                  Icon(Icons.check, color: Colors.green)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          )),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text("Get started with Logic",
                                  style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            GetStarted()
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text("Recomemended for you",
                                  style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  padding:
                                      EdgeInsets.only(left: 5.w, right: 20.w),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _courseLearningModel!
                                      .courseFoundation.length,
                                  itemBuilder:
                                      (BuildContext contex, int index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => DetailCourseView(
                                                      id: _courseLearningModel!
                                                          .courseFoundation[
                                                              index]
                                                          .materialId,
                                                      title:
                                                          _courseLearningModel!
                                                              .courseFoundation[
                                                                  index]
                                                              .foundationName,
                                                      desc:
                                                          _courseLearningModel!
                                                              .courseFoundation[
                                                                  index]
                                                              .description,
                                                      img: _courseLearningModel!
                                                          .courseFoundation[
                                                              index]
                                                          .coursePath)));
                                        },
                                        child: Recommended(
                                          category: _courseLearningModel!
                                              .courseFoundation[index]
                                              .coursePath,
                                          course_name: _courseLearningModel!
                                              .courseFoundation[index]
                                              .foundationName,
                                          course_desc: _courseLearningModel!
                                              .courseFoundation[index]
                                              .description,
                                          image: _courseLearningModel!
                                              .courseFoundation[index]
                                              .coursePath,
                                        ));
                                  }),
                            )
                          ],
                        ),
                      )
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
