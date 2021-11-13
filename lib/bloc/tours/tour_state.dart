import 'package:equatable/equatable.dart';
import 'package:miniproject/data/models/tour_model.dart';

abstract class TourState extends Equatable {}

class TourInitialState extends TourState {
  @override
  List<Object> get props => [];
}

class TourLoadingState extends TourState {
  @override
  List<Object> get props => [];
}

class TourLoadedState extends TourState {
  List<TourModel> tours;

  TourLoadedState({required this.tours});

  @override
  List<Object> get props => [tours];
}

class TourErrorState extends TourState {
  String message;

  TourErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
