import '../../../constants/app_data.dart';
import '../../../models/location.dart';
import '../../../models/weather/weather_forecast.dart';
import '../http_service.dart';

class WeatherService {
  final String endpoint = '/data/2.5/onecall';
  late HttpService httpService;

  String apiKey = appData.openWeatherApiKey;

  Location location = Location();

  WeatherService() {
    httpService = HttpService();
    httpService.withHost(appData.openWeatherMapURL);
    httpService.withPath(endpoint);
  }

  Future<WeatherForecast> getWeather() async {
    await location.getCurrentLocation();

    httpService.withQueries({
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': apiKey,
      'units': 'metric',
      'lang': 'vi',
      'exclude': 'minutely,hourly'
    });

    httpService.makeGet();

    return httpService.execute().then((ResponseObject responseObject) async {
      var data = responseObject.data;
      WeatherForecast weather = WeatherForecast.fromJson(data);

      return weather;
    });
  }
}
