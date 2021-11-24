import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject/bloc/tours/tour_event.dart';
import 'package:miniproject/bloc/tours/tour_state.dart';
import 'package:miniproject/data/models/tour_model.dart';
import 'package:miniproject/data/repositories/tour_repository.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  TourRepository tourRepository;

  TourBloc({required this.tourRepository}) : super(TourInitialState());

  TourState get initialState => TourInitialState();

  @override
  Stream<TourState> mapEventToState(TourEvent event) async* {
    if (event is GetAllTours) {
      yield TourLoadingState();
      try {
        List<TourModel> tours = await tourRepository.getTours();
        yield TourLoadedState(tours: tours);
      } catch (e) {
        yield TourErrorState(message: e.toString());
      }
    }
    if (event is GetDetailTour) {
      yield TourLoadingState();
      try {
        TourModel tour =
            await tourRepository.getDetailTour(event.id.toString());
        yield TourLoadedDetailState(tour: tour);
      } catch (e) {
        yield TourErrorState(message: e.toString());
      }
    }
  }
}
