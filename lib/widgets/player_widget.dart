import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PlayerWidget extends StatelessWidget {
  final String imagepath;

  const PlayerWidget({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          // borderRadius: BorderRadius.circular(6),
          child: Image.network(
            imagepath,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 70,
          left: 160,
          child: Icon(
            Icons.play_circle_fill,
            size: 50,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Row(
            children: const [
              Icon(Iconsax.mirroring_screen, color: Colors.white),
              SizedBox(width: 8),
              Icon(Icons.close, color: Colors.white),
            ],
          ),
        ),
        const Positioned(
          bottom: 8,
          right: 8,
          child: Icon(Icons.volume_down, color: Colors.white),
        ),
      ],
    );
  }
}


//https://run.mocky.io/v3/acc5a6de-5725-451a-98c9-a1ebeaf540d2