// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersListModel _$UsersListModelFromJson(Map<String, dynamic> json) =>
    UsersListModel(
      users: (json['users'] as List<dynamic>)
          .map((e) => UsersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersListModelToJson(UsersListModel instance) =>
    <String, dynamic>{
      'users': instance.users.map((e) => e.toJson()).toList(),
    };

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address:
          UsersAddressModel.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      website: json['website'] as String,
      company:
          UsersCompanyModel.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address.toJson(),
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company.toJson(),
    };

UsersAddressModel _$UsersAddressModelFromJson(Map<String, dynamic> json) =>
    UsersAddressModel(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: UsersAddressGeoModel.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersAddressModelToJson(UsersAddressModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo.toJson(),
    };

UsersAddressGeoModel _$UsersAddressGeoModelFromJson(
        Map<String, dynamic> json) =>
    UsersAddressGeoModel(
      lat: json['lat'] as String,
      lng: json['lng'] as String,
    );

Map<String, dynamic> _$UsersAddressGeoModelToJson(
        UsersAddressGeoModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

UsersCompanyModel _$UsersCompanyModelFromJson(Map<String, dynamic> json) =>
    UsersCompanyModel(
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );

Map<String, dynamic> _$UsersCompanyModelToJson(UsersCompanyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
