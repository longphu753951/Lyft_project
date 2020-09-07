import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterError){
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user){
      _createUser(user.user.uid,name, phone,onSuccess,onRegisterError);
    }).catchError((err){
      _onSignUpErr(err.code,onRegisterError);
    });
  }
  void signIn(String email, String pass, Function onSuccess, Function(String) onLogInError){
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass)
        .then((user){
          print("log in thanh cong");
          onSuccess();
    }).catchError((err){
      onLogInError("Sai tài khoản hoặc mật khẩu, vui lòng thử lại");
    });
  }

  _createUser(String userId, String name, String phone,Function onSuccess, Function(String) onRegisterError){
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user){
     //success
      onSuccess();
    }).catchError((err){
      onRegisterError("Signup thất bại, vui lòng thử lại");
    });
  }

  void _onSignUpErr(String code, Function(String) onRegisterError){
    switch(code){
      case "ERROR_INVALID_EMAIL":
      case"ERROR_INVALID_CREDENTIAL":
        onRegisterError("Email không hợp lệ");
        break;
      case "ERROR_EMAIL_ALRREADY_IN_USE":
        onRegisterError("Email đã tồn tại");
        break;
      default:
        onRegisterError("Signup thất bại, vui lòng thử lại");
        break;
    }
  }
}