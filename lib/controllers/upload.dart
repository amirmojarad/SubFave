import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:subfave/models/file.dart';
import 'package:subfave/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class Upload {
  Future<PlatformFile> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    return result!.files.first;
  }

  Future<File> uploadSubtitle() async {
    await user.loadUser();
    File createdFile = File.withData(id: 0, name: "", path: "");

    final openingFile = await _openFilePicker();

    var headers = {
      'Authorization': 'Bearer ${user.token}',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://localhost:8080/file/upload'));
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        openingFile.bytes!,
        contentType: MediaType('application', 'octet-stream'),
        filename: file.name,
      ),
    );
    request.headers.addAll(headers);
    await request.send().then((response) async {
      if (response.statusCode == 200) {
        String responseAsBytesString = await response.stream.bytesToString();
        var jsonMap = jsonDecode(responseAsBytesString);
        file = File.fromJson(jsonMap["file"]);
        await createdFile.save("subFile", createdFile.toJson());
        return createdFile;
      }
    });
    return createdFile;
  }
}
