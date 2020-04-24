import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:protect/constant.dart';
import 'package:protect/components/my_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect/components/counter.dart';
import 'package:protect/data/covidAPI.dart';
import 'package:protect/lung_classifier.dart';
import 'package:protect/screens/newsScreen.dart';
import 'package:protect/screens/protects/corona_info_screen.dart';
import 'package:protect/models/covid_country_model.dart';
import 'package:protect/screens/protects/covid_map.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:share/share.dart';
import 'package:protect/screens/bluetoothScreen.dart';

class CoronavirusScreen extends StatefulWidget {
  @override
  _CoronavirusScreenState createState() => _CoronavirusScreenState();
}

class _CoronavirusScreenState extends State<CoronavirusScreen> {
  String selectedCountry = 'USA';
  CountryModel selectedCountryData;
  bool _isloading = true;
  PieChartData pieChartData = PieChartData();
  TextEditingController paymentController = new TextEditingController();
  double _paymentAmount = 0.0;
  static final String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';
  String text = 'Join Protect to learn more about COVID-19 and contrubute towards it.';
  String subject = 'COVID-19';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentController.clear();
    fetchCOVIDData(selectedCountry);
  }

  Future<CountryModel> fetchCOVIDData(String selectedCountry) async {
    COVID api = new COVID();
    selectedCountryData = await api.fetchCountry(selectedCountry);
    setState(() {
      _isloading = false;
    });
  }

  void showNonce(BraintreePaymentMethodNonce nonce) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Payment method nonce:'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Nonce: ${nonce.nonce}'),
            SizedBox(height: 16),
            Text('Type label: ${nonce.typeLabel}'),
            SizedBox(height: 16),
            Text('Description: ${nonce.description}'),
          ],
        ),
      ),
    );
  }

  void _share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        subject: subject,
        sharePositionOrigin:
        box.localToGlobal(Offset.zero) &
        box.size);
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              _share(context);
            },
          ),
        ],
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
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 20,
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
                            NewsScreen(searchQuery: "coronavirus"),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 20,
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
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => COVIDMap(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'View data on map',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.map,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    _showDialog(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Donate',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.attach_money,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
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
                      items: [
                        'USA',
                        'India',
                        'China',
                        'Canada',
                        'Russia',
                        'France',
                        'Spain',
                        'Italy',
                        'Israel'
                      ].map<DropdownMenuItem<String>>((String value) {
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
            SizedBox(height: MediaQuery.of(context).size.height / 20),
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
                              text:
                                  "Newest update: ${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  Container(
                    child: (_isloading)
                        ? CircularProgressIndicator()
                        : PieChart(
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
                                  value: selectedCountryData.recovered
                                      .roundToDouble(),
                                ),
                                PieChartSectionData(
                                  radius: 80,
                                  color: Colors.blue,
                                  titleStyle: TextStyle(color: Colors.black),
                                  title: "Total Cases",
                                  value:
                                      selectedCountryData.totalCases.toDouble(),
                                ),
                              ],
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Tools\n",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('Check for People Around You');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BluetoothScreen()));
                            },
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Icon(Icons.bluetooth, color: Colors.white, size: 30,),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            child: Text(
                              'Do you want to make sure you are away from people? Check for people now!',
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/65,
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('Get Tested Now');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LungClassifier()));
                            },
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Icon(Icons.healing, color: Colors.white, size: 30,),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            child: Text(
                              'Are you at risk of getting COVID-19?\nGet checked now!',
                              maxLines: 2,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Challenges",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('Get Tested');
                            },
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Icon(
                                Icons.star_border,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            child: Text(
                              'Read 10 Articles',
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          Flexible(
                            child: Text(
                              '+5 Protect Points',
                              style: TextStyle(color: Colors.deepPurpleAccent),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 65,
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('Get Tested');
                            },
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Icon(
                                Icons.star_border,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            child: Text(
                              'Donate to the cause',
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          Flexible(
                            child: Text(
                              '+5 Protect Points',
                              style: TextStyle(color: Colors.deepPurpleAccent),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 65,
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('Get Tested');
                            },
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Icon(
                                Icons.star_border,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            child: Text(
                              'Share to a friend',
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          Flexible(
                            child: Text(
                              '+5 Protect Points',
                              style: TextStyle(color: Colors.deepPurpleAccent),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 65,
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print('Get Tested');
                            },
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Icon(
                                Icons.title,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            child: Text(
                              'Obtain Protect Title',
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          Flexible(
                            child: Text(
                              '+ Protect Title',
                              style: TextStyle(color: Colors.deepPurpleAccent),
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 5.0),
              Text(
                  "Thank you for doing the noble cause. Your contributions are greatly appreciated."),
              SizedBox(height: 10.0),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      controller: paymentController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.card_giftcard),
                        labelText: "Donation amount",
                        hintText: "ex: 5.00",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {
                        _paymentAmount = double.parse(val);
                        print(_paymentAmount);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text("Cancel 😞"),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.purpleAccent),
              ),
              textColor: Colors.white,
              color: Colors.purpleAccent,
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text("Confirm payment"),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.purpleAccent),
              ),
              textColor: Colors.white,
              color: Colors.purpleAccent,
              onPressed: () async {
                Navigator.of(context).pop();
                var request = BraintreeDropInRequest(
                  tokenizationKey: tokenizationKey,
                  collectDeviceData: true,
                  googlePaymentRequest: BraintreeGooglePaymentRequest(
                    totalPrice: _paymentAmount.toString(),
                    currencyCode: 'USD',
                    billingAddressRequired: false,
                  ),
                );
                BraintreeDropInResult result =
                    await BraintreeDropIn.start(request);
                if (result != null) {
                  showNonce(result.paymentMethodNonce);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
