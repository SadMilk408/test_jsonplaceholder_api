import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/album_photos/domain/entities/photos_entity.dart';

abstract class AlbumPhotosRepository {
  Future<Either<Failure, PhotosListEntity>> getAlbumPhotos(int albumId);
}