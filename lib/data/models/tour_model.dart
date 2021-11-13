class TourModel {
  String? id;
  String? name;
  String? description;
  String? location;
  String? address;
  String? open;
  String? ticket;
  String? image;

  TourModel(
      {this.id,
      this.name,
      this.description,
      this.location,
      this.address,
      this.open,
      this.ticket,
      this.image});

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
