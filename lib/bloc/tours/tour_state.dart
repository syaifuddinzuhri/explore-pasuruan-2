import 'package:miniproject/data/models/tour_model.dart';

abstract class TourState {}

class TourInitialState extends TourState {}

class TourLoadingState extends TourState {}

class TourLoadedState extends TourState {
  List<TourModel> tours;

  TourLoadedState({required this.tours});
}

class TourLoadedDetailState extends TourState {
  TourModel tour;

  TourLoadedDetailState({required this.tour});
}

class TourErrorState extends TourState {
  String message;

  TourErrorState({required this.message});
}
