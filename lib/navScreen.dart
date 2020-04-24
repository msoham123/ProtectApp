import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/screens/feedScreen.dart';
import 'package:protect/screens/messageScreen.dart';
import 'package:protect/screens/profileScreen.dart';
import 'package:protect/screens/protectCardScreen.dart';

import 'main.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  PageController pageController;

  @override
  initState() {
    super.initState();
    pageController = new PageController(
        initialPage: MyApp.currentIndex, keepPage: true, viewportFraction: 1);
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

//  void getCurrentUser() async {
//    try {
//      final user = await _auth.currentUser();
//      if (user != null) {
//        loggedInUser = user;
//      }
//    } catch (e) {
//      print(e);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("ProtectApp", style: TextStyle(fontWeight: FontWeight.w700),),
//        backgroundColor: Colors.deepPurple,
//        automaticallyImplyLeading: false,
//        actions: <Widget>[
//          MaterialButton(
//            onPressed: () {
//              print("sign out");
////              _auth.signOut();
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => FirstScreen(),
//                ),
//              );
//            },
//            child: Row(
//              children: <Widget>[
//                Text("Sign out",style: TextStyle(color: Colors.white),),
//                Padding(
//                  padding: const EdgeInsets.only(left: 5.0),
//                  child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
      body: Center(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              MyApp.currentIndex = index;
            });
          },
          children: <Widget>[
//            MainScreen(), list of screens here
//            MapScreen(),
//            myChatBotScreen(),
            ProtectCardScreen(),
            FeedScreen(),
            MessageScreen(),
            ProfileScreen(),
          ],
        ),
      ),
//      bottomNavigationBar: BottomNavyBar(
//        backgroundColor: Colors.white,
//        selectedIndex: MyApp.currentIndex,
//        showElevation: true,
//        itemCornerRadius: 8,
//        curve: Curves.easeInBack,
//        onItemSelected: (index) {
//          setState(() {
//            MyApp.currentIndex = index;
//          });
//          pageController.jumpToPage(index);
//        },
//        items: [
//          BottomNavyBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//            activeColor: Colors.purpleAccent,
//            textAlign: TextAlign.center,
//          ),
//          BottomNavyBarItem(
//            icon: Icon(Icons.location_on),
//            title: Text(
//              'Clinics',
//            ),
//            activeColor: Colors.pink,
//            textAlign: TextAlign.center,
//          ),
//          BottomNavyBarItem(
//            icon: Icon(Icons.question_answer),
//            title: Text('Chatbot'),
//            activeColor: Colors.orangeAccent,
//            textAlign: TextAlign.center,
//          ),
//        ],
//      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: MyApp.currentIndex,
        backgroundColor: Colors.deepPurpleAccent,
        color: Colors.deepPurple,
        buttonBackgroundColor: Colors.deepPurple,
        items: <Widget>[
          Icon(Icons.live_help, size: 30, color: Colors.white,),
          Icon(Icons.dashboard, size: 30, color: Colors.white,),
          Icon(Icons.forum, size: 30, color: Colors.white,),
          Icon(Icons.person, size: 30, color: Colors.white,),
        ],
        onTap: (index) {
          setState(() {
            MyApp.currentIndex = index;
          });
//          pageController.jumpToPage(index);
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      ),
    );
  }
}
