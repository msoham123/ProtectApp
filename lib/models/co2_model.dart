import 'package:flutter/foundation.dart';

class CO2Model {
  int current;
  int oneYearAgo;
  int tenTearsAgo;

  CO2Model({this.current, this.oneYearAgo, this.tenTearsAgo});

  factory CO2Model.fromJSON(Map<String, dynamic> json) {
    return CO2Model(
      current: json['0'] as int,
      oneYearAgo: json['1'] as int,
      tenTearsAgo: json['10'] as int
    );
  }
}