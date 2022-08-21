import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/network/network.dart';
import 'package:test_for_eclipse/features/user_posts/data/data_sources/user_posts_local_data_source.dart';
import 'package:test_for_eclipse/features/user_posts/data/data_sources/user_posts_remote_data_source.dart';
import 'package:test_for_eclipse/features/user_posts/domain/entities/posts_entity.dart';
import 'package:test_for_eclipse/features/user_posts/domain/repositories/user_posts_repository.dart';

class UserPostsRepositoryImpl implements UserPostsRepository {
  final UserPostsRemoteDataSource remoteDataSource;
  final UserPostsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserPostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PostsListEntity>> getUserPosts(int userId) async {
    try {
      final localUsers = await localDataSource.getLastUserPostsById(userId);
      return Right(localUsers);
    } on CacheException {
      if (await networkInfo.isConnected ?? false) {
        try {
          final remoteUserPosts = await remoteDataSource.getUserPosts(userId);
          localDataSource.cacheUserPosts(remoteUserPosts);
          return Right(remoteUserPosts);
        } on ServerException {
          return Left(ServerFailure(message: 'Server failed'));
        }
      } else {
        return Left(CacheFailure(message: 'cache failed'));
      }
    }
  }
}
