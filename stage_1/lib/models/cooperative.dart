import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/models/user.dart';

part 'cooperative.g.dart';

@JsonSerializable()
class Cooperative extends User {
  final String? name;

  Cooperative({this.name});

  factory Cooperative.fromJson(Map<String,dynamic> json) => _$CooperativeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CooperativeToJson(this);
  
}