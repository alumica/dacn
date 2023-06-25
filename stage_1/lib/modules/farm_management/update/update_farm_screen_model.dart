import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/soil.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/provider/log_provider.dart';
import 'package:stage_1/shared/services/api/farm_service.dart';
import 'package:stage_1/shared/services/api/soil_service.dart';
import 'package:vn_provinces/province.dart';
import 'package:vn_provinces/vn_provinces.dart';

class UpdateFarmScreenModel extends ChangeNotifier {
  AppStorage store = AppStorage();
  final SoilService _soilService = SoilService();
  final FarmService _farmService = FarmService();
  LogProvider get soilLogger => const LogProvider('Get Soils');
  LogProvider get farmLogger => const LogProvider('FarmMana');

  final TextEditingController _addressController = TextEditingController();

  TextEditingController get addressController => _addressController;

  final TextEditingController _areaController = TextEditingController();

  TextEditingController get areaController => _areaController;

  final TextEditingController _locationController = TextEditingController();

  TextEditingController get locationController => _locationController;

  final TextEditingController _soilController = TextEditingController();

  TextEditingController get soilController => _soilController;

  final TextEditingController _phController = TextEditingController();

  TextEditingController get phController => _phController;

  final TextEditingController _streetController = TextEditingController();

  TextEditingController get streetController => _streetController;

  String? _soilsField;
  String? get soilsField => _soilsField;

  Farm? _farm;
  Farm? get farm => _farm;

  Area _area = Area.m2;
  Area get area => _area;

  void setArea(int value) {
    _area = value == 0 ? Area.m2 : Area.hecta;
    notifyListeners();
  }

  VNProvince? _province = VNProvinces().allProvince(keyword: "")[43];
  VNProvince? get province => _province;
  void setProvince(VNProvince value) {
    _province = value;
    notifyListeners();
  }

  VNDistrict? _district = VNProvinces().allDistrict(68, keyword: "")[3];
  VNDistrict? get district => _district;
  void setDistrict(VNDistrict value) {
    _district = value;
    notifyListeners();
  }

  VNWard? _ward;
  VNWard? get ward => _ward;
  void setWard(VNWard value) {
    _ward = value;
    notifyListeners();
  }

  final List<VNProvince> _provinces = VNProvinces().allProvince(keyword: "");
  List<VNProvince> get provinces => _provinces;

  late List<VNDistrict> _districts = VNProvinces().allDistrict(68, keyword: "");
  List<VNDistrict> get districts => _districts;

  late List<VNWard> _wards = VNProvinces().allWard(675, keyword: "");
  List<VNWard> get wards => _wards;

  List<MultiSelectItem<Soil>> soilItems = [];
  List<Soil> selectedSoils = [];

  List<Soil> soils = [];
  Future<List<Soil>> getSoils() async {
    try {
      soils = await _soilService.getAll();
      soilItems =
          soils.map((soil) => MultiSelectItem<Soil>(soil, soil.name!)).toList();
      notifyListeners();
    } catch (e) {
      soilLogger.log(e.toString());
    }
    return soils;
  }

  Future<void> setSelectedSoils(List<Soil> soils) async {
    selectedSoils = soils;

    if (soils.isNotEmpty) {
      _soilsField = soils.map((soil) => soil.name!).toList().join(', ');
    } else {
      _soilsField = null;
    }

    notifyListeners();
  }

  Future<dynamic> updateFarm() async {
    Farm tempFarm = _farm!.copyWith(
      province: _province!.name,
      district: _district!.name,
      ward: ward!.name,
      street: streetController.text,
      area: double.tryParse(_areaController.text),
      areaUnit: _area.displayTitle,
      soils: selectedSoils.map((soil) => soil.id!).toList(),
    );

    Farm farm = await _farmService.updateFarm(farm: tempFarm);
    store.updateFarm(farm);
    return farm;
  }

  void setAddressData({required AddressLevel lv, dynamic value}) {
    switch (lv) {
      case AddressLevel.province:
        setProvince(value);
        prepareData(AddressLevel.district, value.code);
        break;
      case AddressLevel.district:
        setDistrict(value);
        prepareData(AddressLevel.ward, value.code);
        break;
      case AddressLevel.ward:
        setWard(value);
        break;
      default:
        {}
    }
  }

  void prepareData(AddressLevel? lv, int? code) {
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

  void initModel(Farm farm) {
    _farm = farm;
    getSoils().then((soils) {
      final tempSelectedSoils =
          soils.where((e) => _farm?.soils?.contains(e.id) ?? false).toList();
      setSelectedSoils(tempSelectedSoils);
    });

    streetController.text = farm.street ?? '';
    _area = Area.m2;
  }
}
