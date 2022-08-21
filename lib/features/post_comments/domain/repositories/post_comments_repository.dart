import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/post_comments/data/models/comments_model.dart';
import 'package:test_for_eclipse/features/post_comments/domain/entities/post_comments_entity.dart';

abstract class PostCommentsRepository {
  Future<Either<Failure, CommentsListEntity>> getPostComments(int userId);
  Future<Either<Failure, CommentsModel>> postPostComments(CommentsModel commentsModel);
}