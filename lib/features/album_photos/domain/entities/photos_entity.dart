import 'package:equatable/equatable.dart';
import 'package:test_for_eclipse/features/album_photos/data/models/photos_model.dart';

class PhotosListEntity extends Equatable {
  final List<PhotosModel> photos;

  const PhotosListEntity({required this.photos});

  @override
  List<Object?> get props => [photos];
}

class PhotosEntity extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotosEntity({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];
}