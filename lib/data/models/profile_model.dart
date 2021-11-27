class ProfileModel {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String photo;

  ProfileModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.phone,
      required this.photo});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        address: json['address'],
        phone: json['phone'],
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['phone'] = phone;
    data['photo'] = photo;
    return data;
  }
}
