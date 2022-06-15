import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class File with ChangeNotifier {
  final int id;
  final String path, name;

  File.withData({required this.id, required this.name, required this.path});

  factory File.FromJson(Map<String, dynamic> json) {
    return File.withData(
      id: json["id"] ?? "",
      path: json["path"] ?? "",
      name: json["name"] ?? "",
    );
  }
}
