import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/weather/weather.dart';
part 'current_weather_data.g.dart';

@JsonSerializable()
class CurrentWeatherData {
  @JsonKey(name: 'dt', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime dateTime;
  final double temp;
  final int humidity;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  final List<Weather> weather;

  String get date => DateFormat("dd-MM-yyyy").format(dateTime);

  static DateTime _dateTimeFromJson(int int) =>
      DateTime.fromMillisecondsSinceEpoch(int * 1000);
  static int _dateTimeToJson(DateTime time) =>
      time.millisecondsSinceEpoch * 1000;

  CurrentWeatherData({
    required this.dateTime,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.weather,
  });

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherDataToJson(this);
}
