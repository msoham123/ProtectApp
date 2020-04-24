import 'package:flutter/material.dart';
import 'package:protect/animations/fadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nameController;
  TextEditingController ageController;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = new TextEditingController();
    ageController = new TextEditingController();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
//                mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.85,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/signupImage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.black, size: 32),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: FadeAnimation(
                        0.4,
                        Text("Become a Hero",
                            style: TextStyle(
                                color: Color(0xFFF032f42),
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Center(
                      child: FadeAnimation(
                        0.4,
                        Text("Sign up to continue",
                            style: TextStyle(color: Colors.grey, fontSize: 25)),
                      ),
                    ),
                    SizedBox(height: 40),
                    FadeAnimation(
                      0.4,
                      TextField(
                        controller: nameController,
                        onChanged: (value) {},
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
                          labelText: "Full name",
                          hintText: "John Doe",
                          labelStyle: TextStyle(
                              color: Color(0xFFF234253),
                              fontWeight: FontWeight.bold),
                          suffixIcon: Icon(
                            Icons.person,
                            size: 27,
                            color: Color(0xFFF032f41),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    FadeAnimation(
                      0.4,
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: ageController,
                        onChanged: (value) {},
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
                          labelText: "Age",
                          hintText: "15",
                          labelStyle: TextStyle(
                              color: Color(0xFFF234253),
                              fontWeight: FontWeight.bold),
                          suffixIcon: Icon(
                            Icons.cake,
                            size: 27,
                            color: Color(0xFFF032f41),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeAnimation(
                      0.4,
                      TextField(
                        controller: emailController,
                        onChanged: (value) {},
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
                          labelText: "Email",
                          hintText: "johndoe@gmail.com",
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
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeAnimation(
                      0.4,
                      TextField(
                        controller: passwordController,
                        onChanged: (value) {},
                        style: TextStyle(
                            color: Color(0xFFF234253),
                            fontWeight: FontWeight.bold),
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          labelText: "Password",
                          hintText: "Enter password...",
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
                      ),
                    ),
                    SizedBox(height: 40),
                    Center(
//                          child: MaterialButton(
//                            onPressed: () async {
////                              try {
////                                final result =
////                                    await _auth.createUserWithEmailAndPassword(
////                                        email: email,
////                                        password: password);
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
//                              "Sign up",
//                              style:
//                                  TextStyle(color: Colors.white, fontSize: 20),
//                            ),
//                            color: Colors.blue,
//                            padding: EdgeInsets.symmetric(
//                                horizontal: 30, vertical: 20),
//                          ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: FadeAnimation(
                          0.4,
                          FlatButton(
                            onPressed: () {},
                            color: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
