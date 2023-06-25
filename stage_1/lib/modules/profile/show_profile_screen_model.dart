import 'package:flutter/material.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/provider/log_provider.dart';
import 'package:stage_1/shared/services/api/user_service.dart';

class ShowProfileScreenModel extends ChangeNotifier {
  final UserService _userService = UserService();

  LogProvider get logger => const LogProvider('🛎 Update');

  final User _user = User.getSharedRef();
  User get user => _user;

  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;

  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;

  final TextEditingController _confirmPassword = TextEditingController();
  TextEditingController get confirmPassword => _confirmPassword;

  final TextEditingController _firstName = TextEditingController();
  TextEditingController get firstName => _firstName;

  final TextEditingController _lastName = TextEditingController();
  TextEditingController get lastName => _lastName;

  final TextEditingController _cicNumber = TextEditingController();
  TextEditingController get cicNumber => _cicNumber;

  bool _readMode = true;
  bool get readMode => _readMode;

  void setReadMode(bool value) {
    _readMode = value;
    notifyListeners();
  }

  void initInfo() {
    logger.log('${_user.id}');
    _firstName.text = _user.firstName ?? 'Undefined';
    _lastName.text = _user.lastName ?? 'Undefined';
    _phoneNumber.text = _user.username ?? 'Undefined';
    _cicNumber.text = _user.cicNumber ?? 'Undefined';
  }

  void updateInfo() async {
    try {
      _user.firstName = _firstName.text;
      _user.lastName = _lastName.text;
      _user.username = _phoneNumber.text;
      _user.cicNumber = _cicNumber.text;
      await _userService.updateProfile(_user);
      await SharedPrefs.set('user', _user.toJson());
      AppStorage().setUser(_user);
      logger.log("Success");
      logger.log(AppStorage().user.toJson().toString());
      setReadMode(true);
    } catch (e) {
      logger.log(e.toString());
      logger.log('Failed');
      _user.firstName = _firstName.text;
      _user.lastName = _lastName.text;
      _user.username = _phoneNumber.text;
      _user.cicNumber = _cicNumber.text;
      SharedPrefs.set('user', _user.toJson());
      AppStorage().setUser(_user);
      logger.log(_user.toJson().toString());
      setReadMode(true);
    }
  }
}
