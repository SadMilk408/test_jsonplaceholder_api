part of 'user_albums_bloc.dart';

@immutable
abstract class UserAlbumsState {}

class EmptyState extends UserAlbumsState {}

class LoadingState extends UserAlbumsState {}

class ErrorState extends UserAlbumsState {
  final String message;

  ErrorState({required this.message});
}

class DoneState extends UserAlbumsState {
  final AlbumsListEntity albumsList;

  DoneState({required this.albumsList});
}