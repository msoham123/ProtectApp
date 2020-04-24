import 'package:flutter/material.dart';
import 'package:protect/animations/buttonLoginAnimation.dart';
import 'package:protect/animations/fadeAnimation.dart';
import 'package:protect/components/customTextfield.dart';
import 'package:protect/animations/dashAnimation.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:protect/navScreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage("assets/images/loginImage.png"),
//                fit: BoxFit.contain,
//                alignment: Alignment.topCenter
//              )
//            ),
          child: ListView(
//                mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              Container(
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height/3.8,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/images/loginImage.png", fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black,size:32),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: FadeAnimation(0.4,Text("Welcome back",style: TextStyle(
                          color: Color(0xFFF032f42),
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )),
                    ),),
                    Center(
                      child: FadeAnimation(0.4,Text("Sign to continue",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25
                      )),
                    ),),
                    SizedBox(height: 40),
                    FadeAnimation(0.4,TextField(
                      onChanged: (value) {
                      },
                      style: TextStyle(
                          color: Color(0xFFF234253),
                          fontWeight: FontWeight.bold),
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0)),
                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Color(0xFFF234253),
                            fontWeight: FontWeight.bold),
                        suffixIcon: Icon(
                          Icons.email,
                          size: 27,
                          color: Color(0xFFF032f41),
                        ),
                      ),
                    ),),
                    SizedBox(height: 10),
                    FadeAnimation(0.4,TextField(
                      onChanged: (value) {

                      },
                      style: TextStyle(
                          color: Color(0xFFF234253),
                          fontWeight: FontWeight.bold),
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color(0xFFF234253),
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: Icon(
                          Icons.https,
                          size: 27,
                          color: Color(0xFFF032f41),
                        ),
                      ),
                    )),
                    SizedBox(height: 40),
                    Center(
//                          child: MaterialButton(
//                            onPressed: () async {
////                              try {
////                                final result =
////                                await _auth.signInWithEmailAndPassword(
////                                    email: email,
////                                    password: password);
////                                FirebaseUser user = result.user;
////
////                                if (result != null) {
////                                  Navigator.push(
////                                    context,
////                                    MaterialPageRoute(
////                                      builder: (context) => NavScreen(),
////                                    ),
////                                  );
////                                } else {
////                                  print(result);
////                                }
////                              } catch (e) {
////                                print(e);
////                              }
//                            },
//                            child: Text(
//                              "Sign in",
//                              style:
//                              TextStyle(color: Colors.white, fontSize: 20),
//                            ),
//                            color: Colors.blue,
//                            padding: EdgeInsets.symmetric(
//                                horizontal: 30, vertical: 20),
//                          ),
                        child: Container(
                          height: MediaQuery.of(context).size.height/14,
                          width: MediaQuery.of(context).size.width/2.8,
                          child: FadeAnimation(0.4,FlatButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NavScreen()));
                              },
                              color: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("Sign In", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        )


                    )
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}