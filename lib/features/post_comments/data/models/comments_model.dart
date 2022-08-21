import 'package:json_annotation/json_annotation.dart';
import 'package:test_for_eclipse/features/post_comments/domain/entities/post_comments_entity.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class CommentsListModel extends CommentsListEntity {
  const CommentsListModel({
    required List<CommentsModel> comments,
  }) : super(comments: comments);

  factory CommentsListModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsListModelToJson(this);
}

@JsonSerializable()
class CommentsModel extends CommentsEntity {
  const CommentsModel({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) : super(postId: postId, id: id, name: name, email: email, body: body);

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}
