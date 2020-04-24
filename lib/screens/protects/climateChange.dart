import 'package:flutter/material.dart';
import 'package:protect/constant.dart';
import 'package:protect/components/my_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect/components/counter.dart';
import 'package:protect/screens/protects/corona_info_screen.dart';

class ClimateChangeScreen extends StatefulWidget {
  @override
  _ClimateChangeScreenState createState() => _ClimateChangeScreenState();
}

class _ClimateChangeScreenState extends State<ClimateChangeScreen> {
  String selectedCountry = 'United States';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Climate Change",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "./assets/icons/environment.svg",
              textTop: "Protect the",
              textBottom: "environment.",
            ),

            SizedBox(height: 10),
  //            Row(
  //              mainAxisAlignment: MainAxisAlignment.start,
  //              children: <Widget>[
  //                GestureDetector(
  //                  onTap: () {
  //                    Navigator.push(context,
  //                        MaterialPageRoute(builder: (context) => InfoScreen()));
  //                  },
  //                  child: Container(
  //                    padding:
  //                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
  //                    margin: EdgeInsets.only(left: 30.0),
  //                    child: Text(
  //                      'Get more details',
  //                      style: TextStyle(color: Colors.white),
  //                    ),
  //                    decoration: BoxDecoration(
  //                      color: kRecovercolor,
  //                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //                    ),
  //                  ),
  //                ),
  //              ],
  //            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Climate Change Impact\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Newest update April 13th",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
//                      Text(
//                        "See details",
//                        style: TextStyle(
//                          color: kPrimaryColor,
//                          fontWeight: FontWeight.w600,
//                        ),
//                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Kilotons of \nIce Melted",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 87,
                          title: "Deaths",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 46,
                          title: "     Rise in \nTemperature\n   (Celsius)",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Things you can do to slow down\n                 Climate Change",
                          style: kTitleTextstyle,
                        ),
                      ),
//                      Text(
//                        "See details",
//                        style: TextStyle(
//                          color: kPrimaryColor,
//                          fontWeight: FontWeight.w600,
//                        ),
//                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
