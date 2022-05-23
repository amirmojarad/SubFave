import 'dart:convert';

import 'package:subfave/controllers/subfave.dart';
import 'package:subfave/models/user.dart';

class SignupProvider extends SubfaveMainProvider {
  bool checkConfirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  Future<bool> signup(
    String username,
    String password,
    String confirmPassword,
    String email,
  ) async {
    // if (!checkPasswordValidation(password)){
    //   passwordValidation = false;
    //   notifyListeners();
    //   return;
    // }
    if (!checkConfirmPassword(password, confirmPassword)) {
      passwordsAreNotEqual = true;
      notifyListeners();
      return false;
    }
    var url = "http://localhost:8080/signup";
    var body = {"username": username, "email": email, "password": password};
    var res = await super.postRequest(body, url);
    var statusCode = res.statusCode;
    print(statusCode);
    if (statusCode == 201 || statusCode == 200) {
      User newUser = User.fromJson(jsonDecode(res.body));
      await newUser.save('user', newUser.toJson());
      return true;
    } else if (statusCode == 400) {
      badRequestError = true;
      notifyListeners();
    } else if (statusCode == 404) {
      pageNotFoundError = true;
      notifyListeners();
    } else if (statusCode == 500) {
      internalServerError = true;
      notifyListeners();
    }
    return false;
  }
}
