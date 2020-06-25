import 'package:flutter/material.dart';
import 'package:protect/screens/protectInfoScreen.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

class protectCard extends StatelessWidget {
  String protectTitle;
  var protectInformation;
  String imageFilePath;
  Widget screen;

  protectCard(
      {@required this.imageFilePath,
      @required this.protectTitle,
      @required this.screen,
      this.protectInformation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: (Platform.isAndroid) ? MediaQuery.of(context).size.height/2.8 : MediaQuery.of(context).size.height/3.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5.0,
              )
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => screen,
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 2.9,
              width: MediaQuery.of(context).size.width / 2.1,
              child: Column(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Image.asset(
                        imageFilePath,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      Text(
                        protectTitle,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/9999,
        ),
      ],
    );
  }
}

class CharityCard extends StatelessWidget {
  String charityTitle;
  String imageFilePath;
  String websiteURL;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  CharityCard(
      {@required this.imageFilePath,
        @required this.charityTitle,
        @required this.websiteURL,
        });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
//          height: (Platform.isAndroid) ? MediaQuery.of(context).size.height/2.4 : MediaQuery.of(context).size.height/3.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5.0,
              )
            ],
          ),
          child: GestureDetector(
            onTap: () {
              _launchURL(websiteURL);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Column(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Image.network(
                        imageFilePath,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      Text(
                        charityTitle,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    'Tap to Donate',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

