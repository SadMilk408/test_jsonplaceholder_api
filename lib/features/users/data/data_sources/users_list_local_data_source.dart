import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/users/data/models/users_list_model.dart';

abstract class UsersListLocalDataSource {
  Future<UsersListModel> getLastUsersList();

  Future<void> cacheUsersList(UsersListModel usersListToCache);
}

class UsersListLocalDataSourceImpl implements UsersListLocalDataSource {
  final SharedPreferences sharedPreferences;

  UsersListLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UsersListModel> getLastUsersList() {
    final jsonString = sharedPreferences.getString(cachedUsersList);
    if (jsonString != null) {
      return Future.value(UsersListModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUsersList(UsersListModel usersListToCache) {
    return sharedPreferences.setString(
      cachedUsersList,
      jsonEncode(usersListToCache.toJson()),
    );
  }
}