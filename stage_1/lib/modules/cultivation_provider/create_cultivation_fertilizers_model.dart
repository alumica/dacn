import 'package:flutter/cupertino.dart';

class CreateCultivationFertilizerModel extends ChangeNotifier {
  String _date = '';
  String get date => _date;
  void setDate(String value) {
    _date = value;
    notifyListeners();
  }

  final TextEditingController _amountOfFertilizer = TextEditingController();
  TextEditingController get amountOfFertilizer =>   _amountOfFertilizer;

  final TextEditingController _nameFertilizer = TextEditingController();
  TextEditingController get nameFertilizer => _nameFertilizer;
}