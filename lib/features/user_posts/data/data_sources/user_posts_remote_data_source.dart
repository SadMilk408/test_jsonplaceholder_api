import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_for_eclipse/core/dictionaries/urls.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/user_posts/data/models/posts_model.dart';

abstract class UserPostsRemoteDataSource {
  Future<PostsListModel> getUserPosts(int userId);
}

class UserPostsRemoteDataSourceImpl implements UserPostsRemoteDataSource {
  final http.Client client;

  UserPostsRemoteDataSourceImpl({required this.client});

  @override
  Future<PostsListModel> getUserPosts(int userId) => _getUserPostsFromUrl(
        users.replace(
          path: '${users.path}/$userId/posts',
        ),
      );

  Future<PostsListModel> _getUserPostsFromUrl(Uri uri) async {
    final response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return PostsListModel.fromJson({
        "posts": jsonDecode(response.body),
      });
    } else {
      throw ServerException(message: 'Ошибка сервера');
    }
  }
}
