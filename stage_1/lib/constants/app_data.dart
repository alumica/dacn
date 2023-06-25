class AppData {
  static final AppData _appData = AppData._internal();
  String appName = 'Lac Duong Project';
  String env = '';
  int version = 1;
  String apiHost = 'lacduongapidev.dlu.edu.vn';
  String apiVersion = 'api/v1';
  String apiUrl = '';
  String dbName = '';
  final String baseUrl = 'https://lacduongapi.dlu.edu.vn/api/v2';
  final String baseUrlv1 = 'https://lacduongapidev.dlu.edu.vn/api/v1';

  String openWeatherMapURL = 'api.openweathermap.org';
  String openWeatherApiKey = '1f265597ec6308021c410fde44fd3f60';

  String addressApiUrl = 'https://provinces.open-api.vn/api/';

  double widthScreen = 0;
  double heightScreen = 0;

  String pusherKey = '';
  String pusherCluster = '';
  var downloadProcess = <String, dynamic>{};
  factory AppData() {
    return _appData;
  }
  AppData._internal();
}

final appData = AppData();
