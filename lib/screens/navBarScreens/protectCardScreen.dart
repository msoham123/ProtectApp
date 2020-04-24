import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/components/protectCard.dart';
import 'package:protect/screens/protects/coronavirus.dart';
import 'package:protect/screens/protects/climateChange.dart';

class ProtectCardScreen extends StatefulWidget {
  @override
  _ProtectCardScreenState createState() => _ProtectCardScreenState();
}

class _ProtectCardScreenState extends State<ProtectCardScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Protects",
          style: TextStyle(fontWeight: FontWeight.w700),
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
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width / 15),
                    Text(
                      "Protect Information : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                Container(
                  height: 250.0,
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 30),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      protectCard(
                        screen: CoronavirusScreen(),
                        imageFilePath: './assets/images/coronavirus.jpg',
                        protectTitle: 'COVID-19',
                        protectInformation: 'Description...',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      protectCard(
                        screen: ClimateChangeScreen(),
                        imageFilePath: './assets/images/climate-change.jpg',
                        protectTitle: 'Climate Change',
                        protectInformation: 'Description...',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      protectCard(
                        imageFilePath: './assets/images/amazon-rainforest.jpg',
                        protectTitle: 'Amazon Rainforest',
                        protectInformation: 'Description...',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      protectCard(
                        imageFilePath: './assets/images/reef.png',
                        protectTitle: 'The Great Barrier Reef',
                        protectInformation: 'Description...',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
