import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protect/main.dart';
import 'package:protect/models/ProtectUser.dart';
import 'package:protect/screens/login+signupScreens/firstScreen.dart';
import 'package:provider/provider.dart';
import 'package:protect/services/firebase_auth_service.dart';
import 'package:protect/services/firestore_service.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  String fullName = '';
  int protectPoints = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populateCurrentUser();
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final _auth = Provider.of<FirebaseAuthService>(context, listen: false);
      await _auth.signOut();
      MyApp.currentIndex = 0;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FirstScreen()));
    } catch (e) {
      print(e);
    }
  }

  Future<void> populateCurrentUser() async {
    final database = Provider.of<FirestoreService>(context, listen: false);
    final user = await _auth.currentUser();
    String uid = user.uid;
    DocumentSnapshot snapshot = await database.getUserDocumentSnapshot(uid);
    ProtectUser userInstance = ProtectUser.fromJSON(snapshot.data);
    fullName = userInstance.fullName;
    protectPoints = userInstance.protectPoints;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 25),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 20.0,
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/profile.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: FutureBuilder(
                          future: populateCurrentUser(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Column(
                                children: <Widget>[
                                  Text(
                                    "$fullName",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  Text(
                                    "$protectPoints protect points",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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
          title: Text("Confirmation"),
          content: Text("Are you sure you want to log out?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Logout"),
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
