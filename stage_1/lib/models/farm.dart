import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/agricultural.dart';
import 'package:stage_1/models/placeholder.dart';

part 'farm.g.dart';

@JsonSerializable()
class Farm {
  final String? id;
  final List<String>? soils;
  @JsonKey(name: 'placeholder_ids')
  List<String>? placeholderIds;
  final double? area;
  @JsonKey(name: 'area_unit', defaultValue: 'm2')
  final String? areaUnit;
  final String? userId;
  final String? province;
  final String? district;
  final String? ward;
  final String? street;
  @JsonKey(name: 'latidute')
  final String? latitude;
  final String? longitude;
  @JsonKey(name: 'created_by', ignore: true)
  final DateTime? createdBy;
  @JsonKey(name: 'created_at', ignore: true)
  final DateTime? createdAt;
  @JsonKey(name: 'deleted_at', ignore: true)
  final DateTime? deletedAt;
  final String? status;

  final List<String>? fields;
  // final List<Map<String, dynamic>>? metadata;

// APIv1
  @JsonKey(name: 'include')
  List<String>? listOfAgriculturalId;
  @JsonKey(ignore: true)
  List<Agricultural>? listOfAgricultural;
  @JsonKey(ignore: true)
  List<Placeholder>? placeholders;

  // Area tự bịa
  @JsonKey(defaultValue: 0)
  double? areaUsed;
  @JsonKey(defaultValue: 0)
  double? areaLeft;
  Farm({
    this.id,
    this.soils,
    this.placeholderIds = const [],
    this.area,
    this.areaUnit,
    this.userId,
    this.province,
    this.district,
    this.ward,
    this.street,
    this.latitude,
    this.longitude,
    this.createdBy,
    this.createdAt,
    this.deletedAt,
    this.status,
    this.fields,
    // this.metadata,
    this.listOfAgriculturalId = const [],
    this.listOfAgricultural = const [],
    this.placeholders = const [],
    this.areaUsed,
    this.areaLeft,
  });

  factory Farm.fromJson(Map<String, dynamic> json) => _$FarmFromJson(json);
  Map<String, dynamic> toJson() => _$FarmToJson(this);

  Farm copyWith({
    String? id,
    List<String>? soils,
    List<String>? placeholderIds,
    double? area,
    String? areaUnit,
    String? userId,
    String? province,
    String? district,
    String? ward,
    String? street,
    String? latitude,
    String? longitude,
    DateTime? createdBy,
    DateTime? createdAt,
    DateTime? deletedAt,
    String? status,
    List<String>? fields,
    List<Map<String, dynamic>>? metadata,
    List<String>? listOfAgriculturalId,
    List<Agricultural>? listOfAgricultural,
    List<Placeholder>? placeholders,
    double? areaUsed,
    double? areaLeft,
  }) {
    return Farm(
      id: id ?? this.id,
      soils: soils ?? this.soils,
      placeholderIds: placeholderIds ?? this.placeholderIds,
      area: area ?? this.area,
      areaUnit: areaUnit ?? this.areaUnit,
      userId: userId ?? this.userId,
      province: province ?? this.province,
      district: district ?? this.district,
      ward: ward ?? this.ward,
      street: street ?? this.street,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      status: status ?? this.status,
      fields: fields ?? this.fields,
      // metadata: metadata ?? this.metadata,
      listOfAgriculturalId: listOfAgriculturalId ?? this.listOfAgriculturalId,
      listOfAgricultural: listOfAgricultural ?? this.listOfAgricultural,
      placeholders: placeholders ?? this.placeholders,
      areaUsed: areaUsed ?? this.areaUsed,
      areaLeft: areaLeft ?? this.areaLeft,
    );
  }
}
