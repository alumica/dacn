import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/provider/log_provider.dart';

class UserService {
  String endpoint = '/users';
  final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');

  Future<dynamic> updateProfile(User user) async {
    final String id = user.id ?? "";
    try {
      final response = await _apiProvider.put(endpoint + '/' + id,data: user);
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        dynamic userJson = response.data['data']['user'];
        User user = User.fromJson(userJson);
        logger.log('$userJson');
        return user;
      }
    } catch (e) {
      rethrow;
    }
  }
}
