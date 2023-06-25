import 'package:json_annotation/json_annotation.dart';

part 'agricultural.g.dart';

@JsonSerializable()
class Agricultural {
  Agricultural({
    this.id,
    this.name,
    this.categories,
    this.parentId,
    this.typeOfSeed,
    this.quantity,
    this.unit,
    this.startedAt,
    this.releaseAt,
    this.releaseQuantity,
    this.area,
    this.areaUnit = 'hecta',
    this.farmId,
    this.userID,
    this.createdAt,
    this.deletedAt,
    this.updateAt,
    this.status,
  });

  final String? id;
  final String? name;
  final List<String>? categories;
  final String? parentId;
  final double? quantity;
  final String? unit;
  @JsonKey(name: 'release_at')
  final String? releaseAt;
  @JsonKey(name: 'release_quantity')
  final double? releaseQuantity;
  final double? area;
  @JsonKey(name: 'area_unit', defaultValue: 'hecta')
  final String? areaUnit;
  final String? farmId;
  final String? userID;

  @JsonKey(name: 'type_of_seed')
  final String? typeOfSeed;
  @JsonKey(name: 'started_at')
  final String? startedAt;

  final DateTime? createdAt;
  final DateTime? deletedAt;
  final DateTime? updateAt;
  final String? status;

  factory Agricultural.fromJson(Map<String, dynamic> json) =>
      _$AgriculturalFromJson(json);

  Map<String, dynamic> toJson() => _$AgriculturalToJson(this);

  Agricultural copyWith({
    String? id,
    String? name,
    List<String>? categories,
    String? parentId,
    double? quantity,
    String? unit,
    String? releaseAt,
    double? releaseQuantity,
    double? area,
    String? areaUnit,
    String? farmId,
    String? userID,
    String? typeOfSeed,
    String? startedAt,
    DateTime? createdAt,
    DateTime? deletedAt,
    DateTime? updateAt,
    String? status,
  }) {
    return Agricultural(
      id: id ?? this.id,
      name: name ?? this.name,
      categories: categories ?? this.categories,
      parentId: parentId ?? this.parentId,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      releaseAt: releaseAt ?? this.releaseAt,
      releaseQuantity: releaseQuantity ?? this.releaseQuantity,
      area: area ?? this.area,
      areaUnit: areaUnit ?? this.areaUnit,
      farmId: farmId ?? this.farmId,
      userID: userID ?? this.userID,
      typeOfSeed: typeOfSeed ?? this.typeOfSeed,
      startedAt: startedAt ?? this.startedAt,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      updateAt: updateAt ?? this.updateAt,
      status: status ?? this.status,
    );
  }
}
