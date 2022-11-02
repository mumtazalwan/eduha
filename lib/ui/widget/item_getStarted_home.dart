import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.grey)),
      child: Wrap(
        children: [
          Container(
            height: 150,
            color: Colors.amber,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Logic",
                  style: GoogleFonts.inter(
                      fontSize: 11, fontWeight: FontWeight.w400)),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Elementary Mathematic",
                      style: GoogleFonts.inter(fontSize: 18))),
              Text("widget.course_title",
                  style: GoogleFonts.inter(
                      fontSize: 11, fontWeight: FontWeight.w400))
            ],
          )
        ],
      ),
    );
  }
}
