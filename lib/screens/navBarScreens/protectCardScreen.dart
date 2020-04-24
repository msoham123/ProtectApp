import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/components/protectCard.dart';
import 'package:protect/screens/protects/amazonRainforest.dart';
import 'package:protect/screens/protects/coronavirus.dart';
import 'package:protect/screens/protects/climateChange.dart';
import 'package:protect/screens/protects/greatBarrierReef.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProtectCardScreen extends StatefulWidget {
  @override
  _ProtectCardScreenState createState() => _ProtectCardScreenState();
}

class _ProtectCardScreenState extends State<ProtectCardScreen> {
  final firestore = Firestore.instance;
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width / 15),
                    Text(
                      "Protect Information : ",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                        screen: AmazonRainforestScreen(),
                        imageFilePath: './assets/images/amazon-rainforest.jpg',
                        protectTitle: 'Amazon Rainforest',
                        protectInformation: 'Description...',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      protectCard(
                        screen: GreatBarrierReefScreen(),
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
            SizedBox(
              height: 50.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Leaderboard : ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: 500.0,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: firestore
                        .collection('users')
                        .orderBy('protect_points', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      return ListView.builder(
                        primary: false,
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        itemExtent: 80.0,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) => _buildUserCard(
                          context,
                          snapshot.data.documents[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('${document['full_name']} – ${document['protect_points']} protect points'),
        ],
      ),
    );
  }
}
