part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class EmptyState extends UsersState {}

class LoadingState extends UsersState {}

class ErrorState extends UsersState {
  final String message;

  ErrorState({required this.message});
}

class DoneState extends UsersState {
  final UsersListEntity usersList;

  DoneState({required this.usersList});
}
