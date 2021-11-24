class TourModel {
  final int id;
  final String name;
  final String description;
  final String location;
  final String address;
  final String open;
  final String ticket;
  final String image;

  TourModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.location,
      required this.address,
      required this.open,
      required this.ticket,
      required this.image});

  factory TourModel.fromJson(Map<String, dynamic> json) => TourModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        location: json['location'],
        address: json['address'],
        open: json['open'],
        ticket: json['ticket'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['location'] = location;
    data['address'] = address;
    data['open'] = open;
    data['ticket'] = ticket;
    data['image'] = image;
    return data;
  }
}
