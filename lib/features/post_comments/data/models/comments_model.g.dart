// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsListModel _$CommentsListModelFromJson(Map<String, dynamic> json) =>
    CommentsListModel(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentsListModelToJson(CommentsListModel instance) =>
    <String, dynamic>{
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('postId', instance.postId);
  val['id'] = instance.id;
  val['name'] = instance.name;
  val['email'] = instance.email;
  val['body'] = instance.body;
  return val;
}
