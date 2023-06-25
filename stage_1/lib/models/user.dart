import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';

import '../constants/app_enums.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  Role? role; // ROLE
  @JsonKey(name: 'first_name', includeIfNull: false)
  String? firstName; //HỌ TÊN
  @JsonKey(name: 'last_name', includeIfNull: false)
  String? lastName;
  @JsonKey(name: 'date_of_birth', includeIfNull: false)
  String? dob; //NGÀY SINH
  String? password;
  @JsonKey(unknownEnumValue: Gender.male)
  Gender? gender; //GIỚI TÍNH
  String? username; //SỐ ĐIỆN THOẠI
  String? province;
  String? district;
  String? ward;
  String? street;

  // ĐỊA CHỈ
  String? profilePicture; // HÌNH ĐẠI DIỆN
  String? bio;
  @JsonKey(name: 'cic_number', includeIfNull: false)
  String? cicNumber; //SỐ CMND
  String? facebookID; // LINK FACEBOOK
  String? zaloID;
  String? gdp;
  String? token;
  List<String>? listOfFarm;

  User({
    this.id,
    this.role,
    this.password,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.username,
    this.profilePicture,
    this.bio,
    this.cicNumber,
    this.facebookID,
    this.zaloID,
    this.token,
    this.gdp,
    this.province,
    this.district,
    this.ward,
    this.street,
    this.listOfFarm = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static User getSharedRef() {
    return User.fromJson(SharedPrefs.get('user'));
  }
}
