import 'package:eduha/model/detail_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemLesson extends StatefulWidget {
  int index;
  final String materialName;
  final String cTitle, cDesc, cImg;
  List<Exercise> exercise;

  ItemLesson(
      {Key? key,
      required this.materialName,
      required this.cTitle,
      required this.cDesc,
      required this.cImg,
      required this.exercise,
      this.index = 0})
      : super(key: key);

  @override
  State<ItemLesson> createState() => _ItemLessonState();
}

class _ItemLessonState extends State<ItemLesson> {
  bool _visibility = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.exercise.isNotEmpty) {
      _visibility = true;
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
                  decoration: BoxDecoration(
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    widget.materialName,
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
            height: 210.h,
            child: _visibility
                ? ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 20.w),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 220.w,
                        margin: EdgeInsets.only(right: 20.w),
                        padding: EdgeInsets.all(15),
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
                              widget.cTitle,
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
                              widget.cDesc,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 220.w,
                        margin: EdgeInsets.only(right: 20.w),
                        padding: EdgeInsets.all(15),
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
                          ],
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Container(
                      width: 220.w,
                      margin: EdgeInsets.only(right: 20.w),
                      padding: EdgeInsets.all(15),
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
                            widget.cTitle,
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
                            widget.cDesc,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
