import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/components/articleCard.dart';
import 'package:protect/data/webScraper.dart' as scraper;
import 'package:http/http.dart';


class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>{
  final TextEditingController _searchControl = new TextEditingController();
  String response = "This is where the response will be stored";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Center(child: Text("My Feed", style: TextStyle(fontWeight: FontWeight.w700),)),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.green,
                        child: Text("Scrape Web", style: TextStyle(color: Colors.white),),
                        onPressed: () async {
                          response = await scraper.initiate(Client());
                          setState(() {
                            response = response;
                          });
                        },
                      ),
                      FlatButton(
                        color: Colors.blue,
                        child: Text("Clean Output", style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          setState(() {
                            response = "This is where the response will be stored";
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,
                  ),

                  Center(child: Text(response, style: TextStyle(color: Colors.black),)),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,
                  ),

                  ArticleCard(
                    articleTitle: "Dobervich drinks too much coffee!",
                    articleDate: "March 11, 2020",
                    articleImage: Image.asset("assets/images/signupImage.png", fit: BoxFit.cover,),
                    articleInformation: "AP CS students cry in agony as FRQ problems ravage the land.",
                    articleProtect: "Dobervich",
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,
                  ),

                  ArticleCard(
                    articleTitle: "Aryan burns his Calc HW!",
                    articleDate: "March 11, 2020",
                    articleImage: Image.asset("assets/images/signupImage.png", fit: BoxFit.cover,),
                    articleInformation: "AP BC students cry in agony as FRQ problems ravage the land.",
                    articleProtect: "Calc BC",
                  ),
                ],
              ),
            ),
//            SizedBox(height: MediaQuery.of(context).size.height/300),
          ],
        ),
      ),
    );

  }




}