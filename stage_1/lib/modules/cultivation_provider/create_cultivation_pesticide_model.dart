import 'package:flutter/cupertino.dart';

class CreateCultivationPesticideModel extends ChangeNotifier {
  String _date = '';
  String get date => _date;
  void setDate(String value) {
    _date = value;
    notifyListeners();
  }

  final TextEditingController _amountOfPesticide = TextEditingController();
  TextEditingController get amountOfPesticide => _amountOfPesticide;

  final TextEditingController _namePesticide = TextEditingController();
  TextEditingController get namePesticide => _namePesticide;
}