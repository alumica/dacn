import 'package:stage_1/models/soil.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/provider/log_provider.dart';

class SoilService {
  String endpoint = '/soils/';

  final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');

  Future<List<Soil>> getAll() async {
    List<Soil> soils = [];
    try {
      final response = await _apiProvider.get(endpoint);
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic soil in response.data['data']['soils']) {
          soils.add(Soil.fromJson(soil));
        }
      }
    } catch (e) {
      logger.log(e.toString());
    }
    return soils;
  }
}
