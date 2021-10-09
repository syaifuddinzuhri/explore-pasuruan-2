import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: Container(
          width: 110,
          child: Image.asset("assets/images/logo.png", fit: BoxFit.fill)),
        elevation: 0,
      ),
      body: Center(
        child: Text('Halaman Profile'),
      ),
    );
  }
}
