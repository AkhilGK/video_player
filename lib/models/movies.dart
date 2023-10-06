class UpcomingMoviesModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  UpcomingMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  UpcomingMoviesModel.fromJson(Map data)
      : page = data['page'] ?? 0,
        results = data['results'] == null
            ? []
            : List<Result>.from(data['results'].map((item) {
                Result result = Result.fromJson(item);
                return result;
              })),
        totalPages = data['total_pages'] ?? 0,
        totalResults = data['total_results'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['page'] = page;
    data['results'] = results.map((Result result) => result.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;

    return data;
  }
}

class Result {
  final bool? adults;
  final String backdropPath;
  final int id;
  final String? title;
  final String originalLanguage;
  final String? originalTitle;
  final String overview;
  final String? posterPath;
  final String? mediaType;
  final List genreId;
  final double popularity;
  final String? releaseDate;
  final bool? video;
  final num voteAverage;
  final int? voteCount;

  Result.fromJson(Map data)
      : adults = data["adults"],
        backdropPath = data["backdrop_path"],
        id = data["id"],
        title = data["title"],
        originalLanguage = data["original_language"],
        originalTitle = data["original_title"],
        overview = data["overview"],
        posterPath = data["poster_path"],
        mediaType = data["media_type"],
        genreId = data["genre_ids"],
        popularity = data["popularity"],
        releaseDate = data["release_date"],
        video = data["video"],
        voteAverage = data["vote_average"],
        voteCount = data["vote_count"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adults"] = adults;
    data["backdrop_path"] = backdropPath;
    data["id"] = id;
    data["title"] = title;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["media_type"] = mediaType;
    data["genre_ids"] = genreId;
    data["popularity"] = popularity;
    data["release_date"] = releaseDate;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
