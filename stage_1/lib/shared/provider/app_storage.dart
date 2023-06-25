import 'package:flutter/foundation.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/models/placeholder.dart';
import 'package:stage_1/models/soil.dart';
import 'package:stage_1/models/species.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/models/variety.dart';
import 'package:vn_provinces/province.dart';
import 'package:vn_provinces/vn_provinces.dart';

import '../../models/farm.dart';

class AppStorage extends ChangeNotifier {
  AppStorage._internal();

  static final AppStorage _instance = AppStorage._internal();

  factory AppStorage() {
    return _instance;
  }

  List<Soil> _soils = [];
  List<Soil> get soils => _soils;
  void setSoils(List<Soil> value) {
    _soils = value;
  }

  List<Variety> _varieties = [];
  List<Variety> get varieties => _varieties;
  void setVarieties(List<Variety> value) {
    _varieties = value;
  }

  List<Species> _speciesList = [];
  List<Species> get speciesList => _speciesList;
  void setSpeciesList(List<Species> value) {
    _speciesList = value;
  }

  final List<VNProvince> _provinces = VNProvinces().allProvince(keyword: "");
  List<VNProvince> get provinces => _provinces;

  List<VNDistrict> _districts = VNProvinces().allDistrict(68, keyword: "");
  List<VNDistrict> get districts => _districts;

  List<VNWard> _wards = VNProvinces().allWard(675, keyword: "");
  List<VNWard> get wards => _wards;

  User _user = User();
  User get user => _user;
  void setUser(User value) {
    _user = value;
  }

  List<Farm>? _farms;
  List<Farm> get farms {
    return _farms ?? [];
  }

  set farms(List<Farm> value) {
    _farms = value;
  }

  void addFarm(Farm farm) {
    _farms!.add(farm);
    updateFarmArea(farm.id!);
  }

  void updateFarm(Farm updatedFarm) {
    _farms![_farms!.indexWhere((farm) => farm.id == updatedFarm.id)] =
        updatedFarm;
    updateFarmArea(updatedFarm.id!);
  }

  void addFarms(List<Farm> farms) {
    _farms = farms;
  }

  void updateFarmArea(String farmId) {
    Farm farm = farms.firstWhere((farm) => farm.id! == farmId);
    List<Placeholder> agris = farm.placeholders!;
    double areaUsed = 0;
    double areaLeft = farm.area!;

    for (Placeholder agri in agris) {
      areaUsed += agri.area!;
    }

    farm.areaUsed = areaUsed;

    areaLeft -= areaUsed;
    farm.areaLeft = areaLeft > 0 ? areaLeft : 0;
  }

  void addPlaceholder(String farmId, Placeholder placeholder) {
    Farm farm = _farms!.firstWhere((farm) => farm.id == farmId);

    farm.placeholderIds = [...farm.placeholderIds ?? [], placeholder.id!];
    farm.placeholders = [...farm.placeholders ?? [], placeholder];

    updateFarmArea(farmId);
  }

  void addPlaceholders(String farmId, List<Placeholder> placeholders) {
    Farm farm = _farms!.firstWhere((farm) => farm.id == farmId);

    farm.placeholderIds = placeholders.map((p) => p.id!).toList();
    farm.placeholders = placeholders;

    updateFarmArea(farmId);
  }

  void prepareAddressData(AddressLevel? lv, int? code) {
    final vnProvinces = VNProvinces();
    switch (lv) {
      case AddressLevel.province:
        break;
      case AddressLevel.district:
        _districts = vnProvinces.allDistrict(code!, keyword: "");
        notifyListeners();
        break;
      case AddressLevel.ward:
        _wards = vnProvinces.allWard(code!, keyword: "");
        notifyListeners();
        break;
      default:
        {
          break;
        }
    }
  }

  //prepare data for get suggestion
  String _varietyID = '';
  String get varietyID => _varietyID;
  void setVarietyID(String value) {
    _varietyID = value;
  }

  String _startedDate = '';
  String get startedDate => _startedDate;
  void setStartedDate(String value) {
    _startedDate = value;
  }

  String _area = '';
  String get area => _area;
  void setArea(String value) {
    _area = value;
  }

  void resetSugesttionData() {
    _varietyID = '';
    _startedDate = '';
    _area = '';
  }
}
