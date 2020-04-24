import 'package:flutter/material.dart';
import 'package:protect/data/newsApi.dart';

class NewsScreen extends StatefulWidget {

  final searchQuery;

  NewsScreen({@required this.searchQuery});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  bool _loading;
  var newsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNews();
  }

  void fetchNews() async {
    News news = new News();
    newsList = await news.fetchNews(widget.searchQuery);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text('ProtectNews'),
        automaticallyImplyLeading: true,
        elevation: 0.0,
      ),
      body: SafeArea(
      ),
    );
  }
}
