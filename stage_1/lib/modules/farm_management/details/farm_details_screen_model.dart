import 'package:flutter/material.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/placeholder.dart' as md;
import 'package:stage_1/models/variety.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/services/api/placeholder_service.dart';

class FarmDetailsScreenModel extends ChangeNotifier {
  final PlaceholderService _placeholderService = PlaceholderService();
  final AppStorage _store = AppStorage();
  AppStorage get store => _store;

  Farm? farm;

  FarmDetailsScreenModel(this.farm);

 List<md.Placeholder> _placeholders = [];
  List<md.Placeholder> get placeholders => _placeholders;

  List<Variety> _varieties = [];
  List<Variety> get varieties => _varieties;
  void setVarieties(List<Variety> value) {
    _varieties = value;
    notifyListeners();
  }

  getPlacePlaceholder() {
  
  }

  getPlaceholders() async {
    List<md.Placeholder> placeholders =
        await _placeholderService.getByFarmId(farm!.id!);
    if (placeholders.isEmpty){
      _placeholders = [];
      notifyListeners();
    }

    // List<Variety> varieties = await _varietyService.getVarietyList();

    // for (md.Placeholder placeholder in placeholders) {
    //   final variety = varieties.firstWhere(
    //       (variety) => variety.id == placeholder.placeholderVarietyId);
    //   placeholder = placeholder.copyWith(variety: variety);

    //   placeholders[placeholders
    //       .indexWhere((element) => element.id == placeholder.id)] = placeholder;
    // }
    store.addPlaceholders(farm!.id!, placeholders);
    _placeholders = placeholders;
    notifyListeners();

    // return placeholders;
  }

  void deletePlaceholder(md.Placeholder placeholder) async {
    await _placeholderService.deletePlaceholder(placeholder);
    notifyListeners();
  }
}
