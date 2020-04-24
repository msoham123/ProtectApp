import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_slider/intro_slider.dart' as slider;
import 'package:intro_slider/slide_object.dart';
import 'package:protect/navScreen.dart';
import 'package:protect/screens/addProtectScreen.dart';



class IntroSlider extends StatefulWidget{
  @override
  IntroSliderState createState(){
    return IntroSliderState();
  }
}


class IntroSliderState extends State<IntroSlider> {
  List<Slide> slides;


  @override
  void initState() {
    super.initState();
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProtectScreen(),
      ),
    );
  }

  void addSlides(){
    slides.add(
      new Slide(
        title: "Sign Up for a Protect",
        description: "Become a hero. Find something that you want to protect!",
        backgroundColor: Colors.deepPurpleAccent,
        centerWidget: Container(
            height: MediaQuery.of(context).size.height/3,
            child: SvgPicture.asset("assets/images/hero.svg", fit: BoxFit.contain,)
        ),
      ),
    );
    slides.add(
      new Slide(
        title: "Earn Protect Points",
        description: "Read trustworthy articles, donate to causes, and share links with family and friends to earn Protect Points.",
        centerWidget: Container(
            height: MediaQuery.of(context).size.height/3,
            child: SvgPicture.asset("assets/images/points.svg", fit: BoxFit.contain,)
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
    slides.add(
      new Slide(
        title: "Network and Protect",
        description:
        "Chat with other protectors and learn about new perspectives.",
        centerWidget: Container(
            height: MediaQuery.of(context).size.height/3,
            child: SvgPicture.asset("assets/images/network.svg", fit: BoxFit.contain,)
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
//    slides.add(
//      new Slide(
//        title: "Pick Your Protect",
//        onCenterItemPress: (){},
//        centerWidget: StatefulBuilder(
//          builder: (BuildContext context, StateSetter setState) {
//            return Container(
//              child: ListView(
//                shrinkWrap: true,
//                children: <Widget>[
//
//                ],
//              ),
//            );
//          }
//        ),
//        description:
//        "Please choose a protect to get started. Once you get enough points, you can choose another one. $selected",
//        backgroundColor: Colors.deepPurpleAccent,
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    slides = new List();
    addSlides();
    return Scaffold(
      body: slider.IntroSlider(
        isShowPrevBtn: true,
        isShowSkipBtn: false,
        slides: this.slides,
        onDonePress: this.onDonePress,
      ),
    );
  }
}