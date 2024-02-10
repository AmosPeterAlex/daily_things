import 'package:daily_things/controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  // const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      //Bottomnavigation bar fluttergems il ninu eduth idenm
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<BottomNavController>(context).selectedIndex,
        onTap:
            Provider.of<BottomNavController>(context, listen: false).onItemTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
/*
Hide This Bottom Nav Bar on Scroll
 */
