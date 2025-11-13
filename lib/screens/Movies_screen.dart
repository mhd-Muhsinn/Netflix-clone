import 'package:flutter/material.dart';
import 'package:netflix/models/movie_page_model.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/movie_containers.dart';
import 'package:netflix/widgets/player_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late Future<MyMovies> _movieData;

  @override
  void initState() {
    super.initState();
    _movieData = ApiServices.fetchMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<MyMovies>(
        future: _movieData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white)),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child:
                  Text('No Data Found', style: TextStyle(color: Colors.white)),
            );
          }

          final myMovies = snapshot.data!;
          final currentMovie = myMovies.current.first;

          return Column(
            children: [
              Material(
                elevation: 10,
                shadowColor: Colors.black,
                child: PlayerWidget(imagepath: currentMovie.image),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentMovie.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow,
                                  color: Colors.black),
                              label: const Text(
                                'Play',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.download,
                                  color: Colors.white),
                              label: const Text(
                                'Download',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2E2E2E),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            currentMovie.description,
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Cast: ${currentMovie.cast}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "Creator: ${currentMovie.creator}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              _ActionButton(icon: Icons.add, label: 'My List'),
                              _ActionButton(
                                  icon: Icons.thumb_up_alt_outlined,
                                  label: 'Rate'),
                              _ActionButton(icon: Icons.send, label: 'Share'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Categories
                    ...myMovies.categories.map((category) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: category.items.length,
                              itemBuilder: (ctx, idx) {
                                final movie = category.items[idx];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: MovieContainers(
                                    imageUrl: movie.thumbnailUrl,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        )
      ],
    );
  }
}
