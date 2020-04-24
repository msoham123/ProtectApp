import 'package:flutter/material.dart';
import 'package:protect/animations/fadeAnimation.dart';
import 'package:protect/services/firestore_service.dart';
import 'package:protect/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:protect/navScreen.dart';

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

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    int userAge = int.parse(ageController.text.trim());
      try {
        final auth = Provider.of<FirebaseAuthService>(context, listen: false);
        final user = await auth.createUserWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
        final firestore = Provider.of<FirestoreService>(context, listen: false);
        firestore.updateUserData(uid: user.uid, full_name: nameController.text.trim(), age: userAge);
        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavScreen(),
            ),
          );
        }
      } catch (e) {
        print(e);
      }
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
                height: MediaQuery.of(context).size.height * 1,
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
                      child: Container(
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: FadeAnimation(
                          0.4,
                          FlatButton(
                            onPressed: () {
                              createUserWithEmailAndPassword(context);
                            },
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
