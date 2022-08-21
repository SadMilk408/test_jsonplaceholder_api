import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/post_comments/data/models/comments_model.dart';

abstract class PostCommentLocalDataSource {
  Future<CommentsListModel> getLastPostComment(int postId);

  Future<void> cachePostComment(CommentsListModel usersListToCache);
}

class PostCommentLocalDataSourceImpl implements PostCommentLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostCommentLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CommentsListModel> getLastPostComment(int postId) {
    final jsonString = sharedPreferences.getString('$cachedPostCommentsList/$postId');
    if (jsonString != null) {
      return Future.value(CommentsListModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePostComment(CommentsListModel postCommentToCache) {
    return sharedPreferences.setString(
      '$cachedPostCommentsList/${postCommentToCache.comments[0].postId}',
      jsonEncode(postCommentToCache.toJson()),
    );
  }
}