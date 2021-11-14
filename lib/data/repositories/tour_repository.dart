import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:miniproject/data/models/tour_model.dart';
import 'package:miniproject/res/string/app_string.dart';

abstract class TourRepository {
  Future<List<TourModel>> getTours();
  Future<TourModel> getTour();
}

class TourRepositoryImpl implements TourRepository {
  // Get All
  @override
  Future<List<TourModel>> getTours() async {
    var response = await http.get(Uri.parse('http://10.208.95.95:3000/tours'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      List<TourModel> tours =
          data.map((val) => TourModel.fromJson(val)).toList();
      return tours;
    } else {
      throw Exception();
    }
  }

// Get Detail
  @override
  Future<TourModel> getTour() async {
    var response = await http.get(Uri.parse(AppStrings.baseUrl + '/tours/1'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      TourModel tour = TourModel.fromJson(data);
      return tour;
    } else {
      throw Exception();
    }
  }
}
