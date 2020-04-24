import 'package:flutter/material.dart';
import 'package:protect/screens/protectInfoScreen.dart';
import 'dart:io' show Platform;

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

/*
Container(
        margin: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width/1.5,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            protectTitle,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      image: protectImage.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
 */
