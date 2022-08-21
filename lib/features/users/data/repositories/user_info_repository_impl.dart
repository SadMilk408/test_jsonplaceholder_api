import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/network/network.dart';
import 'package:test_for_eclipse/features/users/data/data_sources/user_info_local_data_source.dart';
import 'package:test_for_eclipse/features/users/data/data_sources/user_info_remote_data_source.dart';
import 'package:test_for_eclipse/features/users/domain/entities/users_list_entity.dart';
import 'package:test_for_eclipse/features/users/domain/repositories/user_info_repository.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  final UserInfoRemoteDataSource remoteDataSource;
  final UserInfoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserInfoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UsersEntity>> getUserInfo(int userId) async {
    try {
      final localUserInfo = await localDataSource.getLastUserInfo();
      return Right(localUserInfo);
    } on CacheException {
      if (await networkInfo.isConnected ?? false) {
        try {
          final remoteUserInfo = await remoteDataSource.getUserInfo(userId);
          localDataSource.cacheUserInfo(remoteUserInfo);
          return Right(remoteUserInfo);
        } on ServerException {
          return Left(ServerFailure(message: 'Server failed'));
        }
      } else {
        return Left(CacheFailure(message: 'cache failed'));
      }
    }
  }
}
