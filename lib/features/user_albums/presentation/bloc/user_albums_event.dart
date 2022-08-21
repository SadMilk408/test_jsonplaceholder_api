part of 'user_albums_bloc.dart';

@immutable
abstract class UserAlbumsEvent {}

class UserAlbumsLoadingEvent extends UserAlbumsEvent {
  final int userId;
  UserAlbumsLoadingEvent({required this.userId});
}
