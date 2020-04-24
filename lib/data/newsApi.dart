import 'package:protect/keys.dart';
import 'package:http/http.dart' as http;
import 'package:protect/models/article_model.dart';
import 'dart:convert';

class News {
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=5fb6507911d749fa900808247964afc6
  List<ArticleModel> news = [];
  String successStatus = 'ok';
  String _baseURL = 'https://newsapi.org/';
  String key = Keys().newsKEY;

  Future<List<ArticleModel>> fetchNews(String query) async {
    var response =
    await http.get('${_baseURL}/v2/everything?${query}&apiKey=${key}');
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == successStatus) {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = new ArticleModel(
              author: element['author'],
              source: element['source']['name'],
              title: element['title'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']);
          news.add(articleModel);
        }
      });
      return news;
    }
  }
}
