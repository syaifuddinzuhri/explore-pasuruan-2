import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/style_constant.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/hero.png"),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 3,
            ),
            Positioned(
                bottom: -90,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          spreadRadius: 5)
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 85,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                    ),
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 120,
        ),
        Text(
          "Syaifuddin Zuhri",
          style: mCardTitleStyle2,
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
          style: mTitleStyle,
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
    );
  }
}
