import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/user_albums/data/models/albums_model.dart';

abstract class UserAlbumsLocalDataSource {
  Future<AlbumsListModel> getLastUserAlbums(int userId);

  Future<void> cacheUserAlbums(AlbumsListModel usersListToCache);
}

class UserAlbumsLocalDataSourceImpl implements UserAlbumsLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserAlbumsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AlbumsListModel> getLastUserAlbums(int userId) {
    final jsonString = sharedPreferences.getString('$cachedUserAlbumsList/$userId');
    if (jsonString != null) {
      return Future.value(AlbumsListModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUserAlbums(AlbumsListModel userAlbumsToCache) {
    return sharedPreferences.setString(
      '$cachedUserAlbumsList/${userAlbumsToCache.albums[0].userId}',
      jsonEncode(userAlbumsToCache.toJson()),
    );
  }
}