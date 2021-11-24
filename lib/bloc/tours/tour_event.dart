abstract class TourEvent {}

class GetAllTours extends TourEvent {}

class GetDetailTour extends TourEvent {
  final int id;

  GetDetailTour(this.id);
}
