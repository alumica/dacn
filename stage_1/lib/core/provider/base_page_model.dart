import 'package:flutter/material.dart';

class BasePageModel extends ChangeNotifier {
  //loading
  bool? _busy = false;
  bool? get busy => _busy;

  bool? _error = false;
  bool? get error => _error;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  setBusy({bool? busy, bool? error, String? message}) {
    _busy = busy ?? false;
    _error = error ?? false;
    _errorMessage = message ?? '';
    notifyListeners();
  }
}
