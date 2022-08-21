part of 'albums_photos_bloc.dart';

@immutable
abstract class AlbumsPhotosEvent {}

class AlbumsPhotosLoadingEvent extends AlbumsPhotosEvent {
  final int albumId;
  AlbumsPhotosLoadingEvent({required this.albumId});
}
