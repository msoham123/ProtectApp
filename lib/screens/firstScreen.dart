import 'package:flutter/material.dart';
import 'package:protect/animations/fadeAnimation.dart';
import 'package:protect/components/customButton.dart';
import 'package:protect/animations/customButtonAnimation.dart';
import 'package:protect/screens/loginScreen.dart';
import 'package:protect/screens/signUpScreen.dart';


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/protectImage.jpg", fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF001117).withOpacity(0.7),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(2.6,Text("Protect", style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                    ))),
                     FadeAnimation(2.4,Text("Protect your future!.", style: TextStyle(
                         color: Colors.white,
                         fontSize: 22,
                         letterSpacing: 2
                     ))),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(2.8,CustomButtonAnimation(
                      label: "Sign up",
                      backbround: Colors.transparent,
                      fontColor: Colors.white,
                      borderColor: Colors.white,
                      child: SignUpScreen(),
                    )),
                    SizedBox(height: 20),
                    FadeAnimation(3.2,CustomButtonAnimation(
                      label: "Sign In",
                      backbround: Colors.white,
                      borderColor: Colors.white,
                      fontColor: Color(0xFFF001117),
                      child: LoginScreen(),
                    )),
                    SizedBox(height: 30),
                    FadeAnimation(3.4,CustomButtonAnimation(
                      label : "Empty Button",
                      backbround: Colors.transparent,
                      borderColor: Colors.transparent,
                      fontColor : Colors.white,
//                      child: FirstScreenDoctor(),
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}