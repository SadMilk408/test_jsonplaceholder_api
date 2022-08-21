import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/usecases/usecase.dart';
import 'package:test_for_eclipse/features/post_comments/domain/entities/post_comments_entity.dart';
import 'package:test_for_eclipse/features/post_comments/domain/repositories/post_comments_repository.dart';

class GetPostComment implements UseCase<CommentsListEntity, int> {
  final PostCommentsRepository repository;

  GetPostComment(this.repository);

  @override
  Future<Either<Failure, CommentsListEntity>> call(int postId) async {
    return await repository.getPostComments(postId);
  }
}