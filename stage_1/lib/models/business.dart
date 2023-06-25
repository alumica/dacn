import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/models/user.dart';

part 'business.g.dart';

@JsonSerializable()
class Business extends User {
  final String? businessName;
  final String? license;

  Business({this.businessName, this.license});

  factory Business.fromJson(Map<String, dynamic> json ) => _$BusinessFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}