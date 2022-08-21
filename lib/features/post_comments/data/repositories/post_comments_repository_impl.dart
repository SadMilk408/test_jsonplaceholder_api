import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/network/network.dart';
import 'package:test_for_eclipse/features/post_comments/data/data_sources/post_comments_local_data_source.dart';
import 'package:test_for_eclipse/features/post_comments/data/data_sources/post_comments_remote_data_source.dart';
import 'package:test_for_eclipse/features/post_comments/data/models/comments_model.dart';
import 'package:test_for_eclipse/features/post_comments/domain/entities/post_comments_entity.dart';
import 'package:test_for_eclipse/features/post_comments/domain/repositories/post_comments_repository.dart';

class PostCommentsRepositoryImpl implements PostCommentsRepository {
  final PostCommentRemoteDataSource remoteDataSource;
  final PostCommentLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostCommentsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CommentsListEntity>> getPostComments(int postId) async {
    try {
      final localUsers = await localDataSource.getLastPostComment(postId);
      return Right(localUsers);
    } on CacheException {
      if (await networkInfo.isConnected ?? false) {
        try {
          final remotePostComment = await remoteDataSource.getPostComment(postId);
          localDataSource.cachePostComment(remotePostComment);
          return Right(remotePostComment);
        } on ServerException {
          return Left(ServerFailure(message: 'Server failed'));
        }
      } else {
        return Left(CacheFailure(message: 'cache failed'));
      }
    }
  }

  @override
  Future<Either<Failure, CommentsModel>> postPostComments(CommentsModel commentsModel) async {
    try {
      final remotePostComment = await remoteDataSource.postPostComment(commentsModel);
      return Right(remotePostComment);
    } on ServerException {
      return Left(ServerFailure(message: 'Server failed'));
    }
  }
}
