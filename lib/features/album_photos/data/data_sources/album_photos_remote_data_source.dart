import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_for_eclipse/core/dictionaries/urls.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/album_photos/data/models/photos_model.dart';

abstract class AlbumPhotosRemoteDataSource {
  Future<PhotosListModel> getPostComment(int albumId);
}

class AlbumPhotosRemoteDataSourceImpl implements AlbumPhotosRemoteDataSource {
  final http.Client client;

  AlbumPhotosRemoteDataSourceImpl({required this.client});

  @override
  Future<PhotosListModel> getPostComment(int albumId) => _getPostCommentFromUrl(
        albums.replace(
          path: '${albums.path}/$albumId/photos',
        ),
      );

  Future<PhotosListModel> _getPostCommentFromUrl(Uri uri) async {
    final response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return PhotosListModel.fromJson({'photos': jsonDecode(response.body)});
    } else {
      throw ServerException(message: 'Ошибка сервера');
    }
  }
}
