import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:miniproject/models/carousel_model.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            child: Swiper(
              onIndexChanged: (index) {},
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              viewportFraction: 0.8,
              scale: 0.9,
              itemCount: carousels.length,
              pagination: SwiperPagination(margin: EdgeInsets.all(5.0)),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(carousels[index].image),
                        fit: BoxFit.fill),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
