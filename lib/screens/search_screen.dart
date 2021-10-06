import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        title: SvgPicture.asset('assets/svg/explore_pasuruan_logo.svg'),
        elevation: 0,
      ),
      body: Center(
        child: Text('Halaman Pencarian'),
      ),
    );
  }
}
