import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protect/covid_webview.dart';
import '../constant.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//  void _reportSymptoms(context) {
//    bool _selected = true;
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Text("Report Symptoms"),
//          content: SingleChildScrollView(
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                SizedBox(height: 10.0),
//                Form(
//                  child: Column(
//                    children: <Widget>[
//                      CheckboxListTile(
//                        value: _selected,
//                        title: Text('Coughing'),
//                        onChanged: (value) {
//                          setState(() {
//                            _selected = value;
//                          });
//                        },
//                      ),
//                    ],
//                  ),
//                )
//              ],
//            ),
//          ),
//          actions: <Widget>[
//            RaisedButton(
//              child: Text("Cancel"),
//              shape: RoundedRectangleBorder(
//                borderRadius: new BorderRadius.circular(18.0),
//                side: BorderSide(color: Colors.purpleAccent),
//              ),
//              textColor: Colors.white,
//              color: Colors.purpleAccent,
//              onPressed: () async {
//                Navigator.of(context).pop();
//              },
//            )
//          ],
//        );
//      },
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Contact Tracing",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: true,
          actions: <Widget>[],
        ),
        body: FlutterMap(
          options: new MapOptions(
            center: LatLng(37.3688, -122.0363),
            zoom: 8.0,
          ),
          layers: [
            new TileLayerOptions(
              urlTemplate: "https://api.tiles.mapbox.com/v4/"
                  "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiZWFuZHBpIiwiYSI6ImNrOTRncDIwejBjcHAzbm4xc3lodnVlOGwifQ.gfDrOyTXxu1Y2SseVQ8W0g',
                'id': 'mapbox.streets',
              },
            ),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: new LatLng(37.3688, -122.0363),
                  builder: (ctx) => new Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.purple,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) => MyForm());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Report Symptoms',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 2.0),
                                Icon(
                                  FontAwesomeIcons.notesMedical,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: kCriticalcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) => PositiveTestForm());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Report Positive Test',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 2.0),
                                Icon(
                                  FontAwesomeIcons.viruses,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: kDeathColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    });
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool _selectedCoughing = false;
  bool _selectedFever = false;
  bool _selectedHeadache = false;
  bool _selectedTiredness = false;
  bool _selectedDryCough = false;

  Future<Null> selectDate(BuildContext context) async {
    DateTime _date = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2020));
    if (picked != null && picked != _date) {
      print(_date.toString());
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Report Symptoms"),
      content: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.calendarAlt),
                    labelText: "Start Date of Symptoms",
                    hintText: "April 14th",
                    labelStyle: TextStyle(fontSize: 12.0),
                    border: OutlineInputBorder(),
                  ),
                ),
                CheckboxListTile(
                  value: _selectedCoughing,
                  title: Text('Coughing'),
                  onChanged: (value) {
                    setState(() {
                      _selectedCoughing = value;
                    });
                  },
                ),
                CheckboxListTile(
                  value: _selectedFever,
                  title: Text('Fever'),
                  onChanged: (value) {
                    setState(() {
                      _selectedFever = value;
                    });
                  },
                ),
                CheckboxListTile(
                  value: _selectedHeadache,
                  title: Text('Headache'),
                  onChanged: (value) {
                    setState(() {
                      _selectedHeadache = value;
                    });
                  },
                ),
                CheckboxListTile(
                  value: _selectedTiredness,
                  title: Text('Tiredness'),
                  onChanged: (value) {
                    setState(() {
                      _selectedTiredness = value;
                    });
                  },
                ),
                CheckboxListTile(
                  value: _selectedDryCough,
                  title: Text('Dry Cough'),
                  onChanged: (value) {
                    setState(() {
                      _selectedDryCough = value;
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Submit"),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.purpleAccent),
                  ),
                  textColor: Colors.white,
                  color: Colors.purpleAccent,
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class PositiveTestForm extends StatefulWidget {
  @override
  _PositiveTestFormState createState() => _PositiveTestFormState();
}

class _PositiveTestFormState extends State<PositiveTestForm> {
  bool _consentShareLocation = false;
  bool _consentPublicID = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Report Positive Test"),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.calendarAlt),
                      labelText: "Start Date of Symptoms",
                      hintText: "April 10th",
                      labelStyle: TextStyle(fontSize: 12.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.calendarAlt),
                      labelText: "Date of testing",
                      hintText: "April 14th",
                      labelStyle: TextStyle(fontSize: 12.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  CheckboxListTile(
                    value: _consentShareLocation,
                    title: Text('Share Location'),
                    onChanged: (value) {
                      setState(() {
                        _consentShareLocation = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    value: _consentPublicID,
                    title: Text('Share Public Key'),
                    onChanged: (value) {
                      setState(() {
                        _consentPublicID = value;
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.purpleAccent),
                    ),
                    textColor: Colors.white,
                    color: Colors.purpleAccent,
                    onPressed: () async {
                      Navigator.of(context).pop();
                      showDialog(
                          context: context, builder: (context) => COVIDAlert());
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class COVIDAlert extends StatefulWidget {
  @override
  _COVIDAlertState createState() => _COVIDAlertState();
}

class _COVIDAlertState extends State<COVIDAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: <Widget>[
          Icon(FontAwesomeIcons.exclamationCircle,
              color: kDeathColor, size: 22.0),
          SizedBox(width: 3.0),
          Text(
            "COVID Alert!",
            style: TextStyle(
                color: kDeathColor,
                fontWeight: FontWeight.w900,
                fontSize: 22.0),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Text(
                  'In the last 14 days, you have been in close proximity to someone who tested positive for COVID-19. Please consult the symptoms page. If you feel that you have the symptoms of COVID-19, please proceed to getting tested ASAP.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Call your state ',
                      textAlign: TextAlign.justify,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => COVIDWebview()));
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'health care provider',
                            style: TextStyle(color: Colors.blue),
                          ),
                          Icon(FontAwesomeIcons.link, color: Colors.blue),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
