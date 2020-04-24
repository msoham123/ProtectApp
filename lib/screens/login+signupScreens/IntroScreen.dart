import 'package:fancy_on_boarding/fancy_on_boarding.dart' as slider;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:intro_slider/intro_slider.dart' as slider;
import 'package:intro_slider/slide_object.dart';
import 'package:protect/navScreen.dart';
import 'package:protect/screens/addProtectScreen.dart';



class IntroSliderScreen extends StatefulWidget{
  @override
  IntroSliderScreenState createState(){
    return IntroSliderScreenState();
  }
}


class IntroSliderScreenState extends State<IntroSliderScreen> {
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

//  void addSlides(){
//    slides.add(
//      new Slide(
//        title: "Sign Up for a Protect",
//        description: "Become a hero. Find something that you want to protect!",
//        backgroundColor: Colors.deepPurpleAccent,
//        centerWidget: Container(
//            height: MediaQuery.of(context).size.height/3,
//            child: SvgPicture.asset("assets/images/hero.svg", fit: BoxFit.contain,)
//        ),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "Earn Protect Points",
//        description: "Read trustworthy articles, donate to causes, and share links with family and friends to earn Protect Points.",
//        centerWidget: Container(
//            height: MediaQuery.of(context).size.height/3,
//            child: SvgPicture.asset("assets/images/points.svg", fit: BoxFit.contain,)
//        ),
//        backgroundColor: Colors.deepPurpleAccent,
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "Network and Protect",
//        description:
//        "Chat with other protectors and learn about new perspectives.",
//        centerWidget: Container(
//            height: MediaQuery.of(context).size.height/3,
//            child: SvgPicture.asset("assets/images/network.svg", fit: BoxFit.contain,)
//        ),
//        backgroundColor: Colors.deepPurpleAccent,
//      ),
//    );
//  }

//  @override
//  Widget build(BuildContext context) {
//    slides = new List();
//    addSlides();
//    return Scaffold(
//      body: slider.IntroSliderScreen(
//        isShowPrevBtn: true,
//        isShowSkipBtn: false,
//        slides: this.slides,
//        onDonePress: this.onDonePress,
//      ),
//    );
//  }




  List<slider.PageModel> pageList = [
    slider.PageModel(
        color: Colors.deepPurpleAccent,
        heroAssetPath: 'assets/images/hero.svg',
        title: Text('Sign Up for a Protect',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('Become a hero. Find something that you want to protect!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: ''
    ),
    slider.PageModel(
        color: Colors.deepPurpleAccent,
        heroAssetPath: 'assets/images/points.svg',
        title: Text('Earn Protect Points',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'Read trustworthy articles, donate to causes, and share links with family and friends to earn Protect Points.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: ''),
    slider.PageModel(
      color: Colors.deepPurpleAccent,
      heroAssetPath: 'assets/images/network.svg',
      title: Text('Network and Protect',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('Chat with other protectors and learn about new perspectives.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconAssetPath: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: slider.FancyOnBoarding(

        doneButtonText: "Done",
        skipButtonText: "Skip",
        showSkipButton: false,
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProtectScreen(),
              ),
            ),
        onSkipButtonPressed: () => null
      ),
    );
  }
}