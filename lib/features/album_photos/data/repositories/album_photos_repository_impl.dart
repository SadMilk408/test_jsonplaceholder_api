import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/exceptions.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/network/network.dart';
import 'package:test_for_eclipse/features/album_photos/data/data_sources/album_photos_local_data_source.dart';
import 'package:test_for_eclipse/features/album_photos/data/data_sources/album_photos_remote_data_source.dart';
import 'package:test_for_eclipse/features/album_photos/domain/entities/photos_entity.dart';
import 'package:test_for_eclipse/features/album_photos/domain/repositories/album_photos_repository.dart';

class AlbumPhotosRepositoryImpl implements AlbumPhotosRepository {
  final AlbumPhotosRemoteDataSource remoteDataSource;
  final AlbumPhotosLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AlbumPhotosRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PhotosListEntity>> getAlbumPhotos(int albumsId) async {
    try {
      final localUsers = await localDataSource.getLastPostComment(albumsId);
      return Right(localUsers);
    } on CacheException {
      if (await networkInfo.isConnected ?? false) {
        try {
          final remoteAlbumPhotos = await remoteDataSource.getPostComment(albumsId);
          localDataSource.cachePostComment(remoteAlbumPhotos);
          return Right(remoteAlbumPhotos);
        } on ServerException {
          return Left(ServerFailure(message: 'Server failed'));
        }
      } else {
        return Left(CacheFailure(message: 'cache failed'));
      }
    }
  }
}
