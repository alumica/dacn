import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/models/weather/weather_data.dart';

class WeatherWeek extends StatelessWidget {
  final List<WeatherData> daily;
  const WeatherWeek({Key? key, required this.daily}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: daily
            .map((weather) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Text(
                        weather.date,
                        style: CustomTextStyle.heading4
                            .copyWith(color: LightTheme.greyText),
                      ),
                      Image.network(
                        weather.weather[0].iconURL,
                        width: 80,
                      ),
                      Text(
                        '${weather.temp.min.round()} - ${weather.temp.max.round()}°',
                        style: CustomTextStyle.heading4
                            .copyWith(color: LightTheme.greyText),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
