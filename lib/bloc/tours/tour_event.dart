import 'package:equatable/equatable.dart';

abstract class TourEvent extends Equatable {}

class FetchToursEvent extends TourEvent {
  @override
  List<Object> get props => [];
}
