import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/user_posts/data/models/posts_model.dart';

abstract class UserPostsLocalDataSource {
  Future<PostsListModel> getLastUserPostsById(int userId);

  Future<void> cacheUserPosts(PostsListModel usersListToCache);
}

class UserPostsLocalDataSourceImpl implements UserPostsLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserPostsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PostsListModel> getLastUserPostsById(int userId) {
    final jsonString = sharedPreferences.getString('$cachedUserPostsList/$userId');
    if (jsonString != null) {
      return Future.value(PostsListModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUserPosts(PostsListModel userPostsToCache) {
    return sharedPreferences.setString(
      '$cachedUserPostsList/${userPostsToCache.posts[0].userId}',
      jsonEncode(userPostsToCache.toJson()),
    );
  }
}