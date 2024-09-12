import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/movie_controller.dart';
import '../widgets/drawer.dart';
import '../widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page d\'accueil'),
      ),
      drawer: CustomDrawer(
        selectedIndex: 0,
        onItemTapped: (index) {},
      ),
      body: Consumer<MovieController>(
        builder: (context, movieController, child) {
          return movieController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: movieController.movies.length,
            itemBuilder: (context, index) {
              final movie = movieController.movies[index];
              return MovieCard(movie: movie);
            },
          );
        },
      ),
    );
  }
}
