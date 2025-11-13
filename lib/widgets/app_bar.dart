import 'package:flutter/material.dart';
import 'package:netflix/screens/Movies_screen.dart';
import 'package:netflix/screens/my_list_screen.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.transparent])),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24.0),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(
              "assets/netflix_symbol.png",
              height: 100,
              fit: BoxFit.cover,
              width: 50,
            ),
            const SizedBox(
              width: 11.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  _AppBarButton("TV Shows", () {}),
                  const Spacer(),
                  _AppBarButton("Movies", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MoviesScreen()),
                    );
                  }),
                  const Spacer(),
                  _AppBarButton('My List', () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyListScreen()),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const _AppBarButton(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
