import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lr_api_test/model/countries_state_model.dart';
import 'package:lr_api_test/model/world_state_model.dart';
import 'package:lr_api_test/services/utilities/app_url.dart';

class StateServices {
  Future<WorldState> getAllData() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return WorldState.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }
  Future<List<CountriesState>> getCountriesData() async {
    final response = await http.get(Uri.parse(AppUrl.countriesListUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
//print(jsonData);
      List<CountriesState> data = jsonData.map((e) => CountriesState.fromJson(e)).toList();
      print(data);
      return data;
    } else {
      throw Exception("Error fetching countries data");
    }
  }

}
