import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduha/common/color_values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('user')
              .snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Lottie.asset(
                  'assets/lottie/cubes_loader.json',
                  height: 220.h,
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.only(top: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: snapshot.data!.docs
                      .map(
                        (e) => Column(
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
                                  radius: 40.h,
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
                                      style: theme.subtitle1,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      e['email'],
                                      style: theme.bodyText1,
                                    ),
                                  ],
                                ),
                              ],
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
                                Navigate.navigatorPushAndRemove(context, const JoinView());
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
