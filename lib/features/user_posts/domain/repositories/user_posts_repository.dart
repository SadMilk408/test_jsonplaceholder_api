import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/user_posts/domain/entities/posts_entity.dart';

abstract class UserPostsRepository {
  Future<Either<Failure, PostsListEntity>> getUserPosts(int userId);
}