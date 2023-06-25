import 'package:stage_1/models/agricultural.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';
import 'package:stage_1/shared/provider/log_provider.dart';
import 'package:uuid/uuid.dart';

class LocalAgriService {
  String endpoint = '/agricultural';

  // final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');

  Agricultural createAgri(
      {required Agricultural agricultural, required String farmId}) {
    agricultural = agricultural.copyWith(id: const Uuid().v4(), farmId: farmId);

    List<dynamic> agriculturalsDynamic = SharedPrefs.get('agriculturals') ?? [];
    List<Agricultural> agriculturals = agriculturalsDynamic
        .map((agri) => Agricultural.fromJson(agri))
        .toList();

    agriculturals.add(agricultural);
    SharedPrefs.set('agriculturals', agriculturals);

    return agricultural;
  }

  List<Agricultural> getByFarmId(String farmId) {
    {
      List<dynamic> agriculturalsDynamic =
          SharedPrefs.get('agriculturals') ?? [];
      List<Agricultural> agriculturals = agriculturalsDynamic
          .map((agri) => Agricultural.fromJson(agri))
          .toList();

      return agriculturals.where((agri) => agri.farmId == farmId).toList();
    }
  }
}
