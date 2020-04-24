import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/videoChat/index.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>{
  final TextEditingController _searchControl = new TextEditingController();

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text("My Messages", style: TextStyle(fontWeight: FontWeight.w700),),
        leading: IconButton(
          icon: Icon(Icons.video_call),
          color: Colors.white,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => IndexPage()));
          },
        ),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[

          PopupMenuButton<int>(
            icon: Icon(Icons.arrow_drop_down, size: 35,),
            offset: Offset(0, 100),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Global Chat"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Coronavirus Chat"),
              ),
            ],
          ),
        ],
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


//                  Container(
//                    color: Colors.blue,
//                    height: MediaQuery.of(context).size.height*1.5,
//                  )


                ],
              ),
            ),
//            SizedBox(height: MediaQuery.of(context).size.height/25),
          ],
        ),
      ),
    );
  }
}