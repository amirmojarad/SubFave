import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subfave/models/handlers/file_handler.dart';

class File with FileHandler {
  final int id;
  final String path, name;

  File({this.name = "", this.id = 0, this.path = ""});

  factory File.fromJson(Map<String, dynamic> json) {
    return File(id: json["id"], name: json["name"], path: json["path"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "path": path,
    };
  }

  Future<File> loadFile() async => await File.loadFromSharedPreferences();

  static Future<File> loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadedData = prefs.getString('subFile');
    return File.fromJson(jsonDecode(loadedData!) as Map<String, dynamic>);
  }
}
// class File with SubfaveSuperModel {
//   final int id;
//   final String path, name;

//   static Future<File> loadFromSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? loadedData = prefs.getString('subFile');
//     return File.fromJson(jsonDecode(loadedData!) as Map<String, dynamic>);
//   }

//   File.withData({required this.id, required this.name, required this.path});

//   Future<File> loadFile() async => await File.loadFromSharedPreferences();

//   Map<String, dynamic> toJson(){
//     return {
//       "id": id,
//       "path":path,
//       "name": name
//     };
//   }

//   factory File.fromJson(Map<String, dynamic> json) {
//     return File.withData(
//       id: json["id"] ?? "",
//       path: json["path"] ?? "",
//       name: json["name"] ?? "",
//     );
//   }
// }
// File file = File.withData(id: 1,name: "",path: "");