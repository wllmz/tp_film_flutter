import 'package:flutter/material.dart';

class LikesController extends ChangeNotifier {
  List<Map<String, dynamic>> _favoriteMovies = [];

  List<Map<String, dynamic>> get favoriteMovies => _favoriteMovies;

  bool isLiked(Map<String, dynamic> movie) {
    return _favoriteMovies.contains(movie);
  }

  void toggleLike(Map<String, dynamic> movie) {
    if (isLiked(movie)) {
      _favoriteMovies.remove(movie);
    } else {
      _favoriteMovies.add(movie);
    }
    notifyListeners();
  }
}
