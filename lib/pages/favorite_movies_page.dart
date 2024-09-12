import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/likes_controller.dart';
import '../widgets/drawer.dart';
import '../widgets/movie_card.dart';

class FavoriteMoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Films Favoris'),
      ),
      drawer: CustomDrawer(
        selectedIndex: 1,
        onItemTapped: (index) {},
      ),
      body: Consumer<LikesController>(
        builder: (context, likesController, child) {
          final favoriteMovies = likesController.favoriteMovies;
          return favoriteMovies.isEmpty
              ? const Center(child: Text('Aucun film favori.'))
              : GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies[index];
              return MovieCard(movie: movie);
            },
          );
        },
      ),
    );
  }
}
