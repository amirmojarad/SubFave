import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/collection.dart';
import 'package:subfave/view/screens/config.dart';
import 'package:http/http.dart' as http;

class CollectionProvider with ChangeNotifier {
  
  List<Collection> collections = [];
  Future<bool> getCollections() async {
    await user.loadUser();
    var response = await http
        .get(Uri.parse("http://localhost:8080/users/collections/all"), headers: {
      'Authorization': 'Bearer ${user.token}',
    });
    if (response.statusCode == 200){
      List<dynamic> jsonBodyResponse = jsonDecode(response.body);
      print(jsonBodyResponse);
      for (var item in jsonBodyResponse){
        collections.add(Collection.fromJson(item));
      }
      return true;
    }
    notifyListeners();
    return false;
  }
}
