import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:daily_things/controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  // const MainPage({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = NotchBottomBarController(
        index: Provider.of<BottomNavController>(context).selectedIndex);
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      //Bottomnavigation bar fluttergems il ninu eduth idenm
      // bottomNavigationBar: AnimatedNotchBottomBar(
      //     showLabel: false,
      //     notchBottomBarController: controller,
      //     bottomBarItems: [
      //       BottomBarItem(
      //         inActiveItem: Icon(
      //           Icons.home_filled,
      //           color: Colors.blueGrey,
      //         ),
      //         activeItem: Icon(
      //           Icons.home_filled,
      //           color: Colors.blueAccent,
      //         ),
      //         itemLabel: 'Page 1',
      //       ),
      //       BottomBarItem(
      //         inActiveItem: Icon(
      //           Icons.category,
      //           color: Colors.blueGrey,
      //         ),
      //         activeItem: Icon(
      //           Icons.category,
      //           color: Colors.blueAccent,
      //         ),
      //         itemLabel: 'Page 2',
      //       ),
      //       BottomBarItem(
      //         inActiveItem: Icon(
      //           Icons.search,
      //           color: Colors.blueGrey,
      //         ),
      //         activeItem: Icon(
      //           Icons.search,
      //           color: Colors.blueAccent,
      //         ),
      //         itemLabel: 'Page 1',
      //       ),
      //     ],
      //     onTap: Provider.of<BottomNavController>(context).onItemTap,
      //     kIconSize: 24,
      //     kBottomRadius: 20),
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
