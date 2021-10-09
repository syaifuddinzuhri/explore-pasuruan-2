import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/style_constant.dart';
import 'package:miniproject/widget/carousel_widget.dart';
import 'package:miniproject/widget/category_widget.dart';
import 'package:miniproject/widget/custom_appbar.dart';
import 'package:miniproject/widget/tour_popular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Hi, Syaifuddin Zuhri 👋!',
                    style: mTitleStyle,
                  ),
                ),
                CarouselWidget(),
                CategoryWidget(),
                PopularTour(),
              ],
            ),
          ),
        ));
  }
}
