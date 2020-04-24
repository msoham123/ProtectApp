import 'package:flutter/material.dart';
import 'package:protect/screens/firstScreen.dart';
import 'package:provider/provider.dart';
import 'package:protect/services/firebase_auth_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _signOut(BuildContext context) async {
    try {
      final _auth = Provider.of<FirebaseAuthService>(context, listen: false);
      await _auth.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FirstScreen()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 58.0),
              child: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
            )),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _showDialog(context),
          ),
        ],
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                    color: Colors.green,
                    height: MediaQuery.of(context).size.height * 1.5,
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Confirmation"),
          content: new Text("Are you sure you want to log out?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Logout"),
              onPressed: () {
                Navigator.of(context).pop();
                _signOut(context);
              },
            ),
          ],
        );
      },
    );
  }
}
