import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/soil.dart';

part 'variety.g.dart';

@JsonSerializable()
class Variety {
  final String? id;
  final String? code;
  final String? name;
  @JsonKey(name: 'cycle_type')
  final String? cycleType;
  @JsonKey(name: 'cycle_growth')
  final int? cycleGrowth;
  @JsonKey(name: 'harvest_frequency')
  final int? harvestFrequency;
  final List<String>? soils;
  final List<Soil>? seasons;
  @JsonKey(name: 'current_price')
  final double? currentPrice;
  @JsonKey(name: 'average_yield')
  final double? averageYield;
  @JsonKey(name: 'maximum_productivity')
  final double? maximumProductivity;
  @JsonKey(name: 'standard_unit')
  final String? standardUnit;
  // final List<Seed>? seeds;
  @JsonKey(name: '61dfb084cbfcd741392d9fde')
  final String? speciesId;
  // final List<Topography>? topographics;
  @JsonKey(name: 'farming_method')
  final String? farmingMethod;
  final String? density;
  @JsonKey(name: 'density_unit')
  final String? densityUnit;
  @JsonKey(name: 'consumption_market')
  final List<String>? consumptionMarket;
  @JsonKey(name: 'processed_rate')
  final int? processedRate;
  @JsonKey(name: 'water_source')
  final String? waterSource;
  final Map<String, dynamic>? metadata;

  const Variety({
    this.id,
    this.code,
    this.name,
    this.cycleType,
    this.cycleGrowth,
    this.harvestFrequency,
    this.soils,
    this.seasons,
    this.currentPrice,
    this.averageYield,
    this.maximumProductivity,
    this.standardUnit,
    this.speciesId,
    this.farmingMethod,
    this.density,
    this.densityUnit,
    this.consumptionMarket,
    this.processedRate,
    this.waterSource,
    this.metadata,
  });

  Variety copyWith({
    String? id,
    String? code,
    String? name,
    String? cycleType,
    int? cycleGrowth,
    int? harvestFrequency,
    List<String>? soils,
    List<Soil>? seasons,
    double? currentPrice,
    double? averageYield,
    double? maximumProductivity,
    String? standardUnit,
    String? speciesId,
    String? farmingMethod,
    String? density,
    String? densityUnit,
    List<String>? consumptionMarket,
    int? processedRate,
    String? waterSource,
    Map<String, dynamic>? metadata,
  }) {
    return Variety(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      cycleType: cycleType ?? this.cycleType,
      cycleGrowth: cycleGrowth ?? this.cycleGrowth,
      harvestFrequency: harvestFrequency ?? this.harvestFrequency,
      soils: soils ?? this.soils,
      seasons: seasons ?? this.seasons,
      currentPrice: currentPrice ?? this.currentPrice,
      averageYield: averageYield ?? this.averageYield,
      maximumProductivity: maximumProductivity ?? this.maximumProductivity,
      standardUnit: standardUnit ?? this.standardUnit,
      speciesId: speciesId ?? this.speciesId,
      farmingMethod: farmingMethod ?? this.farmingMethod,
      density: density ?? this.density,
      densityUnit: densityUnit ?? this.densityUnit,
      consumptionMarket: consumptionMarket ?? this.consumptionMarket,
      processedRate: processedRate ?? this.processedRate,
      waterSource: waterSource ?? this.waterSource,
      metadata: metadata ?? this.metadata,
    );
  }

  factory Variety.fromJson(Map<String, dynamic> json) =>
      _$VarietyFromJson(json);
  Map<String, dynamic> toJson() => _$VarietyToJson(this);
}
