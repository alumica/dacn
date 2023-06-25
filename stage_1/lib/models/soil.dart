import 'package:json_annotation/json_annotation.dart';
part 'soil.g.dart';
@JsonSerializable()
class Soil {
  final String? id;
  final String? name;

  Soil({this.id, this.name});
  factory Soil.fromJson(Map<String, dynamic> json) => _$SoilFromJson(json);
  Map<String, dynamic> toJson() => _$SoilToJson(this);
}
