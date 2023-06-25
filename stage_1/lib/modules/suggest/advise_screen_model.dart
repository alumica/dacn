import 'package:flutter/material.dart';
import 'package:stage_1/models/variety.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/provider/log_provider.dart';
import 'package:stage_1/shared/services/api/variety_service.dart';
import '../../shared/helper/datetime_helper.dart';

class AdviseScreenProvider extends ChangeNotifier {
  LogProvider get logger => const LogProvider('🛎Advice Screen: ');

  final TextEditingController _areaController = TextEditingController();
  TextEditingController get areaController => _areaController;

  final VarietyPlaceholderService _varietyPlaceholderService =
      VarietyPlaceholderService();

  void initModel() async {
    _varietyList = await _varietyPlaceholderService.getVarietyList();
  }

  List<Variety> _varietyList = [];
  List<Variety> get varietyList => _varietyList;

  Variety? _selectedVariety;
  Variety? get selectedVariety => _selectedVariety;
  void setVariety(Variety value) {
    _selectedVariety = value;
    logger.log('selected ID : ${value.id}');
    notifyListeners();
  }

  String _startedAt =
      DateTimeHelper.getDate(DateTime.now(), format: 'dd-MM-yyyy');
  String get startedAt => _startedAt;
  void setStartedAt(String value) {
    _startedAt = value;
    logger.log(value);
    notifyListeners();
  }

  //set du lieu cho trang result

  void setDataForResultPage() {
    AppStorage().setVarietyID(
        _selectedVariety!.id ?? "");
        AppStorage().setStartedDate(_startedAt);
        AppStorage().setArea(areaController.text);
  }
}
