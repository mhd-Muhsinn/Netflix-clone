import 'package:http/http.dart' as http;
import 'package:netflix/models/home_page_model.dart';

class SearchScreenModel {
  final List<Movie> serachmovies;

  SearchScreenModel({required this.serachmovies});

  factory SearchScreenModel.fromJson(Map<String, dynamic> json) {
    final searchmovies = List<Movie>.from((json['Movies'] as List)
        .map((x) => Movie.fromJson(x as Map<String, dynamic>)));
    return SearchScreenModel(serachmovies: searchmovies);
  }
}
