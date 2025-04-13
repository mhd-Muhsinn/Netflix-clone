import 'package:flutter/material.dart';

class ContinueWatchingCard extends StatelessWidget {
  final String imageUrl;

  const ContinueWatchingCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 160,
                  width: 120,
                ),
              ),
              Icon(Icons.play_circle_fill, color: Colors.white, size: 40),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 4,
                  width: 120,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.info_outline, color: Colors.white),
              Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
