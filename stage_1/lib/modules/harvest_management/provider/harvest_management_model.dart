import 'package:flutter/cupertino.dart';
import 'package:stage_1/constants/app_enums.dart';

class HarvestManagementModel extends ChangeNotifier {
  final TextEditingController _amountOfHarvesting = TextEditingController();
  TextEditingController get amountOfHarvesting => _amountOfHarvesting;

  HarvestUnit _harvestUnit = HarvestUnit.kg;
  HarvestUnit get harvestUnit => _harvestUnit;

  void setHarvestUnit(int value) {
    _harvestUnit = value == 0 ? HarvestUnit.kg : HarvestUnit.canh;
    notifyListeners();
  }

  String _harvestTime = '';
  String get harvestTime => _harvestTime;
  void setharvestTime(String value) {
    _harvestTime = value;
    notifyListeners();
  }
}