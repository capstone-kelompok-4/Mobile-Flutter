import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  bool status;
  String message;
  UserDataModel? data;

  UserModel({required this.status, required this.message, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserDataModel {
  int id;
  String email;
  String? name;
  String? specialist;
  String? phone;
  String? address;
  String? country;
  String? province;
  String? city;
  @JsonKey(name: 'zip_code')
  int? zipCode;

  UserDataModel(
      {required this.id,
      required this.email,
      this.name,
      this.specialist,
      this.phone,
      this.address,
      this.country,
      this.province,
      this.city,
      this.zipCode});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
