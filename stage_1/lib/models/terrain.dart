import 'package:json_annotation/json_annotation.dart';

import 'soil.dart';

part 'terrain.g.dart';

@JsonSerializable()
class Terrain {
  final String name;
  final double height;
  final List<Soil> soils;
  final String userId;

  const Terrain({
    required this.name,
    required this.height,
    required this.soils,
    required this.userId,
  });

  Terrain copyWith({
    String? name,
    double? height,
    List<Soil>? soils,
    String? userId,
  }) {
    return Terrain(
      name: name ?? this.name,
      height: height ?? this.height,
      soils: soils ?? this.soils,
      userId: userId ?? this.userId,
    );
  }

  factory Terrain.fromJson(Map<String, dynamic> json) =>
      _$TerrainFromJson(json);
  Map<String, dynamic> toJson() => _$TerrainToJson(this);
}
