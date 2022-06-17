import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:subfave/view/screens/config.dart';

class ProfileProvider with ChangeNotifier {
  Future<PlatformFile> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    return result!.files.first;
  }

  Future<bool> uploadImage() async {
    await user.loadUser();
    final file = await _openFilePicker();
    var headers = {'Authorization': 'Bearer ${user.token}'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://localhost:8080/file/upload_profile'));
    request.files.add(
      await http.MultipartFile.fromBytes(
        'file',
        file.bytes!,
        contentType: MediaType('application', 'octet-stream'),
        filename: file.name,
      ),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseBytesAsString = await response.stream.bytesToString();
      Map<String, dynamic> jsonResult = jsonDecode(responseBytesAsString);
      user.imageUrl = "http://localhost:8080/file/download?image_url=" +
          jsonResult["image_url"];
      await user.save("user", user.toJson());
    } else {
      print(response.reasonPhrase);
    }
    notifyListeners();
    return true;
  }
}
