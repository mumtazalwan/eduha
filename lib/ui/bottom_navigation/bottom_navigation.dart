import 'package:eduha/ui/bottom_navigation/item/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BtnNavigation extends StatefulWidget {
  const BtnNavigation({Key? key}) : super(key: key);

  @override
  State<BtnNavigation> createState() => _BtnNavigationState();
}

class _BtnNavigationState extends State<BtnNavigation> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final tabs = [
    Container(
        color: Colors.white),
    Container(
        color: Colors.white),
    Container(
        color: Colors.white),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTaped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house, color: Colors.grey),
                activeIcon: FaIcon(FontAwesomeIcons.house, color: Colors.black),
                label: "Home"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.linesLeaning, color: Colors.grey),
                activeIcon:
                    FaIcon(FontAwesomeIcons.linesLeaning, color: Colors.black),
                label: "Courses"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.newspaper, color: Colors.grey),
                activeIcon:
                    FaIcon(FontAwesomeIcons.newspaper, color: Colors.black),
                label: "News"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user, color: Colors.grey),
                activeIcon: FaIcon(FontAwesomeIcons.solidUser, color: Colors.black),
                label: "Account"),
          ],
        ),
      ),
    );
  }
}
