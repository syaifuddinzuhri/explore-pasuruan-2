import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/constants/style_constant.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/hero.png"),
                    fit: BoxFit.cover)),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  radius: 60.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            "Syaifuddin Zuhri",
            style: TextStyle(
                fontSize: 25.0,
                color: mBlueColor,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Prigen, Pasuruan",
            style: mTitleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "State Polytechnic of Malang",
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black45,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              elevation: 2.0,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: Text(
                    "Traveller",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ))),
        ],
      ),
    ));
  }
}
