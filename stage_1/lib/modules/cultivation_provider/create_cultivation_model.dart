import 'package:flutter/cupertino.dart';

class CreateCultivationDetailModel extends ChangeNotifier {
  String _date = '';
  String get date => _date;
  void setDate(String value) {
    _date = value;
    notifyListeners();
  }

  final TextEditingController _quantity = TextEditingController();
  TextEditingController get quantity => _quantity;
}