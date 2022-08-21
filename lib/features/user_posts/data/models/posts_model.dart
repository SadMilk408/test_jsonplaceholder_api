import 'package:json_annotation/json_annotation.dart';
import 'package:test_for_eclipse/features/user_posts/domain/entities/posts_entity.dart';

part 'posts_model.g.dart';

@JsonSerializable()
class PostsListModel extends PostsListEntity {
  const PostsListModel({
    required List<PostsModel> posts,
  }) : super(posts: posts);

  factory PostsListModel.fromJson(Map<String, dynamic> json) =>
      _$PostsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostsListModelToJson(this);
}

@JsonSerializable()
class PostsModel extends PostsEntity {
  const PostsModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : super(userId: userId, id: id, title: title, body: body);

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
}