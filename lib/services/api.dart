import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/toast.dart';

class HttpServices {
  String baseUrl = "https://hp-api.onrender.com";
  Future get(String url) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$url'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      var data = json.decode(response.body);
      return {"status": response.statusCode, "data": data};
    } catch (e) {
      showToast("Internal Server Error");
    }
  }
}
