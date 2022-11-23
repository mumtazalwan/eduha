import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduha/model/course_learning.dart';
import 'package:eduha/model/mission.dart';
import 'package:eduha/ui/widget/item_getStarted_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../service/api_service.dart';
import '../../detail_course/detail_course.dart';
import '../../widget/item_recommended_home.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  CourseLearningModel? _courseLearningModel;
  bool _isLoaded = false;
  Color missionComplete = Colors.green;

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
            ? StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Lottie.asset('assets/lottie/cubes_loader.json',
                          height: 200.h),
                    );
                  } else {
                    var e = snapshot.data!;
                    return SingleChildScrollView(
                        child: Container(
                            margin: EdgeInsets.only(top: 25.h, bottom: 15.h),
                            child: Column(children: [
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${e['progress']}",
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Welcome, ${e.data()!.containsKey('first-name') ? e['first-name'] : 'Student'}",
                                              style: GoogleFonts.inter(
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5.sp),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(mission[index].missionTitle,
                                              style: mission[index]
                                                          .missionPoint <=
                                                      e['progress']
                                                  ? GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      decoration: TextDecoration
                                                          .lineThrough)
                                                  : GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                          Icon(Icons.check_circle,
                                              color:
                                                  mission[index].missionPoint <=
                                                          e['progress']
                                                      ? missionComplete
                                                      : Colors.grey)
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                            padding: EdgeInsets.only(
                                                left: 5.w, right: 20.w),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _courseLearningModel!
                                                .courseFoundation.length,
                                            itemBuilder: (BuildContext contex,
                                                int index) {
                                              return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailCourseView(
                                                          id: _courseLearningModel!
                                                              .courseFoundation[
                                                                  index]
                                                              .materialId,
                                                          title: _courseLearningModel!
                                                              .courseFoundation[
                                                                  index]
                                                              .foundationName,
                                                          desc: _courseLearningModel!
                                                              .courseFoundation[
                                                                  index]
                                                              .description,
                                                          img: _courseLearningModel!
                                                              .courseFoundation[
                                                                  index]
                                                              .coursePath,
                                                          titleLearningPath:
                                                              'Math Foundation',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Recommended(
                                                    category:
                                                        _courseLearningModel!
                                                            .courseFoundation[
                                                                index]
                                                            .coursePath,
                                                    course_name:
                                                        _courseLearningModel!
                                                            .courseFoundation[
                                                                index]
                                                            .foundationName,
                                                    course_desc:
                                                        _courseLearningModel!
                                                            .courseFoundation[
                                                                index]
                                                            .description,
                                                    image: _courseLearningModel!
                                                        .courseFoundation[index]
                                                        .coursePath,
                                                  ));
                                            }),
                                      )
                                    ]),
                              ),
                            ])));
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
