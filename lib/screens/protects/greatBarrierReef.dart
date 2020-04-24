import 'package:flutter/material.dart';
import 'package:protect/constant.dart';
import 'package:protect/components/my_header.dart';
import 'package:protect/components/counter.dart';
import 'package:protect/screens/newsScreen.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:share/share.dart';

class GreatBarrierReefScreen extends StatefulWidget {
  @override
  _GreatBarrierReefScreenState createState() => _GreatBarrierReefScreenState();
}

class _GreatBarrierReefScreenState extends State<GreatBarrierReefScreen> {
  String selectedCountry = 'United States';
  TextEditingController paymentController = new TextEditingController();
  double _paymentAmount = 0.0;
  static final String tokenizationKey = 'sandbox_8hxpnkht_kzdtzv2btm4p7s5j';

  String text =
      'Join Protect to learn more about the Great Barrier Reef and contrubute towards it.';
  String subject = 'The Great Barrier Reef';

  void _share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Great Barrier Reef",
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
          )
        ],
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
                  left: MediaQuery.of(context).size.width / 75,
                  top: MediaQuery.of(context).size.height / 9,
                  child: Image.asset(
                    "assets/images/reef.png",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width / 1.03,
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 15,
                  top: MediaQuery.of(context).size.height / 55,
                  child: Text(
                    "Protect the largest marine \necosystem on the planet",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
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
                        NewsScreen(searchQuery: "great barrier reef"),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
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
                              text: "Great Barrier Reef Statistics\n",
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
                          title: "Number of \nSpecies of \n     Coral",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 87,
                          title: "Dead Reefs\n\n  ",
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
