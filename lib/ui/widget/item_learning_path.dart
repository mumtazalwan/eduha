import 'package:eduha/common/navigate.dart';
import 'package:eduha/ui/learning_path/learning_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemLearningPath extends StatelessWidget {
  final String title, image;
  final int id;

  const ItemLearningPath(
      {Key? key, required this.title, required this.image, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigate.navigatorPush(context, LearningPathView(id: id,));
      },
      child: Container(
        width: double.infinity,
        height: 120.h,
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.fromLTRB(15.w, 15.w, 0, 15.w),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 180.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LEARNING PATH',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '4 courses',
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/learning_path/$image.svg',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
