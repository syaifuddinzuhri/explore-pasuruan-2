import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: Text('Halaman Home'),
      ),
    );
  }
}
