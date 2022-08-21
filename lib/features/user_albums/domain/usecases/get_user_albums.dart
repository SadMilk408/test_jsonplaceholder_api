import 'package:dartz/dartz.dart';
import 'package:test_for_eclipse/core/errors/failures.dart';
import 'package:test_for_eclipse/core/usecases/usecase.dart';
import 'package:test_for_eclipse/features/user_albums/domain/entities/albums_entity.dart';
import 'package:test_for_eclipse/features/user_albums/domain/repositories/albums_list_repository.dart';

class GetUserAlbums implements UseCase<AlbumsListEntity, int> {
  final UserAlbumsRepository repository;

  GetUserAlbums(this.repository);

  @override
  Future<Either<Failure, AlbumsListEntity>> call(int userId) async {
    return await repository.getUserAlbums(userId);
  }
}