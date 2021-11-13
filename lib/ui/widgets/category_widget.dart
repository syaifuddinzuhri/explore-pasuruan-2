import 'package:flutter/cupertino.dart';
import 'package:miniproject/constants/style_constant.dart';
import 'package:miniproject/ui/widgets/single_card_category.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Kategori Wisata Terpopuler',
            style: mTitleStyle,
          ),
        ),
        Container(
          height: 144,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SingleCardCategory(
                      'Air Terjun', 'Wisata Air Terjun', 'waterfall.png'),
                  SingleCardCategory('Gunung', 'Pegunungan', 'mountains.png'),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  SingleCardCategory(
                      'Kebun', 'Budidaya', 'hydroponic-gardening.png'),
                  SingleCardCategory('Kopian', 'Tempat Kopian', 'latte.png'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
