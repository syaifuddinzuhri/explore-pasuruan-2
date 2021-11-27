import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:miniproject/data/models/profile_model.dart';
import 'package:miniproject/res/string/app_string.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  // Get User profile
  Future<ProfileModel> getProfile() async {
    var response = await http.get(Uri.parse(AppStrings.baseUrl + '/user'));
    if (response.statusCode == 200) {
      ProfileModel user =
          ProfileModel.fromJson(json.decode(response.body)['data']);

      return user;
    } else {
      throw Exception();
    }
  }
}
