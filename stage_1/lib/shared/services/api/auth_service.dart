import 'package:stage_1/constants/app_data.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/provider/log_provider.dart';

import '../http_service.dart';

class AuthService {
  String endpoint = 'auth';

  final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');

  Future<bool> getToken() async {
    var value = SharedPrefs.instance.getString("token");
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveToken(String token) async {
    SharedPrefs.instance.setString("token", token);
  }

  late HttpService httpService;

  AuthService() {
    httpService = HttpService();
    httpService
        .withHost(appData.apiHost)
        .withVersion(appData.apiVersion)
        .withPath(endpoint);
  }

  Future<dynamic> signIn(String username, String password) async {
    try {
      final response = await _apiProvider.post('/auth/login',
          data: {"username": username, "password": password});
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        dynamic userJson = response.data['data']['success']['user'];
        User user = User.fromJson(userJson);
        logger.log('$userJson');
        return user;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUp(User user) async {
    try {
      final response = await _apiProvider.post('/auth/register', data: user);
      if (response.statusCode == 200) {
        logger.log('$response.data');
        return response.data;
      }
    } catch (e) {
      // logger.log(e.toString());
      rethrow;
    }
  }
}
