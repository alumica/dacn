import 'package:flutter/cupertino.dart';
import 'package:stage_1/models/user.dart';
import 'package:stage_1/shared/provider/app_storage.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';
import 'package:stage_1/shared/provider/log_provider.dart';
import 'package:stage_1/shared/services/api/auth_service.dart';

class SignInScreenModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  LogProvider get logger => const LogProvider('🛎 Sign In');

  bool _signedIn = false;
  bool get signedIn => _signedIn;

  bool? _isLoginSuccess;
  bool? get isLoginSuccess => _isLoginSuccess;

  final String _token = '';
  String get token => _token;

  final TextEditingController _username = TextEditingController();
  TextEditingController get username => _username;

  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;

  bool _isError = true;
  bool get isError => _isError;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  void setError(bool value, String message) {
    _isError = value;
    _errorMessage = message;
    notifyListeners();
  }

  void setSignedIn(bool value) {
    _signedIn = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void checkInput() {
    String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(phonePattern);

    if (!regExp.hasMatch(_username.text) && _password.text.length < 8) {
      setError(true, 'Thông tin đăng nhập không hợp lệ');
      return;
    }
    setError(false, '');
  }

  void setLoginStatus(bool? value) {
    _isLoginSuccess = value;
  }

  // Future<void> signIn() async {
  //   ResponseObject signInObject = await _authService.signin(
  //       username: _usernameController.text,
  //       pwd: _passwordController.text,
  //       onErrorCallback: (ResponseObject error) {
  //         _isLoginSuccess = false;
  //         notifyListeners();
  //         return;
  //       });
  //   _token = signInObject.data["data"]["success"]["token"]["token"];
  //   _authService.saveToken(token);
  // }

  Future<User> signInDio() async {
    setIsLoading(true);
    try {
      User user = await _authService.signIn(_username.text, _password.text);
      SharedPrefs.set('user', user.toJson());

      AppStorage store = AppStorage();
      store.setUser(user);

      setIsLoading(false);
      return user;
    } catch (e) {
      logger.log(e.toString());
      setIsLoading(false);
      rethrow;
    }
  }
}
