import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/usecases/usecase.dart';
import 'package:test_for_eclipse/features/post_comments/data/models/comments_model.dart';
import 'package:test_for_eclipse/features/post_comments/domain/repositories/post_comments_repository.dart';

class PostPostComment implements UseCase<CommentsModel, CommentsModel> {
  final PostCommentsRepository repository;

  PostPostComment(this.repository);

  @override
  Future<Either<Failure, CommentsModel>> call(CommentsModel commentsModel) async {
    return await repository.postPostComments(commentsModel);
  }
}