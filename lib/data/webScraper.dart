import 'dart:convert'; // Contains the JSON encoder

import 'package:http/http.dart'; // Contains a client for making API calls
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart'; // Contains DOM related classes for extracting data from elements


Future initiate(BaseClient client) async {
  var client = Client();
  Response response = await client.get(
    'https://news.ycombinator.com'
  );

  print(response.body);

  // Use html parser and query selector
  var document = parse(response.body);
  List<Element> links = document.querySelectorAll('td.title > a.storylink');

  //traverse the collection
  List<Map<String, dynamic>> linkMap = [];

  for (var link in links) {
    linkMap.add({
      'title': link.text,
      'href': link.attributes['href'],
    });
  }

  return json.encode(linkMap);

}