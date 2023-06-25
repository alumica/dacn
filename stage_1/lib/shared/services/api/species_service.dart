import 'package:stage_1/models/species.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/provider/log_provider.dart';

class SpeciesPlaceholderService {
  String endpoint = 'placeholder-species';

  final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');

  Future<List<Species>> getSpeciesList() async {
    List<Species> speciesList = [];
    try {
      final response = await _apiProvider.get('/$endpoint/');
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic species in response.data['data']['placeholder_species']) {
          speciesList.add(Species.fromJson(species));
        }
      }
    } catch (e) {
      logger.log(e.toString());
    }

    return speciesList;
  }
}
