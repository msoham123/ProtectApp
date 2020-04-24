import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/components/protectCard.dart';
import 'package:protect/screens/protects/coronavirus.dart';


class ProtectCardScreen extends StatefulWidget {
  @override
  _ProtectCardScreenState createState() => _ProtectCardScreenState();
}

class _ProtectCardScreenState extends State<ProtectCardScreen>{
  final TextEditingController _searchControl = new TextEditingController();

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Protects", style: TextStyle(fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height/20),
                Container(
                  height: 250.0,
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/30),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      protectCard(screen: CoronavirusScreen(), imageFilePath: './assets/images/coronavirus.jpg', protectTitle: 'COVID-19', protectInformation: 'Description...',),
                      protectCard(imageFilePath: './assets/images/climate-change.jpg', protectTitle: 'Climate Change', protectInformation: 'Description...',),
                      protectCard(imageFilePath: './assets/images/amazon-rainforest.jpg', protectTitle: 'Amazon Rainforest', protectInformation: 'Description...',),
                      protectCard(imageFilePath: './assets/images/reef.png', protectTitle: 'The Great Barrier Reef', protectInformation: 'Description...',),
                    ],
                  ),
                ),
              ],
            ),
          ),
//            SizedBox(height: MediaQuery.of(context).size.height/25),
        ],
      ),
    );

  }




}