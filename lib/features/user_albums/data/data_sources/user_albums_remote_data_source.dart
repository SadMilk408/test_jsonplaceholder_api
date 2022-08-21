import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_for_eclipse/core/dictionaries/urls.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/user_albums/data/models/albums_model.dart';

abstract class UserAlbumsRemoteDataSource {
  Future<AlbumsListModel> getUserAlbums(int userId);
}

class UserAlbumsRemoteDataSourceImpl implements UserAlbumsRemoteDataSource {
  final http.Client client;

  UserAlbumsRemoteDataSourceImpl({required this.client});

  @override
  Future<AlbumsListModel> getUserAlbums(int userId) => _getUserAlbumsFromUrl(
        users.replace(
          path: '${users.path}/$userId/albums',
        ),
      );

  Future<AlbumsListModel> _getUserAlbumsFromUrl(Uri uri) async {
    final response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return AlbumsListModel.fromJson({'albums': jsonDecode(response.body)});
    } else {
      throw ServerException(message: 'Ошибка сервера');
    }
  }
}
