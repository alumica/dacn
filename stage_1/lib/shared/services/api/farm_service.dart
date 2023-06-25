import 'package:dio/dio.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/provider/log_provider.dart';

class FarmService {
  String endpointv1 = '/farm';
  String endpoint = '/farms';

  final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');
  final User _user = AppStorage().user;

  Future<List<Farm>> getListFarm() async {
    List<Farm> farms = [];
    try {
      final response =
          await _apiProvider.get('$endpoint/user-id/${_user.id}?limit=200');
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic farmJson in response.data['data']['farms']) {
          String deletedAt = farmJson['deleted_at'];
          if (deletedAt.isEmpty) {
            Farm farm = Farm.fromJson(farmJson);
            // farms.add(farm.copyWith(areaLeft: farm.area));
            farms.add(farm);
          }
        }
      }
    } catch (e) {
      logger.log(e.toString());
    }

    return farms;
  }

  Future<List<Farm>> getByUserId() async {
    try {
      List<Farm> farms = [];
      User user = User.getSharedRef();
      final response = await _apiProvider.get('$endpoint/user-id/${user.id}',
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic farmJson in response.data['data']['farms']) {
          Farm farm = Farm.fromJson(farmJson);
          farms.add(farm.copyWith(areaLeft: farm.area));
        }
      }
      return farms;
    } catch (e) {
      logger.log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> createFarm({required Farm farm}) async {
    try {
      User user = User.getSharedRef();
      final response = await _apiProvider.post('$endpoint/',
          data: {
            ...farm.toJson(),
            'user_id': user.id,
          },
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        var farmJson = response.data['data']['farm'];
        Farm farm = Farm.fromJson(farmJson);
        return farm;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateFarm({required Farm farm}) async {
    try {
      User user = User.getSharedRef();
      final response = await _apiProvider.put(
        '$endpoint/${farm.id}',
        data: {
          ...farm.toJson(),
          'user_id': user.id,
        },
        options: Options(headers: {'Authorization': 'Bearer ${user.token}'}),
      );
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        var farmJson = response.data['data']['farm'];
        Farm farm = Farm.fromJson(farmJson);
        return farm;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteFarm(Farm farm) async {
    try {
      User user = User.getSharedRef();
      final response = await _apiProvider.delete('$endpoint/${farm.id}',
          data: farm,
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203, 204].contains(response.statusCode)) {
        logger.log('Delete Success !');
        return;
      }
    } catch (e) {
      rethrow;
    }
  }
}
