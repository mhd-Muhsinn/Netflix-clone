import 'package:netflix/models/home_page_model.dart';

class MyListModel {
  final List<Moviel> listmovies;

  MyListModel({required this.listmovies});

  factory MyListModel.fromJson(Map<String, dynamic> json) {
    final searchmovies = List<Moviel>.from((json['Movies'] as List)
        .map((x) => Moviel.fromJson(x as Map<String, dynamic>)));
    return MyListModel(listmovies: searchmovies);
  }
}

class Moviel {
  final String title;
  final String thumbnail;
  final String description;

  Moviel({
    required this.title,
    required this.thumbnail,
    required this.description,
  });

  factory Moviel.fromJson(Map<String, dynamic> json) {
    return Moviel(
      title: json['title'] as String,
      thumbnail: json['thumbnail_url'] as String,
      description: json['category'] as String,
    );
  }
}
