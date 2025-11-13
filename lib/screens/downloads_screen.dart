import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix/models/download_page_model.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/download_card.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DownloadsScreen> {
  late Future<DownloadPageModel> _download;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _download = ApiServices.fetchDownloadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Downloads",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: [
            Icon(Iconsax.mirroring_screen, color: Colors.white, size: 25),
            SizedBox(
              width: 10,
            ),
            Icon(Iconsax.user, color: Colors.white, size: 25)
          ]),
      body: FutureBuilder<DownloadPageModel>(
        future:
            _download, 
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

          final movies = snapshot.data?.downloadingmovies ?? [];
          if (movies.isEmpty) {
            return const Center(
              child: Text(
                'No movies found',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (ctx, index) {
              final movie = movies[index];
              return DownloadCard(
                title: movie.title,
                status: movie.status,
                imagePath: movie.thumbnail,
              );
            },
          );
        },
      ),
    );
  }
}
