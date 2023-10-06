class VideosModel {
  int id;
  List<MovieResult> results;

  VideosModel({
    required this.id,
    required this.results,
  });

  VideosModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        results = List<MovieResult>.from(
            json["results"].map((x) => MovieResult.fromJson(x)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class MovieResult {
  String name;
  String key;
  int size;
  bool official;
  DateTime publishedAt;
  String id;

  MovieResult({
    required this.name,
    required this.key,
    required this.size,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
        name: json["name"],
        key: json["key"],
        size: json["size"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
        "size": size,
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
      };
}
