import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/likes_controller.dart';

class MovieCard extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likesController = Provider.of<LikesController>(context);
    final isLiked = likesController.isLiked(movie);

    return GestureDetector(
      onTap: () => _showMovieDetailsDialog(context),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                movie['Poster'] ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 50);
                },
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            movie['Title'] ?? 'Inconnu',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            'Durée: ${movie['Runtime'] ?? 'N/A'}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            'Année: ${movie['Year'] ?? 'N/A'}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              likesController.toggleLike(movie);
            },
          ),
        ],
      ),
    );
  }

  void _showMovieDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,  // Réduire la taille de la popup
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,  // Centrer tout le contenu
                  children: [
                    Text(
                      movie['Title'] ?? 'Inconnu',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        movie['Poster'] ?? '',
                        fit: BoxFit.contain,  // Ajuste pour que l'image soit centrée
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50);
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Durée : ${movie['Runtime'] ?? 'N/A'}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,  // Centrer le texte
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Année de sortie : ${movie['Year'] ?? 'N/A'}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,  // Centrer le texte
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Réalisateur : ${movie['Director'] ?? 'Inconnu'}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,  // Centrer le texte
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Acteurs : ${movie['Actors'] ?? 'Inconnu'}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,  // Centrer le texte
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Fermer'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Fermer la popup
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
