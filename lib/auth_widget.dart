import 'package:flutter/material.dart';
import 'package:protect/navScreen.dart';
import 'file:///C:/Users/msoha/Desktop/flutter_applications/protect/lib/screens/login+signupScreens/loginScreen.dart';
import 'package:protect/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthService>(context, listen: false);
    return StreamBuilder<User>(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          var user = snapshot.data;

          if (user != null) {
            return NavScreen();
          } else {
            return LoginScreen();
          }
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
