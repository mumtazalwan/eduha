import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SolutionQuizz extends StatefulWidget {
  String question, solution;

  SolutionQuizz({Key? key, required this.question, required this.solution})
      : super(key: key);

  @override
  State<SolutionQuizz> createState() => _SolutionQuizzState();
}

class _SolutionQuizzState extends State<SolutionQuizz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black),
        title: Text("Explanation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                width: double.infinity,
                child: Text(widget.question,
                    style: GoogleFonts.inter(
                        fontSize: 18.sp, fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 15.h),
              Text("Solution", style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold)),
              SizedBox(height: 15.h),
              Text(widget.solution, style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ),
    );
  }
}
