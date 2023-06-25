import 'package:flutter/cupertino.dart';
import 'package:stage_1/constants/app_enums.dart';

class CreateAquaticProductScreenModel extends ChangeNotifier {
  final TextEditingController _animalCategory = TextEditingController();

  TextEditingController get animalCategory => _animalCategory;

  final TextEditingController _startTime = TextEditingController();

  TextEditingController get startTime => _startTime;

  final TextEditingController _farmingTime = TextEditingController();

  TextEditingController get farmingTime => _farmingTime;

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
}
