class Validations{
  static bool isValidateEmail(String email){
    bool a = (email != "" &&
        email.length > 6 &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email));
    return a;
  }
  static bool isValidatePhone(String phone){
    bool a = (phone.length == 12);
    return a;
  }
  static bool isValidateUser(String user){
    bool a = (user.length > 8 && !RegExp(r"\d").hasMatch(user));
    return a;
  }
  static bool isValidatePass(String pass){
    bool a = (pass != "");
    return a;
  }
  static bool isValidatePassSign(String pass) {
    bool a = (pass != "" && RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(pass));
    return a;
  }
}