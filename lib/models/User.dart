import 'package:flutter/foundation.dart';

class ProtectUser {
  final String fullName;
  final int age;
  final int protectPoints;
  final DateTime dateAccountCreated;

  ProtectUser({@required this.fullName, @required this.age, @required this.protectPoints, @required this.dateAccountCreated});

  factory ProtectUser.fromJSON(Map<String, dynamic> data) {
    return ProtectUser(
      fullName: data['full_name'] as String,
      age: data['age'] as int,
      protectPoints: data['protect_points'] as int,
      dateAccountCreated: data['date_account_created']
    );
  }

  Map<String, dynamic> toJSON(ProtectUser instance) => <String, dynamic>{
      'full_name': instance.fullName,
      'age': instance.age,
      'protect_points': instance.protectPoints,
      'date_account_created': instance.dateAccountCreated
  };
}