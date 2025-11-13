import 'package:flutter/material.dart';
import 'package:netflix/models/my_list_model.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/my_list_card.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyListScreen> {
  late Future<MyListModel> _listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listdata = ApiServices.fetchlistdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "My List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     
          SizedBox(
            height: 50,
            child: FutureBuilder<MyListModel>(
              future: _listdata,
              builder: (context, snapshot) {
                final movies = snapshot.data?.listmovies ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Center(
                        child: Container(
  padding: const EdgeInsets.all(8), // Padding around the text
  decoration: BoxDecoration(
    color: Colors.grey[800], // Background color (grey)
    borderRadius: BorderRadius.circular(12), // Rounded border
    border: Border.all(
      color: Colors.grey, // Border color (grey)
      width: 1, // Border width
    ),
  ),
  child: Text(
    movie.description,
    style: const TextStyle(
      color: Colors.white, 
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
)

                      ),
                    );
                  },
                );
              },
            ),
          ),

          Expanded(
            child: FutureBuilder<MyListModel>(
              future: _listdata,
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

                final movies = snapshot.data?.listmovies ?? [];
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
                    return MyListCard(
                      title: movie.title,
                      category: movie.description,
                      imagePath: movie.thumbnail,
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
