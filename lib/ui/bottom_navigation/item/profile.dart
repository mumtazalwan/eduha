import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduha/common/color_values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../common/navigate.dart';
import '../../sign_up/join.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Lottie.asset(
                  'assets/lottie/cubes_loader.json',
                  height: 200.h,
                ),
              );
            } else {
              var e = snapshot.data!;
              return Container(
                margin: EdgeInsets.only(top: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: GoogleFonts.inter(
                          fontSize: 24.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        ProfilePicture(
                          name: e['full-name'],
                          radius: 35.h,
                          fontsize: 20.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['full-name'],
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Icon(Icons.add,
                                    size: 16.sp, color: Colors.blueAccent),
                                SizedBox(width: 5.w),
                                Text(
                                  'Add Status',
                                  style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      color: Colors.blueAccent),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Icon(Icons.supervised_user_circle, size: 22.sp),
                                SizedBox(width: 20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Username",
                                      style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(e['full-name'],
                                        style: GoogleFonts.inter(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 5.h),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Divider(
                              color: Colors.black,
                              thickness: 0.4,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Icon(Icons.cake, size: 22.sp),
                                SizedBox(width: 20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Birth Date",
                                      style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("10 Maret 2006",
                                        style: GoogleFonts.inter(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 5.h),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Divider(
                              color: Colors.black,
                              thickness: 0.4,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Icon(Icons.email, size: 22.sp),
                                SizedBox(width: 20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(e['email'],
                                        style: GoogleFonts.inter(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 5.h),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Divider(
                              color: Colors.black,
                              thickness: 0.4,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Icon(Icons.join_left, size: 22.sp),
                                SizedBox(width: 20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Join",
                                      style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                        DateFormat('EEEE, d MMM yyyy').format(
                                            (e['created-at'] as Timestamp)
                                                .toDate()),
                                        style: GoogleFonts.inter(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 5.h),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Divider(
                              color: Colors.black,
                              thickness: 0.4,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorValues.red,
                      ),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        await GoogleSignIn().signOut();
                        if (!mounted) return;
                        Navigate.navigatorPushAndRemove(
                            context, const JoinView());
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
