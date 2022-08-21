import 'package:equatable/equatable.dart';
import 'package:test_for_eclipse/features/post_comments/data/models/comments_model.dart';

class CommentsListEntity extends Equatable {
  final List<CommentsModel> comments;

  const CommentsListEntity({required this.comments});

  @override
  List<Object?> get props => [comments];
}

class CommentsEntity extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const CommentsEntity({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  List<Object?> get props => [postId, id, name, email, body];
}