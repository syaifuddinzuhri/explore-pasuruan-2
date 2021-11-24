import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/style_constant.dart';
import 'package:miniproject/ui/widgets/carousel_widget.dart';
import 'package:miniproject/ui/widgets/category_widget.dart';
import 'package:miniproject/ui/widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi, Syaifuddin Zuhri 👋!',
                  style: mTitleStyle,
                ),
                CarouselWidget(),
                CategoryWidget(),
                // PopularTour(),
              ],
            ),
          ),
        ));
  }
}
