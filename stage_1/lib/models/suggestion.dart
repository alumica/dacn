import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/variety.dart';

part 'suggestion.g.dart';

@JsonSerializable()
class Suggestion {
  @JsonKey(name: 'recommend_level', includeIfNull: false)
  double recommendLevel;
  @JsonKey(name: 'is_recommend', includeIfNull: false)
  bool isRecommend;
  Variety variety;
  // @JsonKey(name: 'planting_date', includeIfNull: false)
  // DateTime plantingDate;
  // @JsonKey(name: 'harvest_date', includeIfNull: false)
  // DateTime harvestDate;

  @JsonKey(name: 'planting_date', includeIfNull: false)
  String plantingDate;
  @JsonKey(name: 'harvest_date', includeIfNull: false)
  String harvestDate;

  @JsonKey(name: 'harvest_amount', includeIfNull: false)
  double harvestAmount;
  @JsonKey(name: 'harvest_amount_unit', includeIfNull: false)
  String harvestAmountUnit;
  @JsonKey(name: 'demand_amount', includeIfNull: false)
  double demandAmount;
  @JsonKey(name: 'demand_unit', includeIfNull: false)
  String demandUnit;
  @JsonKey(name: 'expected_amount', includeIfNull: false)
  double expectedAmount;
  @JsonKey(name: 'total_amount', includeIfNull: false)
  double totalAmount;
  @JsonKey(name: 'number_of_placeholders', includeIfNull: false)
  int numberOfPlaceholders;

  Suggestion(
      this.recommendLevel,
      this.isRecommend,
      this.variety,
      this.plantingDate,
      this.harvestDate,
      this.harvestAmount,
      this.demandAmount,
      this.demandUnit,
      this.expectedAmount,
      this.harvestAmountUnit,
      this.totalAmount,
      this.numberOfPlaceholders);

  factory Suggestion.fromJson(Map<String, dynamic> json) => _$SuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionToJson(this);
}
