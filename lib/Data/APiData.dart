import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Models/Article.dart';

class ApiData {
  String category;
  ApiData({this.category});
  var response;
  String apiKey = '8d62505d99f54ba5adeb47e6beec7a4a';
  String baseUrl = 'https://newsapi.org/v2/top-headlines?';
  List<Article> articles = [];
  Future<List<Article>> fetchDataFromAPI(String countery) async {
    response = category == null
        ? await http.get('${baseUrl}country=$countery&apikey=$apiKey')
        : await http.get(
            '${baseUrl}country=$countery&category=$category&apikey=$apiKey');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final detailsArticles = body['articles'] as List<dynamic>;
      for (int i = 0; i < detailsArticles.length; i++) {
        articles.add(
          Article(
              title: detailsArticles[i]['title'],
              description: detailsArticles[i]['description'],
              imageUrl: detailsArticles[i]['urlToImage'],
              contentUrl: detailsArticles[i]['url'],
              publishedAt: detailsArticles[i]['publishedAt']),
        );
      }
      return articles;
    } else
      throw Exception();
  }
}
