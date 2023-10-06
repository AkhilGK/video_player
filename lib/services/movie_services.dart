import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movies.dart';
import '../utils/apikey.dart';

class MovieService {
  String apiUrl = 'http://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  Future<List<Result>> fetchUpcomingMovies() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      UpcomingMoviesModel upcomingMoviesModel =
          UpcomingMoviesModel.fromJson(data);

      final List<Result> upcomingMovies =
          upcomingMoviesModel.results.map((Result result) {
        return result;
      }).toList();

      return upcomingMovies;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
