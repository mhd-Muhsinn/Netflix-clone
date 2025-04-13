import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/models/home_page_model.dart';
import 'package:netflix/models/search_screen_model.dart';

class ApiServices {
  static Future<HomePageModel> fetchData() async {
    final response = await http.get(
      Uri.parse('https://run.mocky.io/v3/432c047d-cafd-47a9-82ef-b86c677e3840'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return HomePageModel.fromJson(jsonData['home_page']);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<SearchScreenModel> fetchSearchData() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/533ff04c-aaca-40f5-8ec3-f26cf59a7d62'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return SearchScreenModel.fromJson(jsonData['Search_page']);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
