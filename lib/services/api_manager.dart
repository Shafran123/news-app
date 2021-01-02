import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_list.dart';

class APIManager {
  Future<NewsModel> getNews() async {
    var httpClient = http.Client();
    var newsModel = null;

    try {
      var response = await httpClient.get('http://newsapi.org/v2/everything?domains=wsj.com&apiKey=638f81c9962646abb47e231d9f8d758f');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
 return newsModel;
        //print(jsonString);
      }
    } catch (Exception) {
      return newsModel;
    }
  }
}
