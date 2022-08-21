import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_for_eclipse/core/dictionaries/urls.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/post_comments/data/models/comments_model.dart';

abstract class PostCommentRemoteDataSource {
  Future<CommentsListModel> getPostComment(int postId);
  Future<CommentsModel> postPostComment(CommentsModel postsModel);
}

class PostCommentRemoteDataSourceImpl implements PostCommentRemoteDataSource {
  final http.Client client;

  PostCommentRemoteDataSourceImpl({required this.client});

  @override
  Future<CommentsListModel> getPostComment(int postId) =>
      _getPostCommentFromUrl(
        posts.replace(
          path: '${posts.path}/$postId/comments',
        ),
      );

  Future<CommentsListModel> _getPostCommentFromUrl(Uri uri) async {
    final response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return CommentsListModel.fromJson(
        {
          'comments': jsonDecode(
            response.body,
          ),
        },
      );
    } else {
      throw ServerException(message: 'Ошибка сервера');
    }
  }

  @override
  Future<CommentsModel> postPostComment(CommentsModel postsModel) =>
      _postPostCommentToUrl(comments, postsModel);

  Future<CommentsModel> _postPostCommentToUrl(
      Uri uri, CommentsModel commentsModel) async {
    final response = await client.post(
      uri,
      body: jsonEncode({
        'id': commentsModel.id,
        'postId': commentsModel.postId,
        'name': commentsModel.name,
        'email': commentsModel.email,
        'body': commentsModel.body
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CommentsModel.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    } else {
      throw ServerException(message: 'Ошибка сервера');
    }
  }
}
