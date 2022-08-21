part of 'albums_photos_bloc.dart';

@immutable
abstract class AlbumsPhotosState {}

class EmptyState extends AlbumsPhotosState {}

class LoadingState extends AlbumsPhotosState {}

class ErrorState extends AlbumsPhotosState {
  final String message;

  ErrorState({required this.message});
}

class DoneState extends AlbumsPhotosState {
  final PhotosListEntity photosList;

  DoneState({required this.photosList});
}