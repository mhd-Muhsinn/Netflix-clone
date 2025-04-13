import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieContainers extends StatelessWidget {
  String imageUrl;
  MovieContainers({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 160,
          width: 120,
        ),
      ),
    );
  }
}
