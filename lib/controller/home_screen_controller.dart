import 'dart:convert';
import 'package:daily_things/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=ca&category=business&apiKey=a437c47fc99d4a249ced37151a9199d5');
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {}; //Map for storing
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print('API failed');
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
  //function to share
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }
}
