import 'package:flutter/material.dart';
import 'package:protect/animations/fadeAnimation.dart';
import 'package:protect/animations/headerAnimation.dart';
import 'package:protect/animations/searchAnimation.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(1.4, HeaderWidget()),
            SizedBox(height: 20),
            FadeAnimation(1.6,SearchWidget()),
            SizedBox(height: 20),
            FadeAnimation(1.8,SearchWidget()),
            SizedBox(height: 20),
            FadeAnimation(2,SearchWidget())
          ],
        ),
      ),
    );
  }
}