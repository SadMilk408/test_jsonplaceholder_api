import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/usecases/usecase.dart';
import 'package:test_for_eclipse/features/users/domain/entities/users_list_entity.dart';
import 'package:test_for_eclipse/features/users/domain/repositories/user_info_repository.dart';

class GetUserInfo implements UseCase<UsersEntity, int> {
  final UserInfoRepository repository;

  GetUserInfo(this.repository);

  @override
  Future<Either<Failure, UsersEntity>> call(int userId) async {
    return await repository.getUserInfo(userId);
  }
}