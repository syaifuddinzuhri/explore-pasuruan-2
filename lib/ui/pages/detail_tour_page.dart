import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject/bloc/tours/tour_bloc.dart';
import 'package:miniproject/bloc/tours/tour_event.dart';
import 'package:miniproject/bloc/tours/tour_state.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/ui/pages/tour_page.dart';

class DetailTourPage extends StatefulWidget {
  final int id;
  // final String param;

  DetailTourPage(this.id);

  @override
  State<DetailTourPage> createState() => _DetailTourPageState();
}

class _DetailTourPageState extends State<DetailTourPage> {
  var top = 0.0;

  late TourBloc tourBloc;

  @override
  void initState() {
    super.initState();
    tourBloc = BlocProvider.of<TourBloc>(context);
    tourBloc.add(GetDetailTour(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourBloc, TourState>(
      builder: (context, state) {
        if (state is TourLoadingState) {
          return Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator());
        } else if (state is TourLoadedDetailState) {
          return Scaffold(
              body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                          expandedHeight: 200.0,
                          floating: false,
                          pinned: true,
                          backgroundColor: mBackgroundColor,
                          automaticallyImplyLeading: false,
                          leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: mSubtitleColor,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => TourPage()),
                                  (Route<dynamic> route) => false);
                            },
                          ),
                          flexibleSpace: LayoutBuilder(builder:
                              (BuildContext context,
                                  BoxConstraints constraints) {
                            top = constraints.biggest.height;
                            return FlexibleSpaceBar(
                                title: AnimatedOpacity(
                                    duration: Duration(milliseconds: 200),
                                    opacity: top <= 80.0 ? 1.0 : 0.0,
                                    // opacity: 1.0,
                                    child: Text(state.tour.name.toString(),
                                        style: TextStyle(color: mBlueColor))),
                                background:
                                    Image.network(state.tour.image.toString()));
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
                          state.tour.name.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: mBlueColor),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          state.tour.location.toString(),
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
                                  state.tour.address.toString(),
                                  style: TextStyle(
                                      color: mTitleColor, fontSize: 14),
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
                                    blurRadius: 2,
                                    color: Colors.black26,
                                    spreadRadius: 1)
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(height: 5),
                                    Text(state.tour.open.toString())
                                  ],
                                )),
                                Flexible(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Tiket',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    SizedBox(height: 5),
                                    Text(state.tour.ticket.toString())
                                  ],
                                )),
                              ],
                            )),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Deskripsi",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(state.tour.description.toString()),
                      ],
                    ),
                  )));
        } else if (state is TourErrorState) {
          return Text(state.message.toString());
        } else {
          return Container();
        }
      },
    );
  }
}
