import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ClinicScreen extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<ClinicScreen> {
  PageController _pageController;
  LatLng SOURCE;
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _getSource();
  }

  Future<void> _getSource() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    LatLng myLocation =
    LatLng(currentLocation.latitude, currentLocation.longitude);
    print('mylocation = ${myLocation.latitude}, ${myLocation.longitude}');
    SOURCE = myLocation;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

//  Completer<WebViewController> _controller = Completer<WebViewController>();
//  37.3921529, -122.0483755
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Clinics Near Me'),
        automaticallyImplyLeading: true,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: _getSource(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return WebView(
              javascriptMode: JavascriptMode.unrestricted,
//              initialUrl: "https://www.google.com/maps/search/+clinics+near+me/@${SOURCE.latitude},${SOURCE.longitude},13.44z",
              initialUrl:
              "https://www.google.com/maps/search/+clinics+near+me/@37.3921529,-122.0483755,13.44z",
              gestureNavigationEnabled: true,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<VerticalDragGestureRecognizer>(
                      () =>
                  VerticalDragGestureRecognizer()
                    ..onUpdate = (_) {},
                ),
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

    );
  }
}
