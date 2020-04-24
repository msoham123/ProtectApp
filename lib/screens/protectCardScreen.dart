import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/components/articleCard.dart';
import 'package:protect/components/protectCard.dart';
import 'package:protect/screens/addProtectScreen.dart';

import '../main.dart';


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
        title: Text("Protect Information", style: TextStyle(fontWeight: FontWeight.w700),),
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
                  height: MediaQuery.of(context).size.height/2.3,
                  width: MediaQuery.of(context).size.width/1.4,
                  child: ListView.builder(
                    primary: false,
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/30),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: MyApp.allProtectList.length-1,
                    itemBuilder: (BuildContext context, int index){
                      return protectCard(
                        protectImage: Image.asset("assets/images/signupImage.png"),
                        protectTitle: MyApp.allProtectList[index],
                      );
                    },
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