import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:miniproject/data/models/tour_model.dart';
import 'package:miniproject/res/string/app_string.dart';

abstract class TourRepository {
  Future<List<TourModel>> getTours();
  Future<List<TourModel>> searchTours(String string);
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

  // Search
  @override
  Future<List<TourModel>> searchTours(keyword) async {
    Map<String, String> body = {
      'keyword': keyword,
    };
    var url = Uri.parse(AppStrings.baseUrl + '/tour/search');
    var response = await http.post(url, body: body);
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
}
