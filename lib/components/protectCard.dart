import 'package:flutter/material.dart';
import 'package:protect/screens/protectInfoScreen.dart';

class protectCard extends StatelessWidget {
   String protectTitle;
   var protectInformation;
   Image protectImage;


  protectCard({
    @required this.protectImage,
    @required this.protectTitle,
    this.protectInformation
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProtectInformationScreen(protectImage: protectImage,protectTitle: protectTitle,)));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width/2,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            protectTitle,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: MediaQuery.of(context).size.height/3.5,
                      width: MediaQuery.of(context).size.width/1.5,
                      image: protectImage.image,
                      fit: BoxFit.fill,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}