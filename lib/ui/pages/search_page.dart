import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject/bloc/tours/tour_bloc.dart';
import 'package:miniproject/bloc/tours/tour_event.dart';
import 'package:miniproject/bloc/tours/tour_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: TourSearch(
                          tourBloc: BlocProvider.of<TourBloc>(context)));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Text('search'));
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
    return IconButton(onPressed: () {}, icon: Icon(Icons.clear));
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
            return Text(state.tours[0].name);
            // return ToursWidget(tours: state.tours);
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
