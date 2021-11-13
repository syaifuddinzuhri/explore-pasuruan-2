import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject/bloc/tours/tour_bloc.dart';
import 'package:miniproject/data/repositories/tour_repository.dart';
import 'package:miniproject/ui/pages/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (BuildContext context) =>
                TourBloc(repository: TourRepositoryImpl()))
      ], child: MainPage()),
    );
  }
}
