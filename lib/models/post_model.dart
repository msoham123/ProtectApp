import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String sender;
  List<String> hashtags;
  String description;
  String date;
  FieldValue timestamp;
  String imageURL;

  PostModel({this.sender, this.hashtags, this.description, this.date, this.timestamp, this.imageURL});

  Map<String, dynamic> toJSON() => <String, dynamic>{
    'sender': sender,
    'hashtags': hashtags,
    'description': description,
    'date': date,
    'timestamp': timestamp,
    'imageURL': imageURL,
  };
}