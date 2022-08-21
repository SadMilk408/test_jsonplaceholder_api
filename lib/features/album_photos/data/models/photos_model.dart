import 'package:json_annotation/json_annotation.dart';
import 'package:test_for_eclipse/features/album_photos/domain/entities/photos_entity.dart';

part 'photos_model.g.dart';

@JsonSerializable()
class PhotosListModel extends PhotosListEntity {
  const PhotosListModel({
    required List<PhotosModel> photos,
  }) : super(photos: photos);

  factory PhotosListModel.fromJson(Map<String, dynamic> json) => _$PhotosListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosListModelToJson(this);
}

@JsonSerializable()
class PhotosModel extends PhotosEntity {
  const PhotosModel({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) : super(albumId: albumId, id: id, title: title, url: url, thumbnailUrl: thumbnailUrl);

  factory PhotosModel.fromJson(Map<String, dynamic> json) => _$PhotosModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosModelToJson(this);
}