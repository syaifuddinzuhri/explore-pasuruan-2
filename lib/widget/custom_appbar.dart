import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: mBackgroundColor,
        title: Container(
            width: 110,
            child: Image.asset("assets/images/logo.png", fit: BoxFit.fill)),
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: mSubtitleColor),
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Profile'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              })
        ]);
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Profile':
        break;
    }
  }
}
