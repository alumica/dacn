import 'package:stage_1/models/variety.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/provider/log_provider.dart';

class VarietyPlaceholderService {
  String endpoint = 'placeholder-varieties';

  final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');

  Future<List<Variety>> getVarietyList() async {
    List<Variety> varietyList = [];
    try {
      final response = await _apiProvider.get('/$endpoint/');
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic variety in response.data['data']
            ['placeholder_varieties']) {
          varietyList.add(Variety.fromJson(variety));
        }
      }
    } catch (e) {
      logger.log(e.toString());
    }

    return varietyList;
  }

  Future<Variety> getVariety({required String id}) async {
    Variety variety = const Variety();
    try {
      final response = await _apiProvider.get('/$endpoint/$id');
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        variety =
            Variety.fromJson(response.data['data']['placeholder_variety']);
      }
    } catch (e) {
      logger.log(e.toString());
    }

    return variety;
  }
}
