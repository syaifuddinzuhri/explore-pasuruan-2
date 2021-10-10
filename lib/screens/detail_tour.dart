import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/models/popular_model.dart';
import 'package:miniproject/models/tour_model.dart';

class DetailTourScreen extends StatefulWidget {
  final String id;
  final String param;

  DetailTourScreen(this.id, this.param);

  @override
  State<DetailTourScreen> createState() => _DetailTourScreenState();
}

class _DetailTourScreenState extends State<DetailTourScreen> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    final item;
    // item = tours.firstWhere((el) => el.id == id);

    switch (widget.param) {
      case 'tour':
        item = tours.firstWhere((el) => el.id == widget.id);
        break;
      case 'popular':
        item = populars.firstWhere((el) => el.id == widget.id);
        break;
      default:
        item = tours.firstWhere((el) => el.id == widget.id);
        break;
    }

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: mBackgroundColor,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: mSubtitleColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: top <= 80.0 ? 1.0 : 0.0,
                        // opacity: 1.0,
                        child: Text(item.name,
                            style: TextStyle(color: mBlueColor))),
                    background: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    ));
              })),
        ];
      },
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: mBlueColor),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              item.location,
              style: TextStyle(color: Colors.orange),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.my_location,
                  size: 16,
                ),
                Flexible(
                  child: new Container(
                    padding: new EdgeInsets.only(left: 4.0),
                    child: new Text(
                      item.address,
                      style: TextStyle(color: mTitleColor, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                decoration: BoxDecoration(
                  color: mFillColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: mBorderColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, color: Colors.black26, spreadRadius: 1)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Jam Buka',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        SizedBox(height: 5),
                        Text(item.open)
                      ],
                    )),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tiket',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        SizedBox(height: 5),
                        Text(item.ticket)
                      ],
                    )),
                  ],
                )),
            SizedBox(
              height: 16,
            ),
            Text(
              "Deskripsi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 6,
            ),
            Text(item.description),
          ],
        ),
      ),
    ));
  }
}
