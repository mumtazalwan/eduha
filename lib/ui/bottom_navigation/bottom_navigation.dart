import 'package:eduha/ui/bottom_navigation/item/course.dart';
import 'package:eduha/ui/bottom_navigation/item/home.dart';
import 'package:eduha/ui/bottom_navigation/item/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnNavigation extends StatefulWidget {
  const BtnNavigation({Key? key}) : super(key: key);

  @override
  State<BtnNavigation> createState() => _BtnNavigationState();
}

class _BtnNavigationState extends State<BtnNavigation> {
  int _selectedIndex = 0;

  void onTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final tabs = [
    const HomeDashboard(),
    const CourseView(),
    Container(color: Colors.white),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTaped,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12.sp,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12.sp,
        ),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: Colors.grey,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.house,
              color: Colors.black,
            ),
            label: "Home",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.linesLeaning,
              color: Colors.grey,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.linesLeaning,
              color: Colors.black,
            ),
            label: "Courses",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.newspaper,
              color: Colors.grey,
            ),
            activeIcon: FaIcon(FontAwesomeIcons.newspaper, color: Colors.black),
            label: "News",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidUser,
              color: Colors.grey,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.solidUser,
              color: Colors.black,
            ),
            label: "Account",
            tooltip: '',
          ),
        ],
      ),
    );
  }
}
