import 'package:flutter/material.dart';
import 'package:protect/services/image_picker_service.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final key = GlobalKey<FormState>();
  File imageFile;

  Future<void> _pickImage(BuildContext context) async {
    try {
      final imageService =
          Provider.of<ImagePickerService>(context, listen: false);
      final file =
          await imageService.pickImage(imageSource: ImageSource.gallery);
      if (file != null) {
        setState(() {
          imageFile = file;
        });
      }
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  Future<void> _takeImage(BuildContext context) async {
    try {
      final imageService =
          Provider.of<ImagePickerService>(context, listen: false);
      final file =
          await imageService.pickImage(imageSource: ImageSource.camera);
      if (file != null) {
        setState(() {
          imageFile = file;
        });
      }
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  Future<void> cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        iosUiSettings: IOSUiSettings(),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Color.fromARGB(255, 104, 194, 249),
          activeControlsWidgetColor: Color.fromARGB(255, 104, 194, 249),
          activeWidgetColor: Color.fromARGB(255, 104, 194, 249),
        ));
    setState(() {
      imageFile = cropped ?? imageFile;
    });
  }

  Widget _decideImageView(BuildContext context) {
    if (imageFile == null) {
      return Image.asset(
        './assets/images/image-not-found.png',
        width: MediaQuery.of(context).size.width / 1.5,
      );
    } else {
      return Image.file(
        imageFile,
        width: MediaQuery.of(context).size.width / 1.5,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Create a Post'),
        automaticallyImplyLeading: true,
        elevation: 0.0,
      ),
      body: Builder(
        builder: (context) => Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                GestureDetector(
                  onTap: () {
                    _showPhotoOptions(context);
                  },
                  child: _decideImageView(context),
                ),
                SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: imageFile == null ? false : true,
                  child: FlatButton(
                      child: Text(
                        "Crop Image",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color.fromARGB(255, 104, 194, 249),
                      onPressed: () {
                        cropImage();
                      }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 10,
                  ),
                  child: Form(
                    key: key,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.format_list_numbered),
                            labelText: "Hashtags",
                            hintText: "#coronavirus #stayathome",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Please enter some text";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.question_answer),
                            labelText: "Description",
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 5,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Post",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.purpleAccent),
                            ),
                            textColor: Colors.white,
                            color: Colors.purpleAccent,
                            onPressed: () async {
                              print('tapped');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPhotoOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Select a picture"),
          content: new Text(
              "Either take a photo or pick a photo from your image gallery"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Take photo"),
              onPressed: () {
                _takeImage(context);
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Pick photo"),
              onPressed: () {
                _pickImage(context);
              },
            ),
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
