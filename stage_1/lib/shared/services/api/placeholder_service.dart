import 'package:dio/dio.dart';
import 'package:stage_1/models/placeholder.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/provider/log_provider.dart';
// import 'package:stage_1/shared/services/api/seed_service.dart';
import 'package:stage_1/shared/services/api/variety_service.dart';

import 'farm_service.dart';

class PlaceholderService {
  String endpoint = '/placeholders';

  final _apiProvider = ApiProvider();
  LogProvider get logger => const LogProvider('🛎 Response');
  final FarmService _farmService = FarmService();
  final VarietyPlaceholderService _varietyService = VarietyPlaceholderService();
  // final SeedPlaceholderService _seedService = SeedPlaceholderService();

  User user = User.getSharedRef();

  Future<dynamic> getAll() async {
    try {
      List<Placeholder> placeholders = [];
      final response = await _apiProvider.get('$endpoint?limit=200',
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        for (dynamic placeholder in response.data['data']['placeholders']) {
          placeholders.add(Placeholder.fromJson(placeholder));
        }
        return placeholders;
      }
    } catch (e) {
      logger.log(e.toString());
      rethrow;
    }
  }

  Future<List<Placeholder>> getByFarmId(String farmId) async {
    List<Placeholder> placeholders = [];
    try {
      final response = await _apiProvider.get(
          '$endpoint/farm-id/$farmId?limit=200',
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        final varieties = await _varietyService.getVarietyList();
        final farms = await _farmService.getByUserId();
        // final seeds = await _seedService.getSeedList();
        for (dynamic placeholder in response.data['data']['placeholders']) {
          String deletedAt = placeholder['deleted_at'];
          if (deletedAt.isEmpty) {
            final variety = varieties.firstWhere((variety) =>
                variety.id == placeholder['placeholder_variety_id']);
            final farm =
                farms.firstWhere((farms) => farms.id == placeholder['farm_id']);
            // final seed =
            //     seeds.firstWhere((seeds) => seeds.id == placeholder['seed_id']);

            placeholders.add(Placeholder.fromJson(placeholder)
                .copyWith(variety: variety, farm: farm));
          }
        }
      }
    } catch (e) {
      logger.log(e.toString());
    }
    return placeholders;
  }

  Future<Placeholder?> createPlaceholder(
      {required Placeholder placeholder, required String farmId}) async {
    try {
      Placeholder? result;
      final response = await _apiProvider.post('$endpoint/',
          data: {
            ...placeholder.toJson(),
            'user_id': user.id,
          },
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        var placeholderJson = response.data['data']['placeholder'];
        String deletedAt = placeholderJson['deleted_at'];
        if (deletedAt.isEmpty) {
          final variety = await _varietyService.getVariety(
              id: placeholder.placeholderVarietyId!);
          result =
              Placeholder.fromJson(placeholderJson).copyWith(variety: variety);
        }
      }
      return result;
    } catch (e) {
      // print('ngu');
      return placeholder;
    }
  }

  Future<Placeholder?> updatePlaceholder(
      {required Placeholder placeholder}) async {
    try {
      Placeholder? result;
      final response = await _apiProvider.put('$endpoint/${placeholder.id}',
          data: {
            ...placeholder.toJson(),
          },
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        var placeholderJson = response.data['data']['placeholder'];

        final variety = await _varietyService.getVariety(
            id: placeholder.placeholderVarietyId!);

        result =
            Placeholder.fromJson(placeholderJson).copyWith(variety: variety);
      }
      return result;
    } catch (e) {
      // print('ngu');
      return placeholder;
    }
  }

  Future<dynamic> deletePlaceholder(Placeholder placeholder) async {
    try {
      User user = User.getSharedRef();
      final response = await _apiProvider.delete('$endpoint/${placeholder.id}',
          data: placeholder,
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203, 204].contains(response.statusCode)) {
        logger.log('Delete Success !');
        return;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Placeholder>> getAllByUser() async {
    List<Placeholder> placeholders = [];
    try {
      final response = await _apiProvider.get('$endpoint/user-id/${user.id}',
          options: Options(headers: {'Authorization': 'Bearer ${user.token}'}));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
      
        dynamic jsonlist = response.data['data']['placeholders'];
        for (dynamic placeholderJson in jsonlist) {
          Placeholder placeholder = Placeholder.fromJson(placeholderJson);
          placeholders.add(placeholder);
        }
      }
    } catch (e) {
      logger.log(e.toString());
      rethrow;
    }
    return placeholders;
  }
}
