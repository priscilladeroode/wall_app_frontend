import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  final String postId;
  const PostDetailsPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(postId),
      ),
    );
  }
}
