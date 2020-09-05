import 'dart:async';
import 'package:app_dat_xe/src/validator/validators.dart';

class LoginBloc{
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;

  bool IsValidInfo(String email, String pass){
    if(!Validations.isValidateEmail(email)){
      _emailController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _emailController.sink.add("OK");
    if(!Validations.isValidatePass(pass)){
      _passController.sink.addError("Mật khẩu không hợp lệ");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }

  void diposed(){
    _emailController.close();
    _passController.close();
  }
}
