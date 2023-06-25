import 'package:flutter/material.dart';
import 'package:stage_1/config/themes/text_theme.dart';
import 'package:stage_1/constants/app_constants.dart';
import 'package:stage_1/models/weather/models.dart';
import 'package:stage_1/modules/home/widgets/weather_today_widget.dart';
import 'package:stage_1/modules/home/widgets/weather_week.dart';
import 'package:stage_1/shared/services/api/weather_service.dart';
import 'package:stage_1/widgets/stless/custom_container_decoration.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  WeatherForecast? _forecast;
  bool? _isError;

  getWeather() async {
    try {
      WeatherForecast data = await WeatherService().getWeather();
      setState(() {
        _forecast = data;
      });
    } catch (e) {
      setState(() {
        _isError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return _forecast != null
        ? Container(
            decoration: borderContainer(),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppConstants.weatherTitle,
                  style: CustomTextStyle.heading3
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                _forecast?.current != null
                    ? WeatherToday(
                        current: _forecast!.current,
                      )
                    : Container(),
                _forecast?.daily != null
                    ? WeatherWeek(daily: _forecast!.daily)
                    : Container(),
              ],
            ),
          )
        : _isError == true
            ? Container()
            : Container(
                decoration: borderContainer(),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 16),
                child: const Center(child: CircularProgressIndicator()),
              );
  }
}
