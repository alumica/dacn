import 'package:stage_1/models/seed.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/provider/log_provider.dart';

class SeedPlaceholderService {
  String endpoint = 'seeds';

  final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');

  Future<List<Seed>> getSeedList() async {
    List<Seed> seeds = [];
    try {
      final response = await _apiProvider.get('/$endpoint/');
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic seed in response.data['data']['seeds']) {
          seeds.add(Seed.fromJson(seed));
        }
      }
    } catch (e) {
      logger.log(e.toString());
    }

    return seeds;
  }
}
