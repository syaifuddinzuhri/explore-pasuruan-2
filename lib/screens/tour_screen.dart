import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/widget/custom_appbar.dart';

class TourScreen extends StatefulWidget {
  const TourScreen({Key? key}) : super(key: key);

  @override
  _TourScreenState createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Halaman Semua Wisata'),
      ),
    );
  }
}
