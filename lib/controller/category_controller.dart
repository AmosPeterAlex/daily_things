import 'dart:convert';

import 'package:daily_things/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryScreenController with ChangeNotifier {
  List<String> categoryList = [
    "General",
    "Sports",
    "Business",
    "Entertainment",
    "Health",
    "Science",
    "Technology",
    "Politics"
  ];
  String category = 'business';

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late NewsModel newsModel;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=ca&category=$category&apiKey=a437c47fc99d4a249ced37151a9199d5');
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
