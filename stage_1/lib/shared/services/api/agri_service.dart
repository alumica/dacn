import 'package:dio/dio.dart';
import 'package:stage_1/models/agricultural.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/provider/api_v1_provider.dart';
import 'package:stage_1/shared/provider/log_provider.dart';

class AgriService {
  String endpoint = '/agricultural';

  // final _apiProvider = ApiProvider();
  final _apiv1Provider = Apiv1Provider();
  LogProvider get logger => const LogProvider('🛎 Response');

  User user = User.getSharedRef();

  Future<dynamic> getByFarmId(String farmId) async {
    try {
      List<Agricultural> agriculturals = [];
      final response = await _apiv1Provider.get('$endpoint/by-farm/$farmId',
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic agricultural in response.data['data']['agriculturals']) {
          agriculturals.add(Agricultural.fromJson(agricultural));
        }
        return agriculturals;
      }
    } catch (e) {
      logger.log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> createAgri(
      {required Agricultural agricultural, required String farmId}) async {
    try {
      final response = await _apiv1Provider.post('$endpoint/create',
          data: {
            ...agricultural.toJson(),
            'user_id': user.id,
            'farm_id': farmId,
          },
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        var agriculturalJson = response.data['data']['agricultural'];
        Agricultural agricultural = Agricultural.fromJson(agriculturalJson);
        return agricultural;
      }
    } catch (e) {
      rethrow;
    }
  }
}
