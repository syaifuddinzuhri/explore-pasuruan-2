class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels = carouselsData
    .map((item) => CarouselModel(item['image'].toString()))
    .toList();

var carouselsData = [
  {"image": "assets/images/tours/tsi.jpg"},
  {"image": "assets/images/tours/cempaka.jpg"},
  {"image": "assets/images/tours/jendelalangit.jpg"},
];
