import 'package:flutter/material.dart';
import 'package:flutter_aws_s3_client/flutter_aws_s3_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'dart:convert';

import 'package:protect/constant.dart';

class LungClassifier extends StatefulWidget {
  @override
  _LungClassifierState createState() => _LungClassifierState();
}

class _LungClassifierState extends State<LungClassifier> {
  final region = "us-west-1";
  final bucketId = "pinkapplecandypie-s3-2020-bucket";
  AwsS3Client s3client;
  File _image = File('./assets/images/lung_ex.png');
  bool _loading = false;
  bool _visible = false;
  List<String> classes = ['bacterial', 'normal', 'viral'];
  Color _color;
  String diagnoses = 'normal';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _getDataFromAWS() async {
    final response = await s3client.getObject("lungnet.tflite");
    print("res = " + response.body.toString());
  }

  void upload(File imageFile) async {
    print('uploading');
    var stream = new http.ByteStream(Stream.castFrom(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse("http://127.0.0.1:5000/upload");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile(
      'file',
      stream,
      length,
      filename: Path.basename(imageFile.path),
    );

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      var decodedJSON = json.decode(respStr);
      diagnoses = classes[decodedJSON['preds'][0] as int];
      setState(() {
        _visible = true;
        _color = diagnoses == 'normal' ? kRecovercolor : kDeathColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lung Classifier",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
        actions: <Widget>[],
      ),
      body: Visibility(
        visible: _visible,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.file(
                  _image,
                  width: MediaQuery.of(context).size.width / 1.05,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Our model has predicted that you are experiencing ',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 25.0, color: kPrimaryColor),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                color: _color,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4.0),
                                ),
                              ),
                              child: Text(
                                '${getText(diagnoses)}',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              ' pneumonia',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: kPrimaryColor,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: Icon(Icons.image),
      ),
    );
  }

  String getText(String s) {
    if(s == 'normal') return 'no symptoms of';
    else return s;
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    upload(_image);
  }
}
