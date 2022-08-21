// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumsListModel _$AlbumsListModelFromJson(Map<String, dynamic> json) =>
    AlbumsListModel(
      albums: (json['albums'] as List<dynamic>)
          .map((e) => AlbumsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumsListModelToJson(AlbumsListModel instance) =>
    <String, dynamic>{
      'albums': instance.albums.map((e) => e.toJson()).toList(),
    };

AlbumsModel _$AlbumsModelFromJson(Map<String, dynamic> json) => AlbumsModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$AlbumsModelToJson(AlbumsModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
