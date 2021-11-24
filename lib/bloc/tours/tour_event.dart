abstract class TourEvent {}

class GetAllTours extends TourEvent {}

class SearchTours extends TourEvent {
  final String keyword;

  SearchTours(this.keyword);
}

class GetDetailTour extends TourEvent {
  final int id;

  GetDetailTour(this.id);
}
