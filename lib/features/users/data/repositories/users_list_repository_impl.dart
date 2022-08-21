import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/network/network.dart';
import 'package:test_for_eclipse/features/users/data/data_sources/users_list_local_data_source.dart';
import 'package:test_for_eclipse/features/users/data/data_sources/users_list_remote_data_source.dart';
import 'package:test_for_eclipse/features/users/domain/entities/users_list_entity.dart';
import 'package:test_for_eclipse/features/users/domain/repositories/users_list_repository.dart';

class UsersListRepositoryImpl implements UsersListRepository {
  final UsersListRemoteDataSource remoteDataSource;
  final UsersListLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UsersListRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UsersListEntity>> getUsersList() async {
    try {
      final localUsers = await localDataSource.getLastUsersList();
      return Right(localUsers);
    } on CacheException {
      if (await networkInfo.isConnected ?? false) {
        try {
          final remoteUsersList = await remoteDataSource.getUsersList();
          localDataSource.cacheUsersList(remoteUsersList);
          return Right(remoteUsersList);
        } on ServerException {
          return Left(ServerFailure(message: 'Server failed'));
        }
      } else {
        return Left(CacheFailure(message: 'cache failed'));
      }
    }
  }
}
