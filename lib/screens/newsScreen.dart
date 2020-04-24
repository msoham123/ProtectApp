import 'package:flutter/material.dart';
import 'package:protect/data/newsApi.dart';
import 'package:protect/components/news_tile.dart';

class NewsScreen extends StatefulWidget {
  final searchQuery;

  NewsScreen({@required this.searchQuery});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool _loading  = true;
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
    print(newsList);
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
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                    itemCount: newsList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        imgUrl: newsList[index].urlToImage ?? "",
                        title: newsList[index].title ?? "",
                        desc: newsList[index].description ?? "",
                        content: newsList[index].content ?? "",
                        source: newsList[index].source ?? "",
                        posturl: newsList[index].url ?? "",
                      );
                    },
                  )
                )
              ],
            )
          )
        ),
      ),
    );
  }
}
