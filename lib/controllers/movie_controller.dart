import 'package:flutter/material.dart';
import '../services/movie_service.dart';

class MovieController extends ChangeNotifier {
  final MovieService _movieService = MovieService();
  List<Map<String, dynamic>> _movies = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get movies => _movies;
  bool get isLoading => _isLoading;

  MovieController() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    List<String> movieNames = [
      'Inception',
      'The Dark Knight',
      'Interstellar',
      'Fight Club',
      'Pulp Fiction',
      'Forrest Gump',
      'The Matrix',
      'Pokemon',
      'The Godfather',
      'American pie',
      'Naruto',
      'Se7en',
      'Gladiator',
      'Avengers: Endgame',
      'Titanic',
    ];

    try {
      List<Map<String, dynamic>> movies = await _movieService.fetchMovies(movieNames);
      _movies = movies;
    } catch (e) {
      print('Erreur: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
