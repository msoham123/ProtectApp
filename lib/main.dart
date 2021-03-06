import 'package:flutter/material.dart';
import 'package:protect/auth_widget.dart';
import 'package:protect/services/firebase_storage_service.dart';
import 'package:protect/services/image_picker_service.dart';
import 'package:protect/services/posts_service.dart';
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
        ),
        Provider<ImagePickerService>(
            create: (_) => ImagePickerService()
        ),
        Provider<FirebaseStorageService>(
            create: (_) => FirebaseStorageService()
        ),
        Provider<PostsService>(
            create: (_) => PostsService()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Protect App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: AuthWidget(),
      ),
    );
  }
}

