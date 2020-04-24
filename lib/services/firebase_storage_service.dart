import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService {

  Future<String> uploadToFirebaseStorage({@required File file}) async {
    String filePath = 'images/${DateTime.now()}.png';
    return await upload(
      file: file,
      path: filePath,
      contentType: 'image/png',
    );
  }

  Future<String> upload({File file, String path, String contentType}) async {
    final storageReference = FirebaseStorage.instance.ref().child(path);
    final uploadTask = storageReference.putFile(
        file, StorageMetadata(contentType: contentType));
    final snapshot = await uploadTask.onComplete;
    if (snapshot.error != null) {
      print('upload error code: ${snapshot.error}');
      throw snapshot.error;
    }
    final downloadUrl = await snapshot.ref.getDownloadURL();
    print('downloadUrl: $downloadUrl');
    return downloadUrl;
  }
}