import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/features/home/home_page.dart';
import 'package:recycle_app/features/points/points.dart';
import 'package:recycle_app/features/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTabIndex = 0;

  late HomePage homePage;
  late Points points;
  late Profile profilePage;
  late List<Widget> pages;
  @override
  void initState() {
    homePage = HomePage();
    points = Points();
    profilePage = Profile();

    pages = [homePage, points, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Colors.white, size: 34.0),
          Icon(Icons.point_of_sale, color: Colors.white, size: 34.0),
          Icon(Icons.person, color: Colors.white, size: 34.0),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
