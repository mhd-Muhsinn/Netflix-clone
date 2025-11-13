class Movie {
  final String title;
  final String description;
  final String image;
  final String cast;
  final String creator;

  Movie({
    required this.title,
    required this.description,
    required this.image,
    required this.cast,
    required this.creator,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['thumbnail_url'] ?? '',
      cast: json['cast'] ?? '',
      creator: json['creator'] ?? '',
    );
  }
}

class MovieItem {
  final String title;
  final String thumbnailUrl;
  final String? description;

  MovieItem({
    required this.title,
    required this.thumbnailUrl,
    this.description,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      title: json['title'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      description: json['description'],
    );
  }
}

class Category {
  final String name;
  final List<MovieItem> items;

  Category({
    required this.name,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] ?? '',
      items: List<MovieItem>.from(
        json['items'].map((item) => MovieItem.fromJson(item)),
      ),
    );
  }
}

class MyMovies {
  final List<Movie> current;
  final List<Category> categories;

  MyMovies({
    required this.current,
    required this.categories,
  });

  factory MyMovies.fromJson(Map<String, dynamic> json) {
    return MyMovies(
      current: List<Movie>.from(
        json['current'].map((movie) => Movie.fromJson(movie)),
      ),
      categories: List<Category>.from(
        json['categories'].map((cat) => Category.fromJson(cat)),
      ),
    );
  }
}
