import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/features/user_albums/domain/entities/albums_entity.dart';

abstract class UserAlbumsRepository {
  Future<Either<Failure, AlbumsListEntity>> getUserAlbums(int userId);
}