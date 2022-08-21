import 'package:test_for_eclipse/features/users/domain/entities/users_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_list_model.g.dart';

@JsonSerializable()
class UsersListModel extends UsersListEntity {
  const UsersListModel({
    required List<UsersModel> users,
  }) : super(users: users);

  factory UsersListModel.fromJson(Map<String, dynamic> json) =>
      _$UsersListModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersListModelToJson(this);
}

@JsonSerializable()
class UsersModel extends UsersEntity {
  const UsersModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required UsersAddressModel address,
    required String phone,
    required String website,
    required UsersCompanyModel company,
  }) : super(
          id: id,
          name: name,
          username: username,
          email: email,
          address: address,
          phone: phone,
          website: website,
          company: company,
        );

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}

@JsonSerializable()
class UsersAddressModel extends UsersAddressEntity {
  const UsersAddressModel({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required UsersAddressGeoModel geo,
  }) : super(
          street: street,
          suite: suite,
          city: city,
          zipcode: zipcode,
          geo: geo,
        );

  factory UsersAddressModel.fromJson(Map<String, dynamic> json) =>
      _$UsersAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersAddressModelToJson(this);
}

@JsonSerializable()
class UsersAddressGeoModel extends UsersAddressGeoEntity {
  const UsersAddressGeoModel({
    required String lat,
    required String lng,
  }) : super(lat: lat, lng: lng);

  factory UsersAddressGeoModel.fromJson(Map<String, dynamic> json) =>
      _$UsersAddressGeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersAddressGeoModelToJson(this);
}

@JsonSerializable()
class UsersCompanyModel extends UsersCompanyEntity {
  const UsersCompanyModel({
    required String name,
    required String catchPhrase,
    required String bs,
  }) : super(name: name, catchPhrase: catchPhrase, bs: bs);

  factory UsersCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$UsersCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersCompanyModelToJson(this);
}
