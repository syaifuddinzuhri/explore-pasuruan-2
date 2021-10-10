import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/widget/custom_appbar.dart';

class DetailTourScreen extends StatelessWidget {
  final int index;

  DetailTourScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
    );
  }
}
