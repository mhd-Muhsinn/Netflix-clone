import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/models/download_page_model.dart';
import 'package:netflix/models/home_page_model.dart';
import 'package:netflix/models/movie_page_model.dart';
import 'package:netflix/models/my_list_model.dart';
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
        'https://run.mocky.io/v3/e4fee30b-076c-42c4-902b-8c687d7b9f08'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return SearchScreenModel.fromJson(jsonData['Search_page']);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<DownloadPageModel> fetchDownloadData() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/882c293e-4def-4885-9c9f-92e47ca42feb'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return DownloadPageModel.fromJson(jsonData['download_page']);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<MyMovies> fetchMovieData() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/630507a2-af31-49d6-854e-8070f016569e'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MyMovies.fromJson(jsonData['MyMovies']);
    } else {
      throw Exception('failed to Load Data');
    }
  }

  static Future<MyListModel> fetchlistdata() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/c31e1aa7-3b50-4d08-a7c5-4b4759eb6e35'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return MyListModel.fromJson(jsonData['Mylist_page']);
    } else {
      throw Exception('Failed to Load data');
    }
  }
}
