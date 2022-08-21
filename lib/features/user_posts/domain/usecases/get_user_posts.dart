import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/usecases/usecase.dart';
import 'package:test_for_eclipse/features/user_posts/domain/entities/posts_entity.dart';
import 'package:test_for_eclipse/features/user_posts/domain/repositories/user_posts_repository.dart';

class GetUserPosts implements UseCase<PostsListEntity, int> {
  final UserPostsRepository repository;

  GetUserPosts(this.repository);

  @override
  Future<Either<Failure, PostsListEntity>> call(int userId) async {
    return await repository.getUserPosts(userId);
  }
}