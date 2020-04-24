import 'package:flutter/material.dart';
import 'package:protect/auth_widget.dart';
import 'package:protect/screens/login+signupScreens/firstScreen.dart';
import 'package:provider/provider.dart';
import 'package:protect/services/firebase_auth_service.dart';
import 'package:protect/services/firestore_service.dart';
import 'package:flutter/services.dart' as service;

//Device Preview
//void main() => runApp(DevicePreview(builder: (context) => MyApp()));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  static int currentIndex = 0;
  static String email = '';
  static String password = '';
  static List<String> protectList = [];
  static List<String> allProtectList = ["Covid-19","Amazon Rainforest","The Great Barrier Reef","Empty"];

  @override
  Widget build(BuildContext context) {
    service.SystemChrome.setPreferredOrientations([service.DeviceOrientation.portraitDown,service.DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
        Provider<FirestoreService>(
          create: (_) => FirestoreService()
        )
      ],
      child: MaterialApp(
//      locale: DevicePreview.of(context).locale,
//      builder: DevicePreview.appBuilder,
        //activate for device preview
        debugShowCheckedModeBanner: false,
        title: 'Protect App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: FirstScreen(),
      ),
    );
  }
}

