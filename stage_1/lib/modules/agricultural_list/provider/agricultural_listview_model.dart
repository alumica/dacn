
import 'package:flutter/cupertino.dart';

class AgriculturalListProvider extends ChangeNotifier {
  List<String>? _agri;
  List<String>? get agri => _agri;

  AgriculturalListProvider(){
    _agri = AgriTempData.agri;
  }

  void setAgri(List<String> values) {
    _agri = values;
    notifyListeners();
  }
}



class AgriTempData {
  static final List<String> _agri=[
    'Cà phê',
    'Hoa hồng',
    'Phúc bồn tử',
    'Chuối laba',
    'Cải thảo'
  ];

  static List<String>? get agri => _agri;
}