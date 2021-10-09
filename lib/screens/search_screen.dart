import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
        child: Text('Halaman Pencarian'),
      ),
    );
  }
}
