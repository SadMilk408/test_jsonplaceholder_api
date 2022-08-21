import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/network/network.dart';
import 'package:test_for_eclipse/features/user_albums/data/data_sources/user_albums_local_data_source.dart';
import 'package:test_for_eclipse/features/user_albums/data/data_sources/user_albums_remote_data_source.dart';
import 'package:test_for_eclipse/features/user_albums/domain/entities/albums_entity.dart';
import 'package:test_for_eclipse/features/user_albums/domain/repositories/albums_list_repository.dart';

class UserAlbumsRepositoryImpl implements UserAlbumsRepository {
  final UserAlbumsRemoteDataSource remoteDataSource;
  final UserAlbumsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserAlbumsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AlbumsListEntity>> getUserAlbums(int userId) async {
    try {
      final localUsers = await localDataSource.getLastUserAlbums(userId);
      return Right(localUsers);
    } on CacheException {
      if (await networkInfo.isConnected ?? false) {
        try {
          final remoteUserAlbums = await remoteDataSource.getUserAlbums(userId);
          localDataSource.cacheUserAlbums(remoteUserAlbums);
          return Right(remoteUserAlbums);
        } on ServerException {
          return Left(ServerFailure(message: 'Server failed'));
        }
      } else {
        return Left(CacheFailure(message: 'cache failed'));
      }
    }
  }
}
