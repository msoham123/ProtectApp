import 'package:flutter/material.dart';
//import 'package:login_dash_animation/screens/patient/mainScreen.dart';
import 'package:page_transition/page_transition.dart';
import '../main.dart';


class ButtonLoginAnimation extends StatefulWidget {

  final String label;
  final Color background;
  final Color borderColor;
  final Color fontColor;
  final Function onTap;
  final Widget child;

  const ButtonLoginAnimation({Key key, this.label, this.background, this.borderColor, this.fontColor, this.onTap, this.child}) : super(key: key);

  @override
  _ButtonLoginAnimationState createState() => _ButtonLoginAnimationState();
}

class _ButtonLoginAnimationState extends State<ButtonLoginAnimation>
with TickerProviderStateMixin {

//  final _auth = FirebaseAuth.instance;
  AnimationController _positionController;
  Animation<double> _positionAnimation;

  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool _isLogin = false;
  bool _isIconHide = false;

  @override
  void initState() {
    super.initState();

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800)
    );

    _positionAnimation = Tween<double>(begin: 10.0, end: 255.0)
    .animate(_positionController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        setState(() {
         _isIconHide = true; 
        });
        _scaleController.forward();
      }
    });

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900)
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 32)
    .animate(_scaleController)..addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.pushReplacement(context, PageTransition(
          type: PageTransitionType.fade,
//          child: LoginScreen()
        ));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          setState(() {
           _isLogin = true; 
          });
          _positionController.forward();

//          try {
//            final result =
//                await _auth.createUserWithEmailAndPassword(
//                email: MyApp.email, password: MyApp.password);
//            FirebaseUser user = result.user;
//
//            if (result != null) {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) =>
//                      LoginScreen(),
//                ),
//              );
//            } else {
//              print(result);
//            }
//          } catch (e) {
//            print(e);
//          }

        },
        child: Container(
          height: 63,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.background,
            borderRadius: BorderRadius.circular(14),
          ),
          child: !_isLogin ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.label, style: TextStyle(
                color: widget.fontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
              )),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward, color: widget.fontColor,size: 32)
            ],
          ) : Stack(
            children: <Widget>[
              AnimatedBuilder(
                animation: _positionController,
                builder: (context, child) => Positioned(
                  left: _positionAnimation.value,
                  top: 5,
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context,build) => Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: widget.borderColor,
                        shape: BoxShape.circle,
                      ),
                      child: !_isIconHide ? Icon(Icons.arrow_forward, color: widget.fontColor,size: 32) : Container(),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}