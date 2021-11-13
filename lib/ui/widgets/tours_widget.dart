import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/constants/style_constant.dart';
import 'package:miniproject/ui/pages/detail_tour_page.dart';

class ToursWidget extends StatefulWidget {
  final List tours;
  const ToursWidget({Key? key, required this.tours}) : super(key: key);

  @override
  _ToursWidgetState createState() => _ToursWidgetState();
}

class _ToursWidgetState extends State<ToursWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Semua Wisata di Pasuruan',
              style: mTitleStyle,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: widget.tours.length,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          widget.tours[index].image.toString()),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: SvgPicture.asset(
                                  'assets/svg/bottom_gradient.svg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  widget.tours[index].name.toString(),
                                  style: mListTitleStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.tours[index].description.toString(),
                            maxLines: 2,
                            style: mListContentStyle,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.tours[index].location.toString(),
                            style: mListPlaceStyle,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailTourPage(
                              widget.tours[index].id.toString(), 'tour'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
