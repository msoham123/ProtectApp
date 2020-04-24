import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:protect/models/co2_model.dart';

class Climate {
  String _baseURL = 'http://www.hqcasanova.com';
  String _sortQuery = 'co2';
  int HTTP_SUCCESS_CODE = 200;

  Future<CO2Model> fetchCarbonEmissionData() async {
    var response = await http.get('${_baseURL}/${_sortQuery}/?callback=callback');
//    RegExp exp = new RegExp(r'callback\((.*).*\)');
//    var match = exp.firstMatch(json.encode(response.body));
//    print("match = " + match.group(1));
//    print("encode = " + json.encode(response.body).trim());
    try {
      if(response.statusCode == HTTP_SUCCESS_CODE) {
//        var jsonData = jsonDecode(response.body);
//        var data = jsonData['callback'];
        var jsonData = json.decode(json.encode(response.body).trim());
        CO2Model instance = CO2Model.fromJSON(jsonData);
        return instance;
      } else {
        print('failed');
      }
    } catch (e) {
      throw e;
    }
  }
}
