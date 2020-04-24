import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:protect/constant.dart';
import 'package:protect/components/my_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect/components/counter.dart';
import 'package:protect/data/covidAPI.dart';
import 'package:protect/screens/newsScreen.dart';
import 'package:protect/screens/protects/corona_info_screen.dart';
import 'package:protect/models/covid_country_model.dart';

class CoronavirusScreen extends StatefulWidget {
  @override
  _CoronavirusScreenState createState() => _CoronavirusScreenState();
}

class _CoronavirusScreenState extends State<CoronavirusScreen> {
  String selectedCountry = 'USA';
  CountryModel selectedCountryData;
  bool _isloading = true;
  PieChartData pieChartData = PieChartData(

  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCOVIDData(selectedCountry);
  }

  Future<CountryModel> fetchCOVIDData(String selectedCountry) async {
    COVID api = new COVID();
    selectedCountryData = await api.fetchCountry(selectedCountry);
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COVID-19",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "./assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is to stay at\nhome.",
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoScreen()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    height: MediaQuery.of(context).size.height/20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Get more details',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.details,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: kRecovercolor,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NewsScreen(searchQuery: "coronavirus")));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    height: MediaQuery.of(context).size.height/20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Get news',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.short_text,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height/20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset("./assets/icons/maps-and-flags.svg"),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset("./assets/icons/dropdown.svg"),
                      value: selectedCountry,
                      items: ['USA', 'India', 'China', 'Canada', 'Russia', 'France', 'Spain', 'Italy', 'Israel']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value;
                          fetchCOVIDData(selectedCountry);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height/20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Newest update: ${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
//                      Text(
//                        "See details",
//                        style: TextStyle(
//                          color: kPrimaryColor,
//                          fontWeight: FontWeight.w600,
//                        ),
//                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: _isloading
                        ? CircularProgressIndicator()
                        : Column(
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Counter(
                                    color: kInfectedColor,
                                    number: selectedCountryData.totalCases,
                                    title: "Total Cases",
                                  ),
                                  Counter(
                                    color: kDeathColor,
                                    number: selectedCountryData.totalDeaths,
                                    title: "Deaths",
                                  ),
                                  Counter(
                                    color: kRecovercolor,
                                    number: selectedCountryData.recovered,
                                    title: "Recovered",
                                  ),
                                ],
                              ),
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Counter(
                                  color: kInfectedColor,
                                  number: selectedCountryData.todayCases,
                                  title: "Today Cases",
                                ),
                                Counter(
                                  color: kDeathColor,
                                  number: selectedCountryData.todayDeaths,
                                  title: "Today Deaths",
                                ),
                                Counter(
                                  color: kCriticalcolor,
                                  number: selectedCountryData.critical,
                                  title: "Critical",
                                ),
                              ],
                            ),
                          ],
                        ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
//                      Text(
//                        "See details",
//                        style: TextStyle(
//                          color: kPrimaryColor,
//                          fontWeight: FontWeight.w600,
//                        ),
//                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/35),

                  Container(
                    child: (_isloading) ? CircularProgressIndicator() : PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 0,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sections: [
                          PieChartSectionData(
                            radius: 80,
                            color: Colors.green,
                            title: "Recovered",
                            titleStyle: TextStyle(color: Colors.black),
                            value: selectedCountryData.recovered.roundToDouble(),
                          ),
                          PieChartSectionData(
                            radius: 80,
                            color: Colors.blue,
                            titleStyle: TextStyle(color: Colors.black),
                            title: "Total Cases",
                            value: selectedCountryData.totalCases.toDouble(),
                          ),
                        ]
                      )
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
