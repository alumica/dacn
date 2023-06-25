import 'package:json_annotation/json_annotation.dart';
import 'package:stage_1/models/weather/weather_data.dart';
import 'current_weather_data.dart';

part 'weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  final CurrentWeatherData current;
  final List<WeatherData> daily;

  WeatherForecast({
    required this.current,
    required this.daily,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);

  // factory WeatherForecast.fromJson(Map<String, dynamic> json) {
  //   CurrentWeatherData current = CurrentWeatherData.fromJson(json['current']);

  //   List<WeatherData> daily = [];
  //   List<dynamic> dailyJson = json['daily'];
  //   for (dynamic weatherData in dailyJson) {
  //     daily.add(WeatherData.fromJson(weatherData));
  //   }

  //   return WeatherForecast(
  //     current: current,
  //     daily: daily,
  //   );
  // }
}
