import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
   String articleTitle, articleProtect, articleDate;
   var articleInformation;
   Image articleImage;


  ArticleCard({
    @required this.articleTitle,
    @required this.articleProtect,
    @required this.articleDate,
    @required this.articleInformation,
    @required this.articleImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          articleTitle,
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
                    image: articleImage.image,
                    fit: BoxFit.fill,
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      size: 18.0,
                      color: Colors.black,
                    ),

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          articleDate,
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

                    Divider(),

                    Icon(
                      Icons.assignment,
                      size: 18.0,
                      color: Colors.black,
                    ),

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          articleProtect,
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


              ],
            ),
          )
        ],
      ),
    );
  }
}