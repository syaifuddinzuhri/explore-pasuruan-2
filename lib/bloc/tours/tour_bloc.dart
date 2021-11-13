import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject/bloc/tours/tour_event.dart';
import 'package:miniproject/bloc/tours/tour_state.dart';
import 'package:miniproject/data/models/tour_model.dart';
import 'package:miniproject/data/repositories/tour_repository.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  TourRepository repository;

  TourBloc({required this.repository}) : super(TourInitialState());

  TourState get initialState => TourInitialState();

  @override
  Stream<TourState> mapEventToState(TourEvent event) async* {
    if (event is FetchToursEvent) {
      yield TourLoadingState();
      try {
        List<TourModel> tours = await repository.getTours();
        yield TourLoadedState(tours: tours);
      } catch (e) {
        yield TourErrorState(message: e.toString());
      }
    }
  }
}
