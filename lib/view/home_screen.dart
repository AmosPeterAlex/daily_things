import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Today'),
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
    );
  }
}
