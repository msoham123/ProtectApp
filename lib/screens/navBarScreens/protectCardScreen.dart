import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/components/protectCard.dart';
import 'package:protect/screens/protects/amazonRainforest.dart';
import 'package:protect/screens/protects/coronavirus.dart';
import 'package:protect/screens/protects/climateChange.dart';
import 'package:protect/screens/protects/greatBarrierReef.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' show Platform;

class ProtectCardScreen extends StatefulWidget {
  @override
  _ProtectCardScreenState createState() => _ProtectCardScreenState();
}

class _ProtectCardScreenState extends State<ProtectCardScreen> {
  final firestore = Firestore.instance;
  bool selected = false;
  Map charities = {};
  var data;


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
              shrinkWrap: false,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width / 15),
                    Text(
                      "Protect Information",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                Center(
                  child: Container(
                    height: (Platform.isAndroid) ? MediaQuery.of(context).size.height/2.6 : MediaQuery.of(context).size.height/3.4,
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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width / 15),
                    Text(
                      "Charities",
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height / 20),

                Container(
                        height: MediaQuery.of(context).size.height/2,
                        child: ListView(
                          primary: false,
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width / 30),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: charityBuilder(),
                        ),
                      ),


                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Future<void> loadJSON() async {
     data = await rootBundle.loadString('assets/charities.json');
//    this.data = json.decode(data);
  }

  List<Widget> charityBuilder(){
    List<Widget> myList = [];
    myList.add(
      SizedBox(
        width: MediaQuery.of(context).size.width / 20,
      ),
    );
    for(int i=0; i<cName.length;i++){
      myList.add(
          CharityCard(
            charityTitle: cName[i],
            websiteURL: cWebsite[i],
            imageFilePath: cImage[i],
          ),
      );
      myList.add(
        SizedBox(
          width: MediaQuery.of(context).size.width / 20,
        ),
      );
    }
    return myList;
  }

  List<String> cName = [
    "Doctors Without Borders",
    "World Central Kitchen",
    "Feeding America",
    "Center for Disease Control",
  ];

  List<String> cWebsite = [
    "https://donate.doctorswithoutborders.org/onetime.cfm",
    "https://donate.wck.org/give/236738/#!/donation/checkout",
    "https://secure.feedingamerica.org/site/Donation2;jsessionid=00000000.app20026b?idb=647185158&df_id=26876&26876.donation=form1&mfc_pref=T&NONCE_TOKEN=3C9CE546DF908E80E609DF988198B380&s_channel=https://www.wired.com/story/covid-19-charities-nonprofits-companies-helping/&s_onsite_promo=MainNav_Donate&s_subsrc=https://www.feedingamerica.org/&s_src=W206REFER&26876_donation=form1&s_referrer=https://www.wired.com/story/covid-19-charities-nonprofits-companies-helping/",
    "https://give4cdcf.org/",
  ];

  List<String> cImage = [
    "https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/11041567_10153008302732385_5012964870070649179_n.png?_nc_cat=1&_nc_sid=09cbfe&_nc_ohc=UAUJmh4gGQgAX_g8aLU&_nc_ht=scontent-sjc3-1.xx&oh=32c86abb6c1c0f911a109bcc170b0e5e&oe=5F18657C",
    "https://upload.wikimedia.org/wikipedia/en/9/91/WorldCentralKitchenLogo.png",
    "https://www.feedingamerica.org/themes/custom/ts_feeding_america/images/sprite-logo2018.png",
    "https://www.naaccr.org/wp-content/uploads/2016/11/cdc-logo.jpg",
  ];

}
