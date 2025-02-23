import 'package:portfolio/data/models/bytes_model.dart';
import 'package:http/http.dart' as http;

class ApiResInBytesDataSource {
  Future<BytesModel> getApiResInBytes({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return BytesModel(uint8list: response.bodyBytes);
      } else {
       return  BytesModel(uint8list: null);
      }
    } catch (e) {
      rethrow;
    }
   
  }
}
