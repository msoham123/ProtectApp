import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/navScreen.dart';

import '../main.dart';

class ProtectInformationScreen extends StatefulWidget {
  String protectTitle;
  Image protectImage;

  ProtectInformationScreen({
   @required this.protectTitle,
   @required this.protectImage
});

  @override
  _ProtectInformationScreenState createState() => _ProtectInformationScreenState(protectTitle: protectTitle,protectImage: protectImage);
}

class _ProtectInformationScreenState extends State<ProtectInformationScreen>{
  final TextEditingController _searchControl = new TextEditingController();
  String protectTitle;
  Image protectImage;

  _ProtectInformationScreenState({
    @required this.protectTitle,
    @required this.protectImage
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(protectTitle, style: TextStyle(fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
        actions: <Widget>[]
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  protectImage,

                  
                  
                  

                ],
              ),
            ),
            
          ],
        ),
      ),
    );

  }



}

