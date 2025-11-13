class HomePageModel {
  final List<MovieH> trendingMovies;
  final List<Category> categories;

  HomePageModel({
    required this.trendingMovies,
    required this.categories,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    final trending = List<MovieH>.from(
      (json['trending_movies'] as List)
          .map((x) => MovieH.fromJson(x as Map<String, dynamic>)),
    );
    final cats = (json['categories'] as List)
        .map((c) => Category.fromJson(c as Map<String, dynamic>))
        .toList();

    return HomePageModel(
      trendingMovies: trending,
      categories: cats,
    );
  }
}

class Category {
  final String name;
  final List<MovieH> movies;

  Category({
    required this.name,
    required this.movies,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      movies: List<MovieH>.from(
        (json['items'] as List)
            .map((x) => MovieH.fromJson(x as Map<String, dynamic>)),
      ),
    );
  }
}

class MovieH {
  final String title;
  final String thumbnail;
  final String? description;

  MovieH({
    required this.title,
    required this.thumbnail,
    this.description,
  });

  factory MovieH.fromJson(Map<String, dynamic> json) {
    return MovieH(
      title: json['title'] as String,
      thumbnail: json['thumbnail_url'] as String,
      description: json['description'] as String?,
    );
  }
}
