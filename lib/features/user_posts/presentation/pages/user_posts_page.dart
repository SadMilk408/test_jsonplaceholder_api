import 'package:flutter/material.dart';
import 'package:test_for_eclipse/features/user_posts/data/models/posts_model.dart';

import '../widgets/user_posts_widget.dart';

class UserPostsPage extends StatelessWidget {
  final List<PostsModel> posts;

  const UserPostsPage({required this.posts, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: UserPostsWidget(posts: posts),
    );
  }
}
