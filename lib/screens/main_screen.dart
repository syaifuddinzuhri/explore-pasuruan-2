import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/screens/tour_screen.dart';
import 'package:miniproject/screens/home_screen.dart';
import 'package:miniproject/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _pages = <Widget>[
    HomeScreen(),
    TourScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(
              Icons.home,
              color: mBlueColor,
            )),
        BottomNavigationBarItem(
          icon: Icon(Icons.attractions_outlined),
          activeIcon: Icon(Icons.attractions, color: mBlueColor),
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 11.0,
            backgroundImage: AssetImage("assets/images/avatar.jpg"),
          ),
        )
      ]),
      tabBuilder: (ctx, idx) {
        return CupertinoTabView(builder: (ctx) {
          return CupertinoPageScaffold(child: _pages.elementAt(idx));
        });
      },
    );
  }
}
