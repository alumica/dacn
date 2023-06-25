import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/seed.dart';
import 'package:stage_1/models/variety.dart';

import 'farm.dart';

part 'placeholder.g.dart';

@JsonSerializable()
class Placeholder {
  final String? id;
  @JsonKey(name: 'farm_id')
  final String? farmId;
  @JsonKey(name: 'placeholder_variety_id')
  final String? placeholderVarietyId;
  @JsonKey(name: 'seed_id')
  final String? seedId;
  final double? area;
  @JsonKey(name: 'area_unit')
  final String? areaUnit;
  @JsonKey(name: 'seed_quantity')
  final int? seedQuantity;
  @JsonKey(name: 'seed_quantity_unit')
  final String? seedQuantityUnit;
  @JsonKey(name: 'expected_harvest_quantity')
  final double? expectedHarvestQuantity;
  @JsonKey(name: 'expected_harvest_quantity_unit')
  final String? expectedHarvestQuantityUnit;
  @JsonKey(name: 'expected_harvest_time')
  final String? expectedHarvestTime;
  @JsonKey(name: 'water_sources')
  final List<String>? waterSources;
  @JsonKey(name: 'farming_methods')
  final List<String>? farmingMethods;


  @JsonKey(name: 'placeholder_variety')
  final Variety? variety;
  @JsonKey(ignore: true)
  final Farm? farm;
  @JsonKey(ignore: true)
  final Seed? seed;


  Placeholder({
    this.id,
    this.farmId,
    this.placeholderVarietyId,
    this.seedId,
    this.area,
    this.areaUnit,
    this.seedQuantity,
    this.seedQuantityUnit,
    this.expectedHarvestQuantity,
    this.expectedHarvestQuantityUnit,
    this.expectedHarvestTime,
    this.waterSources,
    this.farmingMethods,
    this.variety,
    this.farm,
    this.seed,
  });

  factory Placeholder.fromJson(Map<String, dynamic> json) =>
      _$PlaceholderFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceholderToJson(this);

  Placeholder copyWith({
    String? id,
    String? farmId,
    String? placeholderVarietyId,
    String? seedId,
    double? area,
    String? areaUnit,
    int? seedQuantity,
    String? seedQuantityUnit,
    double? expectedHarvestQuantity,
    String? expectedHarvestQuantityUnit,
    String? expectedHarvestTime,
    List<String>? waterSources,
    List<String>? farmingMethods,
    Variety? variety,
    Farm? farm,
    Seed? seed,
    Placeholder? placeholder,
  }) {
    return Placeholder(
      id: id ?? this.id,
      farmId: farmId ?? this.farmId,
      placeholderVarietyId: placeholderVarietyId ?? this.placeholderVarietyId,
      seedId: seedId ?? this.seedId,
      area: area ?? this.area,
      areaUnit: areaUnit ?? this.areaUnit,
      seedQuantity: seedQuantity ?? this.seedQuantity,
      seedQuantityUnit: seedQuantityUnit ?? this.seedQuantityUnit,
      expectedHarvestQuantity:
          expectedHarvestQuantity ?? this.expectedHarvestQuantity,
      expectedHarvestQuantityUnit:
          expectedHarvestQuantityUnit ?? this.expectedHarvestQuantityUnit,
      expectedHarvestTime: expectedHarvestTime ?? this.expectedHarvestTime,
      waterSources: waterSources ?? this.waterSources,
      farmingMethods: farmingMethods ?? this.farmingMethods,
      variety: variety ?? this.variety,
      farm: farm ?? this.farm,
      seed: seed ?? this.seed,
    );
  }
}
