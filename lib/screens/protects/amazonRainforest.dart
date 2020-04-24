import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect/constant.dart';
import 'package:protect/components/my_header.dart';
import 'package:protect/components/counter.dart';
import 'package:protect/screens/newsScreen.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class AmazonRainforestScreen extends StatefulWidget {
  @override
  _AmazonRainforestScreenState createState() => _AmazonRainforestScreenState();
}

class _AmazonRainforestScreenState extends State<AmazonRainforestScreen> {
  String selectedCountry = 'United States';
  TextEditingController paymentController = new TextEditingController();
  double _paymentAmount = 0.0;
  static final String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Amazon Rainforest",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                MyHeader(
                  image: "",
                  textTop: "",
                  textBottom: "",
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 15,
                  top: MediaQuery.of(context).size.height / 15,
                  child: Text(
                    "Protect the largest \necosystem on the planet",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 6.5,
                  top: MediaQuery.of(context).size.height / 5,
                  child: SvgPicture.asset("assets/images/rainforest.svg",
                    fit: BoxFit.contain,
                    height:MediaQuery.of(context).size.height / 5 ,
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NewsScreen(searchQuery: "amazon rainforest"),
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
            SizedBox(height: 20),
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
                              text: "Amazon Rainforest Statistics\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: "Newest update April 13th",
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
                  SizedBox(height: 20),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Acres of Trees\n   Remaining\n",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 87,
                          title: "Fires\n\n",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 46,
                          title: "Species \n Extinct\n",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Things you can do to slow down\n                 Climate Change",
                          style: kTitleTextstyle,
                        ),
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
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 50.0),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: RaisedButton(
                      onPressed: () async {
                        _showDialog(context);
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.purpleAccent),
                      ),
                      child: Text(
                        'Donate today!',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
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
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Container(
            height: MediaQuery.of(context).size.height/4.5,
            child: ListView(
              primary: true,
//            mainAxisSize: MainAxisSize.min,
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
                ),
              ],
            ),
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
}
