import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix/screens/downloads_screen.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:netflix/screens/search_screen.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      bottomNavigationBar:  Container(
        color: Colors.black,
        height: 60,
        child:TabBar(tabs: [
          Tab(icon: Icon(Iconsax.home5),text: "Home"),
          Tab(icon: Icon(Iconsax.search_normal),text: "Search"),
          Tab(icon: Icon(Icons.download),text: "Downloads"),
        ],
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        indicatorColor: Colors.transparent,
        )),
        body: TabBarView(children: [
          HomeScreen(),SearchScreen(),DownloadsScreen()
        ]),
    ));
  }
}
