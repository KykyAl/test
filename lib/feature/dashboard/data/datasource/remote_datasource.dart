import 'package:http/http.dart' as http;

class RemoteDataSource {
  Future<http.Response> getList() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
      return await http.get(url);
    } catch (error) {
      print('Error fetching status survey: $error');
      throw error;
    }
  }
}
