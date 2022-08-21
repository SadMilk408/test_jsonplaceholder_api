import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_for_eclipse/core/dictionaries/urls.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/users/data/models/users_list_model.dart';

abstract class UsersListRemoteDataSource {
  Future<UsersListModel> getUsersList();
}

class UsersListRemoteDataSourceImpl implements UsersListRemoteDataSource {
  final http.Client client;

  UsersListRemoteDataSourceImpl({required this.client});

  @override
  Future<UsersListModel> getUsersList() => _getUsersFromUrl(users);

  Future<UsersListModel> _getUsersFromUrl(Uri uri) async {
    final response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UsersListModel.fromJson({
        'users': jsonDecode(response.body),
      });
    } else {
      throw ServerException(message: 'Ошибка сервера');
    }
  }
}
