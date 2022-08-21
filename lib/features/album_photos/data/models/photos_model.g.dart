// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosListModel _$PhotosListModelFromJson(Map<String, dynamic> json) =>
    PhotosListModel(
      photos: (json['photos'] as List<dynamic>)
          .map((e) => PhotosModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotosListModelToJson(PhotosListModel instance) =>
    <String, dynamic>{
      'photos': instance.photos.map((e) => e.toJson()).toList(),
    };

PhotosModel _$PhotosModelFromJson(Map<String, dynamic> json) => PhotosModel(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$PhotosModelToJson(PhotosModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
