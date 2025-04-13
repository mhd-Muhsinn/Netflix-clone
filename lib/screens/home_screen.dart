import 'package:flutter/material.dart';
import 'package:netflix/models/home_page_model.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/app_bar.dart';
import 'package:netflix/widgets/cotinu_watching.dart';
import 'package:netflix/widgets/custom_container.dart';
import 'package:netflix/widgets/movie_containers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<HomePageModel> homePageData;

  @override
  void initState() {
    super.initState();
    homePageData = ApiServices.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 60),
          child: CustomAppbar(),
        ),
        body: SafeArea(
          top: false,
          child: FutureBuilder<HomePageModel>(
            future: homePageData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text('No Data Found'));
              }

              final model = snapshot.data!;
              final trending = model.trendingMovies.first;

              // Build a single ListView that contains:
              // 1. The big trending container
              // 2. One section per Category in model.categories
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  // 1️⃣ Trending
                  CustomNetflixContainer(
                    backgroundImage: trending.thumbnail,
                    title: trending.title,
                    subtitle: trending.description ?? '',
                  ),

                  // 2️⃣ Dynamically render each category
                  ...model.categories.map((category) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category title
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                          child: Text(
                            category.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Horizontal list of movies in this category
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: category.movies.length,
                            itemBuilder: (ctx, idx) {
                              final movie = category.movies[idx];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: category.name == "Continue Watching" ? ContinueWatchingCard(imageUrl: movie.thumbnail): MovieContainers(
                                  imageUrl: movie.thumbnail,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}