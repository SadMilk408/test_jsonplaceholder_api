import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_for_eclipse/core/dictionaries/urls.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/users/data/models/users_list_model.dart';

abstract class UserInfoRemoteDataSource {
  Future<UsersModel> getUserInfo(int userId);
}

class UserInfoRemoteDataSourceImpl implements UserInfoRemoteDataSource {
  final http.Client client;

  UserInfoRemoteDataSourceImpl({required this.client});

  @override
  Future<UsersModel> getUserInfo(int userId) =>
      _getUserInfoFromUrl(
        users.replace(
          path: '${users.path}/$userId',
        ),
      );

  Future<UsersModel> _getUserInfoFromUrl(Uri uri) async {
    final response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UsersModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(message: 'Ошибка сервера');
    }
  }
}
