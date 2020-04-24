import 'package:flutter/material.dart';

import 'firstScreen.dart';


class feedScreen extends StatefulWidget {
  @override
  _feedScreenState createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen>{
  final TextEditingController _searchControl = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Center(child: Text("My Feed", style: TextStyle(fontWeight: FontWeight.w700),)),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[],
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),

                  Container(
                    color: Colors.orange,
                    height: MediaQuery.of(context).size.height*1.5,
                  )

                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/25),
          ],
        ),
      ),
    );

  }




}