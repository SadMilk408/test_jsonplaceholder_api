import 'package:equatable/equatable.dart';
import 'package:test_for_eclipse/features/users/data/models/users_list_model.dart';

class UsersListEntity extends Equatable {
  final List<UsersModel> users;

  const UsersListEntity({required this.users});

  @override
  List<Object?> get props => [users];
}

class UsersEntity extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final UsersAddressModel address;
  final String phone;
  final String website;
  final UsersCompanyModel company;

  const UsersEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  @override
  List<Object?> get props => [id, name, username, email, address, phone, website, company];
}

class UsersAddressEntity extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final UsersAddressGeoModel geo;

  const UsersAddressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];

}

class UsersAddressGeoEntity extends Equatable {
  final String lat;
  final String lng;

  const UsersAddressGeoEntity({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [lat, lng];
}

class UsersCompanyEntity extends Equatable {
  final String name;
  final String catchPhrase;
  final String bs;

  const UsersCompanyEntity({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}