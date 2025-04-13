import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
   CustomAppbar({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black,
          Colors.transparent
        ]
        )
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24.0),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset("assets/netflix_symbol.png",height: 100,fit: BoxFit.cover,width: 50,),
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
                  _AppBarButton("Movies", () {}),
                  const Spacer(),
                  _AppBarButton('My List', () {}),
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
  final Function function;

  const _AppBarButton(this.title, this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
