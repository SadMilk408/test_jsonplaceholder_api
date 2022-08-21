part of 'user_posts_bloc.dart';

@immutable
abstract class UserPostsEvent {}

class UserPostsLoadingEvent extends UserPostsEvent {
  final int userId;
  UserPostsLoadingEvent({required this.userId});
}
