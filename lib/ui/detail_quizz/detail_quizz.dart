import 'package:eduha/model/daily_quizz.dart';
import 'package:eduha/ui/detail_quizz/solution_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../service/api_service.dart';

class DetailQuizz extends StatefulWidget {
  Datum data;

  DetailQuizz({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailQuizz> createState() => _DetailQuizzState();
}

class _DetailQuizzState extends State<DetailQuizz> {

  bool isSubmited = false;
  int? selectedIndex, valueIndex;
  Color basic = Colors.white;
  Color correct = Colors.green;
  Color wrong = Colors.red;
  Color btnColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black),
        title: Text("Daily Challenge"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data.courseName,
                  style: GoogleFonts.inter(
                      fontSize: 12.sp, fontWeight: FontWeight.w400)),
              SizedBox(height: 10.h),
              Text(widget.data.quizName,
                  style: GoogleFonts.inter(
                      fontSize: 30.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              Text(widget.data.miniDescription,
                  style: GoogleFonts.inter(
                      fontSize: 16.sp, fontWeight: FontWeight.w400)),
              SizedBox(height: 15.h),
              Container(
                height: 250.h,
                width: double.infinity,
                // color: Colors.amber,
                child: Image.asset('assets/daily_quizz/${widget.data.quizPath}.png'),
              ),
              SizedBox(height: 25.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Today's Quizz",
                      style: GoogleFonts.inter(
                          fontSize: 26.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.data.question,
                              style: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 40.h),
                          Row(
                            children: [
                              Text("Difficulty : ",
                                  style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600)),
                              RatingBar.builder(
                                initialRating: 1,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: 26.sp,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(
                                  Icons.local_fire_department,
                                  color: Colors.orange,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (BuildContext contex, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (isSubmited == false) {
                                      setState(() {
                                        selectedIndex = index;
                                        valueIndex = widget
                                            .data.dyQuizz[index].isCorrect;
                                      });
                                    } else {
                                      null;
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            widget.data.dyQuizz[index].text,
                                            style: GoogleFonts.inter(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600))),
                                    decoration: BoxDecoration(
                                        color: basic = selectedIndex == index
                                            ? btnColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                );
                              }),
                          SizedBox(height: 20.h),
                          Container(
                            height: 40.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0, primary: Colors.blue),
                                onPressed: () {
                                  if (selectedIndex == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        padding: const EdgeInsets.all(15),
                                        duration: const Duration(seconds: 1),
                                        content: Text(
                                          'Please choose answer first!',
                                          style: GoogleFonts.inter(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    if (valueIndex ==
                                        widget.data.correctAnswear) {
                                      setState(() {
                                        btnColor = Colors.green;
                                        isSubmited = true;
                                      });
                                    } else {
                                      setState(() {
                                        btnColor = Colors.red;
                                        isSubmited = true;
                                      });
                                    }
                                  }
                                },
                                child: Text("Submit")),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            height: 40.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.black, width: 0.5),
                                    elevation: 0,
                                    primary: Colors.white),
                                onPressed: () {
                                  if (isSubmited == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SolutionQuizz(
                                                  question:
                                                      widget.data.question,
                                                  solution:
                                                      widget.data.explanation,
                                                )));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        padding: const EdgeInsets.all(15),
                                        duration: const Duration(seconds: 1),
                                        content: Text(
                                          'Please choose answer first!',
                                          style: GoogleFonts.inter(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Show explanation",
                                  style: GoogleFonts.inter(color: Colors.black),
                                )),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
