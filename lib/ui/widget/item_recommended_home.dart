import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Recommended extends StatefulWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15.w),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: Colors.grey)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 200,
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
                      child: Text("Abstrac order logic",
                          style: GoogleFonts.inter(fontSize: 18))),
                  Text("There is logic in my mind",
                      style: GoogleFonts.inter(
                          fontSize: 11, fontWeight: FontWeight.w400))
                ],
              )
            ],
          ),
        )
    );
  }
}
