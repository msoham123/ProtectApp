import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/navScreen.dart';

import '../main.dart';

class ProtectScreen extends StatefulWidget {
  @override
  _ProtectScreenState createState() => _ProtectScreenState();
}

class _ProtectScreenState extends State<ProtectScreen>{
  final TextEditingController _searchControl = new TextEditingController();
  List<bool> selectedList = new List();
  List<String> protectList = ["Covid-19","Amazon Rainforest","The Great Barrier Reef","Empty"];

  void populateSelectedList(){
    for(int i = 0; i<protectList.length-1;i++){
      selectedList.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    populateSelectedList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Protect", style: TextStyle(fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[]
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(height: 10.0),

                  protectBuilder(protectList, selectedList, setState),

                ],
              ),
            ),
            FlatButton(
              color: Colors.deepPurpleAccent,
              child: Text("Done", style: TextStyle(color: Colors.white),),
              onPressed: () {
                bool isTrue = false;
                for(int i = 0; i<selectedList.length-1;i++){
                  if(selectedList[i]==true){
                    print(protectList[i]);
                    MyApp.protectList.add(protectList[i]);
                    isTrue = true;
                  }
                }
                if(isTrue){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => NavScreen()));
                }else{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child: Text("Error")),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(child: Text("No protect selected!")),
                          ],
                        ),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                child: Text("Try Again"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height/25),
          ],
        ),
      ),
    );

  }



}

Widget protectBuilder(List protectList, List selectedList, StateSetter setState){
  List<Widget> buildList = new List();
  for(int i = 0; i<protectList.length-1;i++){
    buildList.add(
      Container(
        color: selectedList[i] ? Colors.deepPurpleAccent : Colors.white,
        child: Center(
          child: ListTile(
            selected: selectedList[i],
            title: Text(protectList[i], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
            onTap: () {
              bool otherSelected = false;
              for(int c = 0; c<selectedList.length-1;c++){
                if(c!=i) if (selectedList[c]==true) otherSelected = true;
              }
              if (otherSelected==false){
                setState(() {
                  selectedList[i]=!selectedList[i];
                });
                print(protectList[i]);
              }
            },
          ),
        ),
      ),
    );
  }
  return Column(
    children: buildList,
  );
}