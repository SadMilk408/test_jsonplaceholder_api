import 'package:equatable/equatable.dart';
import 'package:test_for_eclipse/features/user_albums/data/models/albums_model.dart';

class AlbumsListEntity extends Equatable {
  final List<AlbumsModel> albums;

  const AlbumsListEntity({required this.albums});

  @override
  List<Object?> get props => [albums];
}

class AlbumsEntity extends Equatable {
  final int userId;
  final int id;
  final String title;

  const AlbumsEntity({required this.userId, required this.id, required this.title});

  @override
  List<Object?> get props => [userId, id, title];
}