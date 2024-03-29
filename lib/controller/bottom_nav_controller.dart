import 'package:daily_things/view/screens/category_screen.dart';
import 'package:daily_things/view/screens/home_screen.dart';
import 'package:daily_things/view/screens/search_screen.dart';
import 'package:flutter/material.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [HomeScreen(), CategoryScreen(), SearchScreen()];
}
