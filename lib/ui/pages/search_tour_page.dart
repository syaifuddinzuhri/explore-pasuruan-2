import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/constants/style_constant.dart';
import 'package:miniproject/models/tour_model.dart';
import 'package:miniproject/ui/pages/detail_tour_page.dart';

class SearchTourPage extends StatefulWidget {
  const SearchTourPage({Key? key}) : super(key: key);

  @override
  _SearchTourPageState createState() => _SearchTourPageState();
}

class _SearchTourPageState extends State<SearchTourPage> {
  List<TourModel> filteredTour = [];
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          title: Container(
            width: double.infinity,
            child: Center(
              child: TextField(
                autofocus: true,
                controller: _textEditingController,
                focusNode: _textFocusNode,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _textEditingController.clear();
                        setState(() {
                          filteredTour = [];
                        });
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
                onChanged: (val) {
                  setState(() {
                    if (val == "") {
                      filteredTour = [];
                    } else {
                      filteredTour = tours
                          .where((el) => (el.name
                                  .toLowerCase()
                                  .contains(val.toLowerCase()) ||
                              el.location
                                  .toLowerCase()
                                  .contains(val.toLowerCase()) ||
                              el.address
                                  .toLowerCase()
                                  .contains(val.toLowerCase()) ||
                              el.open
                                  .toLowerCase()
                                  .contains(val.toLowerCase()) ||
                              el.ticket
                                  .toLowerCase()
                                  .contains(val.toLowerCase())))
                          .toList();
                    }
                  });
                },
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: _textEditingController.text.isNotEmpty &&
                          filteredTour.length == 0
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset(
                                  "assets/images/404.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                'Data tidak ditemukan. Masukkan keyword lainnya!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _textEditingController.text.isNotEmpty &&
                                  filteredTour.length == 0
                              ? tours.length
                              : filteredTour.length,
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    _textEditingController.text
                                                                .isNotEmpty &&
                                                            filteredTour
                                                                    .length ==
                                                                0
                                                        ? tours[index].image
                                                        : filteredTour[index]
                                                            .image),
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
                                            _textEditingController
                                                        .text.isNotEmpty &&
                                                    filteredTour.length == 0
                                                ? tours[index].name
                                                : filteredTour[index].name,
                                            style: mListTitleStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      _textEditingController.text.isNotEmpty &&
                                              filteredTour.length == 0
                                          ? tours[index].description
                                          : filteredTour[index].description,
                                      maxLines: 2,
                                      style: mListContentStyle,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      _textEditingController.text.isNotEmpty &&
                                              filteredTour.length == 0
                                          ? tours[index].location
                                          : filteredTour[index].location,
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
                                      _textEditingController.text.isNotEmpty &&
                                              filteredTour.length == 0
                                          ? tours[index].id
                                          : filteredTour[index].id,
                                    ),
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
        ));
  }
}
