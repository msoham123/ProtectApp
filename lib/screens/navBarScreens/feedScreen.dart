import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/components/articleCard.dart';
import 'package:protect/data/webScraper.dart' as scraper;
import 'package:http/http.dart';
import 'package:protect/screens/create_post.dart';

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  _buildPost(0),
                  _buildPost(1),
                ],
              ),
            ),
//            SizedBox(height: MediaQuery.of(context).size.height/300),
          ],
        ),
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

  Widget _buildPost(int index) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2 ,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
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
                  postName[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"),
                trailing: IconButton(
                  icon: Icon(Icons.filter_frames),
                  color: Colors.black,
                  onPressed: () => null ,
                ),
              ),
              InkWell(
                child: Container(
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
                    image: DecorationImage(
                      image: AssetImage("assets/images/reef.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("#Protect #DavidDobervich", style: TextStyle(color: Colors.blue,),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(child: Text("Description", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),)),
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
