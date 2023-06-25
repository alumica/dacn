import 'package:flutter/material.dart';
import 'package:stage_1/constants/app_enums.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';
import 'package:stage_1/shared/provider/log_provider.dart';
import 'package:stage_1/shared/services/api/auth_service.dart';
import 'package:vn_provinces/province.dart';
import 'package:vn_provinces/vn_provinces.dart';

class SignUpScreenModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  LogProvider get logger => const LogProvider('🛎 Sign Up');

  bool isLoading = false;

  final User _user = User();
  User get user => _user;

  int _currentIndex = 1;
  int get currentIndex => _currentIndex;

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

  String? _gdp;
  String? get gdp => _gdp;
  void setGDP(String value) {
    _gdp = value;
    notifyListeners();
  }

  VNProvince? _province;
  VNProvince? get province => _province;
  void setProvince(VNProvince value) {
    _province = value;
    notifyListeners();
  }

  VNDistrict? _district;
  VNDistrict? get district => _district;
  void setDistrict(VNDistrict value) {
    _district = value;
    notifyListeners();
  }

  VNWard? _ward;
  VNWard? get ward => _ward;
  void setWard(VNWard value) {
    _ward = value;
    notifyListeners();
  }

  final TextEditingController _street = TextEditingController();
  TextEditingController get street => _street;

  Gender _gender = Gender.male;
  Gender get gender => _gender;

  bool _isError = true;
  bool get isError => _isError;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool? _isSignUpSuccess;
  bool? get isSignUpSuccess => _isSignUpSuccess;

  void setSignUpStatus(bool? value) {
    _isSignUpSuccess = value;
    notifyListeners();
  }

  void setError(bool value, String message) {
    _isError = value;
    _errorMessage = message;
    notifyListeners();
  }

  void setGender(int value) {
    _gender = value == 0 ? Gender.male : Gender.female;
    notifyListeners();
  }

  String _dob = '';
  String get dob => _dob;
  void setDOB(String value) {
    _dob = value;
    notifyListeners();
  }

  void realtimeCheck() {
    String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String idPattern = r'(^[0-9]{9,12}$)';
    String namePattern =
        r'(^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$)';
    RegExp phoneRegex = RegExp(phonePattern);
    RegExp nameRegex = RegExp(namePattern);
    RegExp idRegex = RegExp(idPattern);

    if (_currentIndex == 1) {
      if (!phoneRegex.hasMatch(_phoneNumber.text)) {
        setError(true, 'Số điện thoại không hợp lệ');
        return;
      }

      if (_password.text.isEmpty || _confirmPassword.text != _password.text) {
        setError(true, 'Mật khẩu không trùng nhau');
        return;
      }
    }
    if (_currentIndex == 2) {
      if (!nameRegex.hasMatch(_firstName.text) ||
          !nameRegex.hasMatch(_lastName.text)) {
        setError(true, 'Tên không hợp lệ');
        return;
      }
      if (!idRegex.hasMatch(_cicNumber.text)) {
        setError(true, 'CMND không hợp lệ');
        return;
      }
      if (_dob.isEmpty) {
        setError(true, 'Chưa nhập ngày sinh');
        return;
      }
      if (_gdp == null) {
        setError(true, 'Chưa nhập đủ thồng tin');
        return;
      }
    }
    if (_currentIndex == 3) {
      if (_province == null ||
          _district == null ||
          _ward == null ||
          _street.text == "") {
        setError(true, 'Chưa nhập địa chỉ');
        return;
      }
    }
    setError(false, 'Passed');
  }

  final List<VNProvince> _provinces = VNProvinces().allProvince(keyword: "");
  List<VNProvince> get provinces => _provinces;

  late List<VNDistrict> _districts = [];
  List<VNDistrict> get districts => _districts;

  late List<VNWard> _wards = [];
  List<VNWard> get wards => _wards;

  void prepareData(AddressLevel? lv, int? code) {
    final vnProvinces = VNProvinces();
    switch (lv) {
      case AddressLevel.province:
        break;
      case AddressLevel.district:
        _districts = vnProvinces.allDistrict(code!, keyword: "");
        notifyListeners();
        break;
      case AddressLevel.ward:
        _wards = vnProvinces.allWard(code!, keyword: "");
        notifyListeners();
        break;
      default:
        {
          break;
        }
    }
  }

  void setAddressData({required AddressLevel lv, dynamic value}) {
    switch (lv) {
      case AddressLevel.province:
        setProvince(value);
        prepareData(AddressLevel.district, value.code);
        break;
      case AddressLevel.district:
        setDistrict(value);
        prepareData(AddressLevel.ward, value.code);
        break;
      case AddressLevel.ward:
        setWard(value);
        break;
      default:
        {}
    }
  }

  Future<void> signUpDio() async {
    _user.firstName = _firstName.text;
    _user.lastName = _lastName.text;
    _user.username = _phoneNumber.text;
    _user.password = _password.text;
    _user.role = Role.farmer;
    _user.gender = _gender;
    _user.cicNumber = _cicNumber.text;
    _user.dob = _dob;
    _user.gdp = _gdp;
    _user.province = _province!.name;
    _user.district = _district!.name;
    _user.ward = _ward!.name;
    _user.street = _street.text;

    try {
      isLoading = true;
      await _authService.signUp(_user);
      isLoading = false;
      setSignUpStatus(true);
      await _authService.signIn(phoneNumber.text, password.text);
      SharedPrefs.set('user', user.toJson());
    } catch (e) {
      isLoading = false;
      logger.log(e.toString());
    }
  }

  void nextStep() {
    _currentIndex++;
    notifyListeners();
  }

  void previousStep() {
    _currentIndex--;
    notifyListeners();
  }
}
