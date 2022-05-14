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
        email: json["user"]["email"], token: json["token"], username: json["user"]["username"]);
  }

  Map<String, dynamic> toJson() {
    return {"email": email, "token": token, "username": username};
  }
}
