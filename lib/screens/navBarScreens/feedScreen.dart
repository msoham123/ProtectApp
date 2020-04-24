import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:protect/data/webScraper.dart' as scraper;
import 'package:http/http.dart';
import 'package:protect/screens/create_post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final TextEditingController _searchControl = new TextEditingController();
  String response = "This is where the response will be stored";
  List<String> postName = ["Soham Manoli", "Aryan Vichare"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Feed",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('posts')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return ListView.builder(
                      itemExtent: MediaQuery.of(context).size.height/1.6,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            SizedBox(height: MediaQuery.of(context).size.height/50),
                            _buildPost(
                                context, snapshot.data.documents[index]),
                          ],
                        );
                      });
                }
          ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/30),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Widget _buildPost(BuildContext context, DocumentSnapshot document) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/1.7 ,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        height: 50.0,
                        width: 50.0,
                        image: AssetImage("assets/images/profile.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  document['sender'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    "${document['date']}"),
                trailing: IconButton(
                  icon: Icon(Icons.filter_frames),
                  color: Colors.black,
                  onPressed: () => print('More'),
                ),
              ),

              Container(
                margin: EdgeInsets.all(10.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
//                    color: Colors.black12,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
//                      BoxShadow(
//                        color: Colors.black45,
//                        offset: Offset(0, 5),
//                        blurRadius: 1.0,
//                      ),
                  ],
                ),
                child: Image(
                  image: NetworkImage('${document['imageURL']}'),
                  fit: BoxFit.contain,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${document['hashtags']}".replaceAll(']''', '').replaceAll('[', ""), style: TextStyle(color: Colors.blue,),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: Center(child: Text("${document['description']}".replaceAll(']''', '').replaceAll('[', ""), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),))),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}

//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      FlatButton(
//                        color: Colors.green,
//                        child: Text("Scrape Web", style: TextStyle(color: Colors.white),),
//                        onPressed: () async {
//                          response = await scraper.initiate(Client());
//                          setState(() {
//                            response = response;
//                          });
//                        },
//                      ),
//                      FlatButton(
//                        color: Colors.blue,
//                        child: Text("Clean Output", style: TextStyle(color: Colors.white),),
//                        onPressed: () {
//                          setState(() {
//                            response = "This is where the response will be stored";
//                          });
//                        },
//                      ),
//                    ],
//                  ),
/*
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
 */
