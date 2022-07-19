// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      timestamp: json['timestamp'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : UserDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'message': instance.message,
      'data': instance.data,
    };

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['username'] as String,
      phoneNumber: json['phone_number'] as String?,
      imageUrl: json['image_url'] as String?,
      lastAccess: json['last_access'] as String?,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => UserDataRole.fromJson(e as Map<String, dynamic>))
          .toList(),
      userSpecialization: UserDataSpecialization.fromJson(
          json['user_specialization'] as Map<String, dynamic>),
      address:
          UserDataAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.email,
      'phone_number': instance.phoneNumber,
      'image_url': instance.imageUrl,
      'last_access': instance.lastAccess,
      'roles': instance.roles,
      'user_specialization': instance.userSpecialization,
      'address': instance.address,
    };

UserDataRole _$UserDataRoleFromJson(Map<String, dynamic> json) => UserDataRole(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserDataRoleToJson(UserDataRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

UserDataSpecialization _$UserDataSpecializationFromJson(
        Map<String, dynamic> json) =>
    UserDataSpecialization(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserDataSpecializationToJson(
        UserDataSpecialization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

UserDataAddress _$UserDataAddressFromJson(Map<String, dynamic> json) =>
    UserDataAddress(
      detailAddress: json['detail_address'] as String?,
      country: json['country'] as String?,
      stateProvince: json['state_province'] as String?,
      city: json['city'] as String?,
      zipCode: json['zip_code'] as String?,
    );

Map<String, dynamic> _$UserDataAddressToJson(UserDataAddress instance) =>
    <String, dynamic>{
      'detail_address': instance.detailAddress,
      'country': instance.country,
      'state_province': instance.stateProvince,
      'city': instance.city,
      'zip_code': instance.zipCode,
    };
