import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/usecases/usecase.dart';
import 'package:test_for_eclipse/features/users/domain/entities/users_list_entity.dart';
import 'package:test_for_eclipse/features/users/domain/repositories/users_list_repository.dart';

class GetUsersList implements UseCase<UsersListEntity, NoParams> {
  final UsersListRepository repository;

  GetUsersList(this.repository);

  @override
  Future<Either<Failure, UsersListEntity>> call(NoParams) async {
    return await repository.getUsersList();
  }
}