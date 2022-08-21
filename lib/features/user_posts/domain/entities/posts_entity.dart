import 'package:equatable/equatable.dart';
import 'package:test_for_eclipse/features/user_posts/data/models/posts_model.dart';

class PostsListEntity extends Equatable {
  final List<PostsModel> posts;

  const PostsListEntity({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostsEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostsEntity({required this.userId, required this.id, required this.title, required this.body});

  @override
  List<Object?> get props => [userId, id, title, body];
}