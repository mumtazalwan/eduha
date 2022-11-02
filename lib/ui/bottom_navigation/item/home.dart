import 'package:eduha/ui/widget/item_getStarted_home.dart';
import 'package:eduha/ui/widget/item_recommended_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30.h, bottom: 15.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        // child: CustCircularPercent(),
                        ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Welcome, Alwan!",
                              style: GoogleFonts.inter(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          Flexible(
                              child: Text(
                            "Take your first steps to bilding ",
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Menyelesaikan pre-algebra",
                              style: GoogleFonts.inter(
                                  fontSize: 12, fontWeight: FontWeight.w400)),
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
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 5.w, right: 20.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext contex, int index) {
                            return GestureDetector(
                                onTap: () {}, child: Recommended());
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
