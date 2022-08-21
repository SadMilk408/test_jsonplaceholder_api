part of 'user_posts_bloc.dart';

@immutable
abstract class UserPostsState {}

class EmptyState extends UserPostsState {}

class LoadingState extends UserPostsState {}

class ErrorState extends UserPostsState {
  final String message;

  ErrorState({required this.message});
}

class DoneState extends UserPostsState {
  final PostsListEntity postsList;

  DoneState({required this.postsList});
}