import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';
import 'package:uuid/uuid.dart';

class LocalFarmService {
  static const String userPath = 'user';
  static const String farmsPath = 'farms';

  List<Farm> getAll() {
    List<dynamic> farmsDynamic = SharedPrefs.get('farms') ?? [];
    List<Farm> farms = farmsDynamic.map((farm) => Farm.fromJson(farm)).toList();
    return farms;
  }

  List<Farm> getByUserId() {
    String userId = User.fromJson(SharedPrefs.get('user')).id!;
    List<Farm> farms = getAll();

    return farms.where((farm) => farm.userId == userId).toList();
  }

  Farm getByFarmId(String farmId) {
    List<Farm> farms = getAll();

    return farms.firstWhere((farm) => farm.id == farmId);
  }

  Farm createFarm({required Farm farm}) {
    String userId = User.fromJson(SharedPrefs.get('user')).id!;

    farm = farm.copyWith(userId: userId, id: const Uuid().v4());

    List<Farm> farms = getAll();

    farms.add(farm);

    SharedPrefs.set(farmsPath, farms);

    return farm;
  }

  Farm updateFarm({required Farm updatedFarm}) {
    List<Farm> farms = getAll();

    farms[farms.indexWhere((farm) => farm.id == updatedFarm.id)] = updatedFarm;

    SharedPrefs.set(farmsPath, farms);

    return updatedFarm;
  }

  void deleteFarm({required Farm farm}) {
    List<Farm> farms = getAll();

    farms.removeAt(farms.indexWhere((e) => e.id == farm.id));
    farms;

    SharedPrefs.set(farmsPath, farms);
  }
}
