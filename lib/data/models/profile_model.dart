class ProfileModel {
  String? id;
  String? name;
  String? email;
  String? address;
  String? company;
  String? photo;

  ProfileModel(
      {this.id, this.name, this.email, this.address, this.company, this.photo});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        address: json['address'],
        company: json['company'],
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['company'] = company;
    data['photo'] = photo;
    return data;
  }
}
