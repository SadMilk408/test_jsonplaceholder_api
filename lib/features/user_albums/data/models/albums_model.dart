import 'package:json_annotation/json_annotation.dart';
import 'package:test_for_eclipse/features/user_albums/domain/entities/albums_entity.dart';

part 'albums_model.g.dart';

@JsonSerializable()
class AlbumsListModel extends AlbumsListEntity {
  const AlbumsListModel({
    required List<AlbumsModel> albums,
  }) : super(albums: albums);

  factory AlbumsListModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsListModelToJson(this);
}

@JsonSerializable()
class AlbumsModel extends AlbumsEntity {
  const AlbumsModel({
    required int userId,
    required int id,
    required String title,
  }) : super(userId: userId, id: id, title: title);

  factory AlbumsModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsModelToJson(this);
}
