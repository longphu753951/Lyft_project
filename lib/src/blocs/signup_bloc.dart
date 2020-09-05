import 'dart:async';
import 'package:app_dat_xe/src/fire_base/fire_base_auth.dart';
import 'package:app_dat_xe/src/validator/validators.dart';

class SignUpBloc{
  var _fireAuth = FireAuth();

  StreamController _userController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _telephoneController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get telephoneStream => _telephoneController.stream;
  Stream get passStream => _passController.stream;
  bool IsValidInfo(String user, String email,String telephone, String pass){
    if(!Validations.isValidateUser(user)){
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _userController.sink.add("OK");
    if(!Validations.isValidateEmail(email)){
      _emailController.sink.addError("Email không hợp lệ");
      return false;
    }
    _emailController.sink.add("OK");
    if(!Validations.isValidatePhone(telephone)){
      _telephoneController.sink.addError("Số điện thoại không hợp lệ");
      return false;
    }
    _telephoneController.sink.add("OK");
    if(!Validations.isValidatePassSign(pass)){
      _passController.sink.addError("Mật khẩu không hợp lệ");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }

  void signUp(String email, String pass, String phone, String name, Function onSuccess){
    _fireAuth.signUp(email, pass, name, phone, onSuccess);
  }

  void diposed(){
    _userController.close();
    _emailController.close();
    _telephoneController.close();
    _passController.close();
  }
}