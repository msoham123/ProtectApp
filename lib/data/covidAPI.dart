import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:protect/models/covid_country_model.dart';

class COVID {
  String _baseURL = 'https://corona.lmao.ninja/';
  String _sortQuery = 'countries';
  int HTTP_SUCCESS_CODE = 200;

  Future<CountryModel> fetchCountry(String countryQuery) async {
    var response = await http.get('${_baseURL}/${_sortQuery}/${countryQuery}');
    if (response.statusCode == HTTP_SUCCESS_CODE) {
      var jsonData = jsonDecode(response.body);
      CountryModel instance = new CountryModel(
          countryName: jsonData['country'],
          flagImg: jsonData['countryInfo']['flag'],
          totalCases: jsonData['cases'],
          todayCases: jsonData['todayCases'],
          totalDeaths: jsonData['deaths'],
          todayDeaths: jsonData['todayDeaths'],
          recovered: jsonData['recovered'],
          active: jsonData['active'],
          critical: jsonData['critical'],
          casesPerOneMillion: jsonData['casesPerOneMillion'],
          deathsPerOneMillion: jsonData['deathsPerOneMillion'],
          tests: jsonData['tests'],
          testsPerOneMillion: jsonData['testsPerOneMillion']);
    }
  }
}
