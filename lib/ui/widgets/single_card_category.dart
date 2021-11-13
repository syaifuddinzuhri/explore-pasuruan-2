import 'package:flutter/cupertino.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/constants/style_constant.dart';

class SingleCardCategory extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;

  const SingleCardCategory(this.title, this.subtitle, this.image);

  @override
  _SingleCardCategoryState createState() => _SingleCardCategoryState();
}

class _SingleCardCategoryState extends State<SingleCardCategory> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 8, right: 8),
        padding: EdgeInsets.only(left: 16),
        height: 64,
        decoration: BoxDecoration(
          color: mFillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mBorderColor, width: 1),
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: Image.asset(
                'assets/images/' + widget.image,
                fit: BoxFit.contain,
                width: 22,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: mServiceTitleStyle,
                  ),
                  Text(
                    widget.subtitle,
                    style: mServiceSubtitleStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
