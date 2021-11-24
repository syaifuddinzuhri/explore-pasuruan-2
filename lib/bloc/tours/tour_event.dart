abstract class TourEvent {}

class GetAllTours extends TourEvent {}

class GetDetailTour extends TourEvent {
  final String id;

  GetDetailTour(this.id);
}
