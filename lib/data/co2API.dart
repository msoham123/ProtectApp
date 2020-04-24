import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:protect/models/co2_model.dart';

class Climate {
  String _baseURL = 'http://www.hqcasanova.com';
  String _sortQuery = 'co2';
  int HTTP_SUCCESS_CODE = 200;

  Future<CO2Model> fetchCarbonEmissionData() async {
<<<<<<< HEAD
    var response = await http
        .get('${_baseURL}/${_sortQuery}/?callback=callback');
=======
    var response = await http.get('${_baseURL}/${_sortQuery}/?callback=callback');
>>>>>>> af2b9b434cf60b70939e021fae4e5f25b070284d
//    RegExp exp = new RegExp(r'callback\((.*).*\)');
//    var match = exp.firstMatch(json.encode(response.body));
//    print("match = " + match.group(1));
//    print("encode = " + json.encode(response.body).trim());
<<<<<<< HEAD
    // 19 20 21
    // 36 37 38
    // 54 55 56
    int current = int.parse(json.encode(response.body).trim().substring(19,22));
    int oneYearAgo = int.parse(json.encode(response.body).trim().substring(36,39));
    int tenYearsAgo = int.parse(json.encode(response.body).trim().substring(54, 57));
    try {
      if (response.statusCode == HTTP_SUCCESS_CODE) {
//        var jsonData = jsonDecode(response.body);
//        var data = jsonData['callback'];
        CO2Model instance = CO2Model(
          current: current,
          oneYearAgo: oneYearAgo,
          tenTearsAgo: tenYearsAgo
        );
=======
    try {
      if(response.statusCode == HTTP_SUCCESS_CODE) {
//        var jsonData = jsonDecode(response.body);
//        var data = jsonData['callback'];
        var jsonData = json.decode(json.encode(response.body).trim());
        CO2Model instance = CO2Model.fromJSON(jsonData);
>>>>>>> af2b9b434cf60b70939e021fae4e5f25b070284d
        return instance;
      } else {
        print('failed');
      }
    } catch (e) {
      throw e;
    }
  }
}
