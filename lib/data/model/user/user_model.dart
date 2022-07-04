import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String timestamp;
  String message;
  UserDataModel? data;

  UserModel({required this.timestamp, required this.message, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserDataModel {
  int id;
  String name;
  String username;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  @JsonKey(name: 'image_url')
  String imageUrl;
  List<UserDataRole> roles;
  @JsonKey(name: 'user_specialization')
  UserDataSpecialization userSpecialization;
  UserDataAddress address;

  UserDataModel({
    required this.id,
    required this.name,
    required this.username,
    required this.phoneNumber,
    required this.imageUrl,
    required this.roles,
    required this.userSpecialization,
    required this.address,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

@JsonSerializable()
class UserDataRole {
  int id;
  String name;

  UserDataRole({required this.id, required this.name});

  factory UserDataRole.fromJson(Map<String, dynamic> json) => _$UserDataRoleFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataRoleToJson(this);
}

@JsonSerializable()
class UserDataSpecialization {
  int id;
  String name;

  UserDataSpecialization({required this.id, required this.name});

  factory UserDataSpecialization.fromJson(Map<String, dynamic> json) =>
      _$UserDataSpecializationFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataSpecializationToJson(this);
}

@JsonSerializable()
class UserDataAddress {
  @JsonKey(name: 'detail_address')
  String detailAddress;
  String country;
  @JsonKey(name: 'state_province')
  String stateProvince;
  String city;
  @JsonKey(name: 'zip_code')
  String zipCode;

  UserDataAddress({
    required this.detailAddress,
    required this.country,
    required this.stateProvince,
    required this.city,
    required this.zipCode,
  });

  factory UserDataAddress.fromJson(Map<String, dynamic> json) => _$UserDataAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataAddressToJson(this);
}
