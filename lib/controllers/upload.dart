import 'package:file_picker/file_picker.dart';
import 'package:subfave/models/user.dart';
import 'package:subfave/screens/config.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class Upload {
  Future<PlatformFile> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    return result!.files.first;
  }

  Future<bool> uploadImage() async {
    final file = await _openFilePicker();
    return true;
  }

  Future<bool> uploadSubtitle() async {
    user.loadUser();
    final file = await _openFilePicker();
    var headers = {
      'Authorization': 'Bearer ${user.token}',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://localhost:8080/file/upload'));
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        file.bytes!,
        contentType: MediaType('application', 'octet-stream'),
        filename: file.name,
      ),
    );
    request.headers.addAll(headers);
    request.send().then((response) {
      if (response.statusCode == 200) return true;
    });
    return false;
  }
}
