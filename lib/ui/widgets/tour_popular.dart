import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/constants/style_constant.dart';
import 'package:miniproject/models/popular_model.dart';
import 'package:miniproject/ui/pages/detail_tour_page.dart';

class PopularTour extends StatefulWidget {
  @override
  _PopularTourState createState() => _PopularTourState();
}

class _PopularTourState extends State<PopularTour> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'Wisata Terpopuler',
            style: mTitleStyle,
          ),
        ),
        SizedBox(
          height: 220,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: populars.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(populars[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: SvgPicture.asset(
                                  'assets/svg/bottom_gradient.svg'),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Text(
                                populars[index].name,
                                style: mListTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          populars[index].description,
                          maxLines: 2,
                          style: mListContentStyle,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          populars[index].location,
                          style: mListPlaceStyle,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         DetailTourPage(populars[index].id),
                    //   ),
                    // );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
