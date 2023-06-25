import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/variety.dart';

part 'seed.g.dart';

@JsonSerializable()
class Seed {
  final String? id;
  final String? name;
  final String? code;
  @JsonKey(name: 'cycle_growth')
  final double? cycleGrowth;
  @JsonKey(name: 'harvest_frequency')
  final double? harvestFrequency;
  @JsonKey(name: 'current_price')
  final double? currentPrice;
  final String? resistance;
  @JsonKey(name: 'average_yield')
  final double? averageYield;
  @JsonKey(name: 'standard_unit')
  final String? standardUnit;
  @JsonKey(name: 'placeholder_variety_id')
  final String? placeholderVarietyId;

  @JsonKey(ignore: true)
  final Variety? variety;

  const Seed(
      {this.id,
      this.name,
      this.code,
      this.cycleGrowth,
      this.harvestFrequency,
      this.currentPrice,
      this.resistance,
      this.averageYield,
      this.standardUnit,
      this.placeholderVarietyId,
      this.variety});

  Seed copyWith({
    String? id,
    String? name,
    String? code,
    double? cycleGrowth,
    double? harvestFrequency,
    double? currentPrice,
    String? resistance,
    double? averageYield,
    String? standardUnit,
    String? placeholderVarietyId,
    Variety? variety,
  }) {
    return Seed(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      cycleGrowth: cycleGrowth ?? this.cycleGrowth,
      harvestFrequency: harvestFrequency ?? this.harvestFrequency,
      currentPrice: currentPrice ?? this.currentPrice,
      resistance: resistance ?? this.resistance,
      averageYield: averageYield ?? this.averageYield,
      standardUnit: standardUnit ?? this.standardUnit,
      placeholderVarietyId: placeholderVarietyId ?? this.placeholderVarietyId,
      variety: variety ?? this.variety,
    );
  }

  factory Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);
  Map<String, dynamic> toJson() => _$SeedToJson(this);
}
