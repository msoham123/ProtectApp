import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class COVIDMap extends StatefulWidget {
  @override
  _COVIDMapState createState() => _COVIDMapState();
}

class _COVIDMapState extends State<COVIDMap> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COVID Spread Map",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
      ),
      body: WebView(
        initialUrl: 'https://bing.com/covid',
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
