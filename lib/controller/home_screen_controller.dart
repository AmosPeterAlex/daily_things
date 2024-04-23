import 'dart:convert';
import 'package:daily_things/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  late NewsModel newsModel;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=Apple&from=2024-04-22&sortBy=publishedAt&apiKey=a437c47fc99d4a249ced37151a9199d5");

    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {}; //Map for storing
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      //.body-The body of the response as a string.
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

  //function to launch url
  Future<void> launchURL(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
    notifyListeners();
  }
}
