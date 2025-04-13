class HomePageModel {
  final List<Movie> trendingMovies;
  final List<Category> categories;

  HomePageModel({
    required this.trendingMovies,
    required this.categories,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    // 1️⃣ Parse trending movies
    final trending = List<Movie>.from(
      (json['trending_movies'] as List)
          .map((x) => Movie.fromJson(x as Map<String, dynamic>)),
    );

    // 2️⃣ Parse categories array
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
  final List<Movie> movies;

  Category({
    required this.name,
    required this.movies,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      movies: List<Movie>.from(
        (json['items'] as List)
            .map((x) => Movie.fromJson(x as Map<String, dynamic>)),
      ),
    );
  }
}

class Movie {
  final String title;
  final String thumbnail;
  final String? description;

  Movie({
    required this.title,
    required this.thumbnail,
    this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] as String,
      thumbnail: json['thumbnail_url'] as String,
      description: json['description'] as String?,
    );
  }
}
