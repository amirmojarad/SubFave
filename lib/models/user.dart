import 'package:subfave/models/subfave.dart';

class User extends SubfaveSuperModel {
  final String username, token, email;
  User({
    required this.email,
    required this.token,
    required this.username,
  });

  factory User.fromJson(Map json) {
    return User(
        email: json["email"], token: json["token"], username: json["username"]);
  }

  Map toJson() {
    return {"email": email, "token": token, "username": username};
  }
}
