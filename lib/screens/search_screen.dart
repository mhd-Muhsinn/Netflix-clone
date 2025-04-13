import 'package:flutter/material.dart';
import 'package:netflix/models/search_screen_model.dart';
import 'package:netflix/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<SearchScreenModel> _searchData;

  @override
  void initState() {
    super.initState();
    _searchData = ApiServices.fetchSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Search Movies'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // --- Search bar ---
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color.fromARGB(255, 65, 65, 65),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
              // You can wire up onChanged or onSubmitted here to refetch/filter
            ),
          ),

          // --- Results list ---
          Expanded(
            child: FutureBuilder<SearchScreenModel>(
              future: _searchData,                              // fetch once in initState :contentReference[oaicite:0]{index=0}
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }

                final movies = snapshot.data?.serachmovies ?? [];
                if (movies.isEmpty) {
                  return const Center(
                    child: Text(
                      'No movies found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.builder(                       // lazy‑build for long lists :contentReference[oaicite:1]{index=1}
                  itemCount: movies.length,
                  itemBuilder: (ctx, index) {
                    final movie = movies[index];
                    return ListTile(
                      leading: movie.thumbnail.isNotEmpty
                          ? Image.network(
                              movie.thumbnail,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.movie, color: Colors.grey),
                      title: Text(
                        movie.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        movie.description!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}