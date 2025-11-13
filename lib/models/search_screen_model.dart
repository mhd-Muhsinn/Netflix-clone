import 'package:netflix/models/home_page_model.dart';

class SearchScreenModel {
  final List<MovieH> serachmovies;

  SearchScreenModel({required this.serachmovies});

  factory SearchScreenModel.fromJson(Map<String, dynamic> json) {
    final searchmovies = List<MovieH>.from((json['Movies'] as List)
        .map((x) => MovieH.fromJson(x as Map<String, dynamic>)));
    return SearchScreenModel(serachmovies: searchmovies);
  }
}
