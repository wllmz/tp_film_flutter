import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiKey = '6a0c558c';

  Future<Map<String, dynamic>> fetchMovie(String movieName) async {
    final response = await http.get(
      Uri.parse('https://www.omdbapi.com/?apikey=$apiKey&t=$movieName'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movie');
    }
  }

  Future<List<Map<String, dynamic>>> fetchMovies(List<String> movieNames) async {
    List<Map<String, dynamic>> movies = [];

    for (String name in movieNames) {
      Map<String, dynamic> movie = await fetchMovie(name);
      movies.add(movie);
    }

    return movies;
  }
}
