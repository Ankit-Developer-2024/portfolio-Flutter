import 'package:portfolio/data/data_sources/api_res_in_bytes_data_source.dart';
import 'package:portfolio/data/models/bytes_model.dart';

class ApiResInBytesRepository {
  final ApiResInBytesDataSource _apiResInBytesDataSource =
      ApiResInBytesDataSource();

  Future<BytesModel> getApiResInBytes({required String url}) async {
    try {
      final data = await _apiResInBytesDataSource.getApiResInBytes(url: url);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
