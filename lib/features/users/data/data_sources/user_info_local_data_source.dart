import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_for_eclipse/core/dictionaries/constants.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/features/users/data/models/users_list_model.dart';

abstract class UserInfoLocalDataSource {
  Future<UsersModel> getLastUserInfo();

  Future<void> cacheUserInfo(UsersModel usersListToCache);
}

class UserInfoLocalDataSourceImpl implements UserInfoLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserInfoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UsersModel> getLastUserInfo() {
    final jsonString = sharedPreferences.getString(cachedUsersList);
    if (jsonString != null) {
      return Future.value(UsersModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUserInfo(UsersModel usersListToCache) {
    return sharedPreferences.setString(
      cachedUsersList,
      jsonEncode(usersListToCache.toJson()),
    );
  }
}