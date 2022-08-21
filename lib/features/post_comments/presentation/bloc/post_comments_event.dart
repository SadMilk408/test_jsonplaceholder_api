part of 'post_comments_bloc.dart';

@immutable
abstract class PostCommentsEvent {}

class PostCommentsLoadingEvent extends PostCommentsEvent {
  final int postId;
  PostCommentsLoadingEvent({required this.postId});
}

class SendNewCommentEvent extends PostCommentsEvent {
  final CommentsModel commentsModel;
  SendNewCommentEvent({required this.commentsModel});
}