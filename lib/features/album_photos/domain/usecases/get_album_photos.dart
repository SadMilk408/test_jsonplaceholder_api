import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/usecases/usecase.dart';
import 'package:test_for_eclipse/features/album_photos/domain/entities/photos_entity.dart';
import 'package:test_for_eclipse/features/album_photos/domain/repositories/album_photos_repository.dart';

class GetAlbumPhotos implements UseCase<PhotosListEntity, int> {
  final AlbumPhotosRepository repository;

  GetAlbumPhotos(this.repository);

  @override
  Future<Either<Failure, PhotosListEntity>> call(int albumId) async {
    return await repository.getAlbumPhotos(albumId);
  }
}