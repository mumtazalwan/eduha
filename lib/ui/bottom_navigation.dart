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
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.red),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.green),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueAccent)
        ],
      ),
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
                icon: FaIcon(FontAwesomeIcons.calendarDays, color: Colors.grey),
                activeIcon: FaIcon(FontAwesomeIcons.calendarDays, color: Colors.black),
                label: "Account"),
          ],
        ),
      ),
    );
  }
}
