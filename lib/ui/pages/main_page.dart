import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/ui/pages/home_page.dart';
import 'package:miniproject/ui/pages/profile_page.dart';
import 'package:miniproject/ui/pages/tour_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _pages = <Widget>[
    HomePage(),
    TourPage(),
    ProfilePage(),
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
