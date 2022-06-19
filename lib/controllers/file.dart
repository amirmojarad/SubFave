import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileController {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> getFileByPath(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<File> writeContent(String fileName, List<int> bytes) async {
    final file = await getFileByPath(fileName);
    return await file.writeAsBytes(bytes);
  }
}
