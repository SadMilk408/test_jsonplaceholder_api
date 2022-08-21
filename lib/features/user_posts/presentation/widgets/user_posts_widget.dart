import 'package:flutter/material.dart';
import 'package:test_for_eclipse/features/post_comments/presentation/pages/post_comments_page.dart';
import 'package:test_for_eclipse/features/user_posts/data/models/posts_model.dart';

class UserPostsWidget extends StatelessWidget {
  final List<PostsModel> posts;

  const UserPostsWidget({
    required this.posts,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          child: MaterialButton(
            padding: EdgeInsets.zero,
            color: Colors.lightBlueAccent,
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PostCommentsPage(post: posts[index]),
                  )
              );
            },
            child: ListTile(
              title: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  text: posts[index].title,
                ),
              ),
              subtitle: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: const StrutStyle(fontSize: 12.0),
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  text: posts[index].body,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}