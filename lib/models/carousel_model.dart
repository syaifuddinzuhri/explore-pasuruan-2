class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels = carouselsData
    .map((item) => CarouselModel(item['image'].toString()))
    .toList();

var carouselsData = [
  {"image": "assets/images/matanai.jpg"},
  {"image": "assets/images/tsi.jpg"},
  {"image": "assets/images/cempaka.jpg"},
  {"image": "assets/images/jendelalangit.jpg"},
];
