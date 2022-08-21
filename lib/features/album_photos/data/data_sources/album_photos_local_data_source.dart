import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/album_photos/data/models/photos_model.dart';

abstract class AlbumPhotosLocalDataSource {
  Future<PhotosListModel> getLastPostComment(int albumId);

  Future<void> cachePostComment(PhotosListModel usersListToCache);
}

class AlbumPhotosLocalDataSourceImpl implements AlbumPhotosLocalDataSource {
  final SharedPreferences sharedPreferences;

  AlbumPhotosLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PhotosListModel> getLastPostComment(int albumId) {
    final jsonString = sharedPreferences.getString('$cachedAlbumPhotosList/$albumId');
    if (jsonString != null) {
      return Future.value(PhotosListModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePostComment(PhotosListModel postCommentToCache) {
    return sharedPreferences.setString(
      '$cachedAlbumPhotosList/${postCommentToCache.photos[0].albumId}',
      jsonEncode(postCommentToCache.toJson()),
    );
  }
}