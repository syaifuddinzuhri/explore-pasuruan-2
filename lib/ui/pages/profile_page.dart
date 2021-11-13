import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/hero.png"),
                      fit: BoxFit.cover)),
              child: Container(
                width: double.infinity,
                height: 210,
                child: Container(
                  alignment: Alignment(0.0, 2.5),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Mochammad Syaifuddin Zuhri",
              style: TextStyle(
                  fontSize: 25.0,
                  color: mBlueColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Prigen, Pasuruan",
              style: TextStyle(
                  fontSize: 14,
                  color: mSubtitleColor,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "State Polytechnic of Malang",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    ));
  }
}
