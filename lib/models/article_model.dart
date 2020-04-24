import 'package:flutter/cupertino.dart';

class ArticleModel {
  String author;
  String source;
  String title;
  String url;
  String urlToImage;
  String content;

  ArticleModel(
      {@required author,
      @required source,
      @required title,
      @required url,
      @required urlToImage,
      @required content});
}
