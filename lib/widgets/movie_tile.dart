import 'package:flutter/material.dart';


class MediaCard extends StatelessWidget {
  final String title;
  final String imagePath; // Use asset or network path
  final VoidCallback onPressed;

  const MediaCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imagePath,
              width: 140,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          // Title
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Play Icon
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.play_circle_fill, color: Colors.white, size: 32),
          ),
        ],
      ),
    );
  }
}

