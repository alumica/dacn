import 'package:flutter/cupertino.dart';

class CreateCultivationDiseasesModel extends ChangeNotifier {
  
  String _date = '';
  String get date => _date;
  void setDate(String value) {
    _date = value;
    notifyListeners();
  }

  final TextEditingController _amountOfDamage = TextEditingController();
  TextEditingController get amountOfDamage => _amountOfDamage;

  final TextEditingController _nameDisease = TextEditingController();
  TextEditingController get nameDisease => _nameDisease;
}