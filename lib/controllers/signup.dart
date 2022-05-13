import 'package:subfave/controllers/subfave.dart';

class SignupProvider extends SubfaveMainProvider {
  bool checkConfirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  Future<void> signup(
    String username,
    String password,
    String confirmPassword,
    String email,
  ) async {
    if (!checkConfirmPassword(password, confirmPassword)) {
      return;
    }
    var body = {"username": username, "email": email, "password": password};
    var res = await super.postRequest(body, "http://localhost:8080/signup");
    // if Response code is 200 ...
    // if error occured ...
  }

  String string = "";
  int number = 0;
  void fun1() {
    string = "changed";
    number++;
    notifyListeners();
  }
}
