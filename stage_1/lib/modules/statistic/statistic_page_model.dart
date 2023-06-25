import 'package:flutter/material.dart';
import 'package:stage_1/models/variety.dart';
import 'package:stage_1/shared/provider/api_provider.dart';
import 'package:stage_1/shared/services/api/variety_service.dart';

class StatisticPageModel extends ChangeNotifier {
// sản lượng thực thu

  final ApiProvider _apiProvider = ApiProvider();
  final VarietyPlaceholderService _varietyPlaceholderService =
      VarietyPlaceholderService();

  Map<String, dynamic> _harvestStats = {};
  Map<String, dynamic> get harvestStats => _harvestStats;

  List<Variety> _varieties = [];
  List<Variety> get varieties => _varieties;

  getAllVariesties() async {
    _varieties = await _varietyPlaceholderService.getVarietyList();
    notifyListeners();
  }

  Variety? findVariety(String id) {
    for (int i = 0; i < _varieties.length; i++) {
      if (_varieties[i].id == id) {
        print(_varieties[i].name);
        return _varieties[i];
      }
    }
    return null;
  }

  totalHarvesStats() async {
    try {
      final response =
          await _apiProvider.post('/statistic/harvest/total', data: {
        "users": [],
        "varieties": [],
        "placeholders": [],
        "products": [],
        "from_date": "",
        "to_date": "",
        "date": "",
        "month": "",
        "year": "",
        "wards": [],
        "species": []
      });

      if (response.statusCode == 200) {
        _harvestStats = response.data['data']['statistic'];
        notifyListeners();
      }
    } catch (e) {
      // logger.log(e.toString());
      rethrow;
    }
  }

  totalArea() async {
    try {
      final response =
          await _apiProvider.post('/statistic/harvest/total', data: {
        "users": [],
        "varieties": [],
        "placeholders": [],
        "products": [],
        "from_date": "",
        "to_date": "",
        "date": "",
        "month": "",
        "year": "",
        "wards": [],
        "species": []
      });

      if (response.statusCode == 200) {
        _harvestStats = response.data['data']['statistic'];
        notifyListeners();
      }
    } catch (e) {
      // logger.log(e.toString());
      rethrow;
    }
  }

  List<dynamic> _speciesList = [];
  List<dynamic> get speciesList => _speciesList;

  getTotalArea() async {
    // {{HOST}}/api/v2/placeholder-species

    try {
      final response =
          await _apiProvider.post('/statistic/placeholder/total-area', data: {
        "users": [],
        "farms": [],
        "wards": [],
        "species": ["all"],
        "varieties": [],
        "from_date": "",
        "to_date": "",
        "month": "",
        "year": "",
        "status": "active"
      });

      if (response.statusCode == 200) {
        List<dynamic> newlist = response.data['data']['statistic']['species_objects'];
        _speciesList = newlist;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
