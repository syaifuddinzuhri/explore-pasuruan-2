import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:miniproject/data/models/tour_model.dart';
import 'package:miniproject/res/string/app_string.dart';

abstract class TourRepository {
  Future<List<TourModel>> getTours();
  Future<TourModel> getDetailTour(String id);
}

class TourRepositoryImpl implements TourRepository {
  // Get All Tours
  @override
  Future<List<TourModel>> getTours() async {
    var response = await http.get(Uri.parse(AppStrings.baseUrl + '/tour'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      List<TourModel> tours =
          data.map((val) => TourModel.fromJson(val)).toList();
      return tours;
    } else {
      throw Exception();
    }
  }

  // Get Detail Tour
  Future<TourModel> getDetailTour(id) async {
    var response =
        await http.get(Uri.parse(AppStrings.baseUrl + '/tour/' + id));
    if (response.statusCode == 200) {
      TourModel tour = TourModel.fromJson(json.decode(response.body)['data']);
      return tour;
    } else {
      throw Exception();
    }
  }

  // Update Favorite
  Future<TourModel> updateFavorite(id) async {
    var response = await http
        .get(Uri.parse(AppStrings.baseUrl + '/tour/' + id.toString()));
    if (response.statusCode == 200) {
      TourModel tour = TourModel.fromJson(json.decode(response.body));
      return tour;
    } else {
      throw Exception();
    }
  }
}
