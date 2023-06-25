import 'package:flutter/material.dart';
import 'package:stage_1/models/farm.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/services/api/farm_service.dart';
import 'package:stage_1/shared/services/api/placeholder_service.dart';
import 'package:stage_1/models/placeholder.dart' as placeholder;

class HomePageProvider extends ChangeNotifier {
  final PlaceholderService _placeholderService = PlaceholderService();
  final FarmService _farmService = FarmService();
  List<placeholder.Placeholder> _placeholders = [];
  List<placeholder.Placeholder> get placeholders => _placeholders;
  List<Farm> _frams = [];
  List<Farm> get famrs => _frams;

  List<String>? _stats;
  List<String>? get stats => _stats;

  List<String>? _expertOutputs;
  List<String>? get expertOutputs => _expertOutputs;

  String? _userName;
  String? get userName => _userName;

  HomePageProvider() {
    _stats = HomeFakeData.stats;
    _expertOutputs = HomeFakeData.expertOutputs;
  }

  Future<List<placeholder.Placeholder>> getAllPlaceholder() async {
    _placeholders = await _placeholderService.getAllByUser();
    // notifyListeners();
    return _placeholders;
  }

  getAllFarms() async {
    List<Farm> newList = await _farmService.getListFarm();
    _frams = newList;
    notifyListeners();
  }

  int getTotalPlaceholder() {
    int sum = 0;
    for (var element in _frams) {
      {
        sum += element.placeholderIds?.length ?? 0;
      }
    }
    return sum;
  }

  double getTotalArea() {
    double sum = 0;
    for (var element in _frams) {
      {
        sum += element.area ?? 0;
      }
    }
    return sum;
  }

  int getTotalFarm(){
    return _frams.length;
  }

  double getFillInArea(){
    double sum = 0;
    for (var element in _placeholders) {
      {
        sum += element.area ?? 0;
      }
    }
    return sum;
  }

  



  void getUsername() {
    _userName = User.getSharedRef().firstName ?? 'bạn';
  }

  void setStats(List<String> values) {
    _stats = values;
    notifyListeners();
  }

  void setExpertOutputs(List<String> values) {
    _expertOutputs = values;
    notifyListeners();
  }
}

class HomeFakeData {
  static final List<String>? _stats = [
    '3 ha',
    '8 giong',
  ];

  static List<String>? get stats => _stats;

  static final List<String>? _expertOutputs = [
    'Ớt chuông',
    'Cải thìa',
    'Khoai tây',
  ];
  static List<String>? get expertOutputs => _expertOutputs;
}
