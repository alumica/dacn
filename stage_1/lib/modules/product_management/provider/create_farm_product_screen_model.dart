import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/models/placeholder.dart' as md;
import 'package:stage_1/models/seed.dart';
import 'package:stage_1/models/species.dart';
import 'package:stage_1/models/variety.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/helper/datetime_helper.dart';
import 'package:stage_1/shared/services/api/placeholder_service.dart';
import 'package:stage_1/shared/services/api/seed_service.dart';
import 'package:stage_1/shared/services/api/species_service.dart';
import 'package:stage_1/shared/services/api/variety_service.dart';

class CreateFarmProductScreenModel extends ChangeNotifier {
  AppStorage store = AppStorage();

  final SpeciesPlaceholderService _speciesPlaceholderService =
      SpeciesPlaceholderService();
  final VarietyPlaceholderService _varietyPlaceholderService =
      VarietyPlaceholderService();
  final SeedPlaceholderService _seedPlaceholderService =
      SeedPlaceholderService();
  final PlaceholderService _placeholderService = PlaceholderService();

  void initModel() async {
    _speciesList = await _speciesPlaceholderService.getSpeciesList();
    _varietyList = await _varietyPlaceholderService.getVarietyList();
    _seeds = await _seedPlaceholderService.getSeedList();
  }

  List<Species> _speciesList = [];
  List<Species> get speciesList => _speciesList;

  List<Variety> _varietyList = [];
  List<Variety> get varietyList => _varietyList;

  List<Seed> _seeds = [];
  List<Seed> get seeds => _seeds;

  String? _selectedSpecies;
  String? get selectedSpecies => _selectedSpecies;
  void setSpecies(String value) {
    _selectedSpecies = value;

    notifyListeners();
  }

  Variety? _selectedVariety;
  Variety? get selectedVariety => _selectedVariety;
  void setVariety(Variety value) {
    _selectedVariety = value;
    DateTime createdAt = DateFormat('dd-MM-yyyy').parse(_startedAt);
    DateTime newDate = createdAt.add(Duration(days: value.cycleGrowth! * 30));
    setReleasedAt(DateFormat('dd-MM-yyyy').format(newDate));
    notifyListeners();
  }

  Seed? _selectedSeed;
  Seed? get selectedSeed => _selectedSeed;
  void setSeed(Seed value) {
    _selectedSeed = value;
    notifyListeners();
  }

  String _category = '';
  String get category => _category;

  final TextEditingController _name = TextEditingController();
  TextEditingController get name => _name;

  String _startedAt =
      DateTimeHelper.getDate(DateTime.now(), format: 'dd-MM-yyyy');
  String get startedAt => _startedAt;
  void setStartedAt(String value) {
    _startedAt = value;
    notifyListeners();
  }

  void setCate(int value) {
    _category = value == 0 ? 'Cây công nghiệp, ăn quả' : 'Cây khác';
    notifyListeners();
  }

  String _releasedAt =
      DateTimeHelper.getDate(DateTime.now(), format: 'dd-MM-yyyy');
  String get releasedAt => _releasedAt;
  
  void setReleasedAt(String value) {
    _releasedAt = value;
    notifyListeners();
  }

  final TextEditingController _areaController = TextEditingController();

  TextEditingController get areaController => _areaController;

  final TextEditingController _quantityController = TextEditingController();
  TextEditingController get quantityController => _quantityController;

  Area _area = Area.m2;
  Area get area => _area;

  void setArea(int value) {
    _area = value == 0 ? Area.m2 : Area.hecta;
    notifyListeners();
  }

  UnitTime _unitTime = UnitTime.thang;
  UnitTime get unitTime => _unitTime;

  void setUnitTime(int value) {
    _unitTime = value == 0 ? UnitTime.thang : UnitTime.nam;
    notifyListeners();
  }

  UnitQuantity _unitQuantity = UnitQuantity.cay;
  UnitQuantity get unitQuantity => _unitQuantity;

  void setUnitQuantity(int value) {
    switch (value) {
      case 0:
        _unitQuantity = UnitQuantity.cay;
        break;
      case 1:
        _unitQuantity = UnitQuantity.cur;
        break;
      case 2:
        _unitQuantity = UnitQuantity.hat;
        break;
      default:
        _unitQuantity = UnitQuantity.cay;
    }
    notifyListeners();
  }

  String _st = 'Chọn thời gian bạn muốn trồng';
  String get st => _st;
  void setST(String value) {
    _st = value;
    notifyListeners();
  }

  Future<md.Placeholder?> createPlaceholder(String farmId) async {
    md.Placeholder temp = md.Placeholder(
      farmId: farmId,
      placeholderVarietyId: _selectedVariety!.id,
      // seedId: _selectedSeed!.id,
      area: double.parse(_areaController.text),
      areaUnit: area.displayTitle,
      seedQuantity: int.parse(_quantityController.text),
      seedQuantityUnit: _unitQuantity.displayTitle,
      expectedHarvestTime: _releasedAt,
      variety: varietyList
          .firstWhere((element) => element.id == _selectedVariety!.id),
      // expectedHarvestQuantity:1.2,
      // expectedHarvestQuantityUnit:'',
      // waterSources:[],
      // farmingMethods:[],
    );
    try {
      md.Placeholder? res = await _placeholderService.createPlaceholder(
          placeholder: temp, farmId: farmId);
      store.addPlaceholder(farmId,
          res!.copyWith(seed: _selectedSeed, variety: _selectedVariety));
      notifyListeners();
      return res.copyWith(seed: _selectedSeed, variety: _selectedVariety);
    } catch (e) {
      rethrow;
    }
  }

  md.Placeholder? getTempPlaceholder(String farmId) {
    return md.Placeholder(
      farmId: farmId,
      placeholderVarietyId: _selectedVariety!.id,
      // seedId: _selectedSeed!.id,
      area: double.parse(_areaController.text),
      areaUnit: area.displayTitle,
      seedQuantity: int.parse(_quantityController.text),
      seedQuantityUnit: _unitQuantity.displayTitle,
      expectedHarvestTime: _releasedAt,

      // expectedHarvestQuantity:1.2,
      // expectedHarvestQuantityUnit:'',
      // waterSources:[],
      // farmingMethods:[],
      variety: varietyList
          .firstWhere((element) => element.id == _selectedVariety!.id),
      // seed: seeds.firstWhere((element) => element.id == _selectedSeed!.id),
    );
  }
}
