import 'dart:convert';

import 'package:daily_things/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=a437c47fc99d4a249ced37151a9199d5");

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = NewsModel.fromJson(decodedData);
      } else {
        print("Api failed");
        // Handle the failure case as needed.
      }
    } catch (e) {
      print("Error: $e");
      // Handle the error case as needed.
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
