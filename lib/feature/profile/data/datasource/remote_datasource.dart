import 'dart:developer';

import 'package:http/http.dart' as http;

class RemoteDatasource {
  final _BASE_URL = "http://192.168.3.105/kendaraan/";
  final _END_POINT = "list.php";

  Future<http.Response> getList() async {
    try {
      var url = Uri.parse("${_BASE_URL}${_END_POINT}");
      log("message${url}");
      return await http.get(url);
    } catch (e) {
      print('Error fetching status survey: $e');
      throw e;
    }
  }
}
