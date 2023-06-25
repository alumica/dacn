import 'package:stage_1/models/suggestion.dart';

import '../../provider/api_provider.dart';
import '../../provider/log_provider.dart';

class SuggestionService {
  final _apiProvider = ApiProvider();

  LogProvider get logger => const LogProvider('🛎 Response');

  Future<List<Suggestion>> getSuggestionByVariety(
      String varietyID, String plantedDate, String area) async {
    List<Suggestion> suggestions = [];
    try {
      final response = await _apiProvider.get(
          '/statistic/get-suggestion/by-variety?variety=$varietyID&planting-date=$plantedDate&area=$area&area-unit=m2');
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        // print(response.data['data']['recommeds']);
        dynamic jsonlist = response.data['data']['recommeds'];

        for (dynamic suggestJson in jsonlist) {
          Suggestion suggestion = Suggestion.fromJson(suggestJson);
          suggestions.add(suggestion);
        }
      }
    } catch (e) {
      logger.log(e.toString());
    }
    return suggestions;
  }
}
