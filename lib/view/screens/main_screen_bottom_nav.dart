import 'package:daily_things/controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  // const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = NotchBottomBarController(
    //     index: Provider.of<BottomNavController>(context).selectedIndex);
    return Scaffold(
      extendBody: true,
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],

      // bottomNavigationBar: AnimatedNotchBottomBar(
      //     showShadow: true,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            currentIndex:
                Provider.of<BottomNavController>(context).selectedIndex,
            backgroundColor: Color(0xffF9E8C9),
            selectedIconTheme: IconThemeData(color: Color(0xff1D24CA)),
            unselectedIconTheme: IconThemeData(color: Color(0xff98ABEE)),
            onTap: Provider.of<BottomNavController>(context, listen: false)
                .onItemTap,
            unselectedLabelStyle: TextStyle(color: Color(0xff201658)),
            unselectedFontSize: 17,
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.houseCrack),
                  label: 'Home',
                  activeIcon: FaIcon(FontAwesomeIcons.house)),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.icons),
                  label: 'Category',
                  activeIcon: FaIcon(FontAwesomeIcons.list)),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  label: 'Search',
                  activeIcon: FaIcon(FontAwesomeIcons.searchengin)),
            ],
          ),
        ),
      ),
    );
  }
}
