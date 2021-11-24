import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject/bloc/tours/tour_bloc.dart';
import 'package:miniproject/bloc/tours/tour_event.dart';
import 'package:miniproject/bloc/tours/tour_state.dart';
import 'package:miniproject/constants/color_constant.dart';
import 'package:miniproject/ui/widgets/custom_appbar.dart';
import 'package:miniproject/ui/widgets/tours_widget.dart';

class TourPage extends StatefulWidget {
  const TourPage({Key? key}) : super(key: key);

  @override
  _TourPageState createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  late TourBloc tourBloc;

  @override
  void initState() {
    super.initState();
    tourBloc = BlocProvider.of<TourBloc>(context);
    tourBloc.add(GetAllTours());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
            width: 110,
            child: Image.asset("assets/images/logo.png", fit: BoxFit.fill)),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: TourSearch(
                        tourBloc: BlocProvider.of<TourBloc>(context)));
              },
              icon: Icon(Icons.search, color: mTitleColor))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          tourBloc.add(GetAllTours());
        },
        child: SingleChildScrollView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: BlocBuilder<TourBloc, TourState>(
            builder: (context, state) {
              if (state is TourLoadingState) {
                return Center(
                  child: Platform.isIOS
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(),
                );
              } else if (state is TourLoadedState) {
                return ToursWidget(tours: state.tours);
              } else if (state is TourErrorState) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class TourSearch extends SearchDelegate<List> {
  TourBloc tourBloc;
  TourSearch({required this.tourBloc});
  String keywordString = "";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    keywordString = query;
    tourBloc.add(SearchTours(query));

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: BlocBuilder<TourBloc, TourState>(
        builder: (context, state) {
          if (state is TourLoadingState) {
            return Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator(),
            );
          } else if (state is TourLoadedState) {
            return state.tours.length == 0
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
                : ToursWidget(tours: state.tours);
          } else if (state is TourErrorState) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
