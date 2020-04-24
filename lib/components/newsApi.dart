import 'package:newsapi_client/newsapi_client.dart';

class News {

  final client = NewsapiClient('b380ac8d082c47c6a36c2f288d91cc46');

  Future<Map<String, dynamic>> everythingMicrosoft() async {
    final response = await client.request(Everything(
      query: 'Microsoft',
      from: DateTime.parse('2020-02-01'),
      to: DateTime.now(),
    ));
    return response;
  }

  Future displayNews() async{
    print(everythingMicrosoft());
  }


}