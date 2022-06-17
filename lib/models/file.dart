import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:subfave/models/subfave.dart';
import 'package:subfave/models/user.dart';

class File with SubfaveSuperModel {
  final int id;
  final String path, name;

  static Future<File> loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadedData = prefs.getString('subFile');
    return File.fromJson(jsonDecode(loadedData!) as Map<String, dynamic>);
  }

  File.withData({required this.id, required this.name, required this.path});

  Future<File> loadFile() async => await File.loadFromSharedPreferences();

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "path":path,
      "name": name
    };
  }

  factory File.fromJson(Map<String, dynamic> json) {
    return File.withData(
      id: json["id"] ?? "",
      path: json["path"] ?? "",
      name: json["name"] ?? "",
    );
  }
}
File file = File.withData(id: 1,name: "",path: "");