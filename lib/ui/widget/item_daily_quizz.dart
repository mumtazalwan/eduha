import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyQuizzCard extends StatefulWidget {
  String quiz_name, course_name, mini_description, img_path;

  DailyQuizzCard(
      {Key? key, required this.quiz_name, required this.course_name, required this.mini_description, required this.img_path})
      : super(key: key);

  @override
  State<DailyQuizzCard> createState() => _DailyQuizzCardState();
}

class _DailyQuizzCardState extends State<DailyQuizzCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40.h),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.course_name,
                  style: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w400)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(widget.quiz_name,
                      style: GoogleFonts.inter(fontSize: 20))),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
            height: 180.h,
            color: Colors.amber,
            child: Image.asset('assets/daily_quizz/${widget.img_path}.png'),
          ),
          Text(
            widget.mini_description,
            style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
