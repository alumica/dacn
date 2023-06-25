import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/config/themes/themes.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/models/weather/current_weather_data.dart';

class WeatherToday extends StatelessWidget {
  const WeatherToday({
    Key? key,
    required this.current,
  }) : super(key: key);

  final CurrentWeatherData current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hôm nay',
              style:
                  CustomTextStyle.heading2.copyWith(color: LightTheme.greyText),
            ),
            Text(
              current.date,
              style:
                  CustomTextStyle.heading2.copyWith(color: LightTheme.greyText),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${current.temp.round()}°',
                    style: CustomTextStyle.heading1Green.copyWith(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(
                                FontAwesomeIcons.mapPin,
                                size: 20,
                                color: LightTheme.red,
                              ),
                            ),
                            TextSpan(
                                text: AppConstants.location,
                                style: CustomTextStyle.heading4
                                    .copyWith(color: LightTheme.greyText)),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(
                                FontAwesomeIcons.tint,
                                size: 20,
                                color: LightTheme.blue,
                              ),
                            ),
                            TextSpan(
                              text: '${current.humidity}%',
                              style: CustomTextStyle.heading4
                                  .copyWith(color: LightTheme.greyText),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(
                                FontAwesomeIcons.wind,
                                size: 20,
                                color: LightTheme.lightBlue,
                              ),
                            ),
                            TextSpan(
                              text: '${current.windSpeed}m/s',
                              style: CustomTextStyle.heading4
                                  .copyWith(color: LightTheme.greyText),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Image.network(
              current.weather[0].iconURL,
            ),
          ],
        ),
      ],
    );
  }
}
