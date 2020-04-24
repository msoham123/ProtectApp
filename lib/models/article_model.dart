import 'package:flutter/cupertino.dart';

class ArticleModel {
  String author;
  String source;
  String title;
  String description;
  String publishedAt;
  String url;
  String urlToImage;
  String content;

  ArticleModel(
      {@required this.author,
      @required this.source,
      @required this.title,
      @required this.description,
      @required this.publishedAt,
      @required this.url,
      @required this.urlToImage,
      @required this.content});
}
