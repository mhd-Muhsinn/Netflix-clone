class DownloadPageModel {
  final List<DMovie> downloadingmovies;

  DownloadPageModel({required this.downloadingmovies});

  factory DownloadPageModel.fromJson(Map<String,dynamic> json) {
     final download = List<DMovie>.from((json['Movies'] as List)
        .map((x) => DMovie.fromJson(x as Map<String, dynamic>)));
    return DownloadPageModel(downloadingmovies: download);
  }
}

class DMovie {
  final String title;
  final String thumbnail;
  final String status;

  DMovie({
    required this.title,
    required this.thumbnail,
    required this.status,
  });

  factory DMovie.fromJson(Map<String, dynamic> json) {
    return DMovie(
      title: json['title'] as String,
      thumbnail: json['thumbnail_url'] as String,
      status: json['download_status'] as String,
    );
  }
}
