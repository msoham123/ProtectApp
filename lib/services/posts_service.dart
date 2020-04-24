import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:protect/models/post_model.dart';

class PostsService {
  final CollectionReference posts = Firestore.instance.collection('posts');

  Future<void> addNewPost(PostModel p) async {
    posts.add(p.toJSON());
  }
}
