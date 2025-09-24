import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ofline_database_with_hive/core/common_widets/flutter_toast.dart';
import 'package:ofline_database_with_hive/feture/home/data/data_model/home_data_model.dart';

class CallApi {
  static const String baseUrl = "https://fakestoreapi.com";

  Future<List<Post>> fetchData() async {
    try {
      var respons = await http.get(Uri.parse("$baseUrl/products"));
      if (respons.statusCode == 200) {
        sucessToast("Data Loaded Suessfully");
        List decoded = jsonDecode(respons.body);
        return decoded.map((e) => Post.formJson(e)).toList();
      } else {
        errorToast("Sumthing Wrong");
      }
    } catch (e) {
      errorToast("Error :$e");
    }
    return [];
  }
}
