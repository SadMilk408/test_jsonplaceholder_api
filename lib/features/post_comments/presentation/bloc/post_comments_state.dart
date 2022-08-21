part of 'post_comments_bloc.dart';

@immutable
abstract class PostCommentsState {}

class EmptyState extends PostCommentsState {}

class LoadingState extends PostCommentsState {}

class ErrorState extends PostCommentsState {
  final String message;

  ErrorState({required this.message});
}

class DoneState extends PostCommentsState {
  final CommentsListEntity postsList;

  DoneState({required this.postsList});
}
