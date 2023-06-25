import 'package:flutter/material.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/placeholder.dart' as md;
import 'package:stage_1/models/soil.dart';
import 'package:stage_1/models/species.dart';
import 'package:stage_1/models/variety.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/provider/log_provider.dart';
import 'package:stage_1/shared/services/api/farm_service.dart';
import 'package:stage_1/shared/services/api/placeholder_service.dart';
import 'package:stage_1/shared/services/api/soil_service.dart';
import 'package:stage_1/shared/services/api/species_service.dart';
import 'package:stage_1/shared/services/api/variety_service.dart';

class FarmManagementScreenModel extends ChangeNotifier {
  final AppStorage _store = AppStorage();
  AppStorage get store => _store;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final FarmService _farmService = FarmService();
  final SoilService _soilService = SoilService();
  final SpeciesPlaceholderService _speciesService = SpeciesPlaceholderService();
  final VarietyPlaceholderService _varietyService = VarietyPlaceholderService();
  final PlaceholderService _placeholderService = PlaceholderService();
  LogProvider get logger => const LogProvider('Farm Management');

  Future<List<Farm>> getListFarm() async {
    //call API
    _farms = await _farmService.getListFarm();
    // save vao store
    store.addFarms(farms);
    return _farms;
  }

  Future<List<md.Placeholder>> getPlaceholdersByFarmId(String farmId) async {
    List<md.Placeholder> placeholders =
        await _placeholderService.getByFarmId(farmId);

    placeholders = await _placeholderService.getByFarmId(farmId);
    store.addPlaceholders(farmId, placeholders);

    return placeholders;
  }

  List<Farm> _farms = [];
  List<Farm> get farms => _farms;
  void setListFarms(List<Farm> value) {
    _farms = value;
    notifyListeners();
  }

  void deleteFarm(Farm farm) async {
    await _farmService.deleteFarm(farm);
    notifyListeners();
  }

  Future<void> getFarmByUserId() async {
    try {
      List<Farm> farms = await _farmService.getByUserId();

      store.addFarms(farms);
      notifyListeners();
    } catch (e) {
      logger.log(e.toString());
    }
  }

  Future<List<Species>> getSpeciesList() async {
    final speciesList = await _speciesService.getSpeciesList();

    store.setSpeciesList(speciesList);
    return speciesList;
  }

  Future<List<Variety>> getVarieties() async {
    final varieties = await _varietyService.getVarietyList();

    store.setVarieties(varieties);
    return varieties;
  }

  Future<List<Soil>> getSoils() async {
    final soils = await _soilService.getAll();

    store.setSoils(soils);
    return soils;
  }

  void prepareData() async {
    await getSoils();
    await getVarieties();
    await getSpeciesList();
    notifyListeners();
  }
}
