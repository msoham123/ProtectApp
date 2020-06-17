import 'package:protect/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.26),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: color,
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "${NumberFormat("#,###").format(number)}",
            style: TextStyle(
              fontSize: 25,
              color: color,
            ),
            overflow: TextOverflow.clip,
          ),
          Text(title, style: kSubTextStyle),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}


