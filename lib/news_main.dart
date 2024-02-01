import 'package:daily_things/controller/bottom_nav_controller.dart';
import 'package:daily_things/controller/category_controller.dart';
import 'package:daily_things/controller/home_screen_controller.dart';
import 'package:daily_things/controller/search_screen_controller.dart';
import 'package:daily_things/view/main_screen_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
