import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/users/domain/entities/users_list_entity.dart';

abstract class UserInfoRepository {
  Future<Either<Failure, UsersEntity>> getUserInfo(int userId);
}