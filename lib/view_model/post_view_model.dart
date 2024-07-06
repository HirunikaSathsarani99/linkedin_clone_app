import 'package:flutter/material.dart';
import 'package:linkedin_clone_app/model/dummy_post_data.dart';
import 'package:linkedin_clone_app/model/post_model.dart';


class PostViewModel with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  void fetchPosts() {
    _posts = dummyPosts;
    notifyListeners();
  }
}
