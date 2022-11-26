import 'package:eduha/common/navigate.dart';
import 'package:eduha/ui/detail_course/detail_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCourseLearning extends StatelessWidget {
  final String title, titleLearningPath, desc, image;
  final int id, length;

  const ItemCourseLearning(
      {Key? key,
      required this.title,
      required this.desc,
      required this.image,
      required this.id,
      required this.titleLearningPath,
      required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigate.navigatorPush(
          context,
          DetailCourseView(
            id: id,
            title: title,
            titleLearningPath: titleLearningPath,
            desc: desc,
            img: image,
            length: length,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.h),
        padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/courses/$image.svg',
                width: 170.w,
                height: 150.h,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              desc,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
