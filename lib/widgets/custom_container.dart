import 'package:flutter/material.dart';

class CustomNetflixContainer extends StatelessWidget {
  final String backgroundImage;
  final String title;
  final String subtitle;

  const CustomNetflixContainer({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image using Image.network
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.network(
            backgroundImage,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                backgroundImage,
                fit: BoxFit.cover,
              );
            },
          ),
        ),

        // Gradient Overlay
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
        ),

        // Content
        Positioned(
          bottom: 40,
          left: 90,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "      $subtitle",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.add, color: Colors.white),
                  const SizedBox(width: 38),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow, color: Colors.black),
                    label: const Text('Play'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 38),
                  const Icon(Icons.info_outline, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
