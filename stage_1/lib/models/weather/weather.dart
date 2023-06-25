import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/shared/helper/string_extension.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  String description;
  String icon;

  String get iconURL => 'http://openweathermap.org/img/wn/$icon@2x.png';
  String get descriptionCaps => description.capitalizeFirstofEach;

  Weather({
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
