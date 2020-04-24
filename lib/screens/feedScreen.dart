import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/data/webScraper.dart' as scraper;
import 'firstScreen.dart';
import 'package:http/http.dart';


class feedScreen extends StatefulWidget {
  @override
  _feedScreenState createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen>{
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
      backgroundColor: Colors.deepPurpleAccent,
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
                            response = "";
                          });
                        },
                      ),
                    ],
                  ),

                  Text(response, style: TextStyle(color: Colors.white),),

                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/25),
          ],
        ),
      ),
    );

  }




}