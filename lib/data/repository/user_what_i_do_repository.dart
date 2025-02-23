import 'dart:typed_data';

import 'package:portfolio/data/data_sources/user_what_i_do_data_source.dart';
import 'package:portfolio/data/models/user_what_i_do_model.dart';
import 'package:uuid/uuid.dart';

class UserWhatIDoRepository {
  final UserWhatIDoDataSource _userWhatIDoDataSource = UserWhatIDoDataSource();

  Future<List<UserWhatIDoModel>> getWhatIDoData() async {
    try {
      List<UserWhatIDoModel> data =
          await _userWhatIDoDataSource.getWhatIDoData();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserWhatIDoModel?> uploadWhatIDoData({
    required String techStackTitle,
    required String techStackDesc,
    List<String>? descHighLightWords,
    Uint8List? imgdata,
  }) async {
    try {
      UserWhatIDoModel whatIDoModel = UserWhatIDoModel(
          id: const Uuid().v1(),
          techStackTitle: techStackTitle,
          techStackDesc: techStackDesc,
          descHighLightWord: descHighLightWords);

      if (imgdata != null) {
        final imgUrl = await _userWhatIDoDataSource.uploadTechStackFile(
            imgdata, whatIDoModel);

        whatIDoModel = whatIDoModel.copyWith(imgUrl: imgUrl);
      }
      final data = _userWhatIDoDataSource.uploadWhatIdoData(whatIDoModel);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserWhatIDoModel?> updateWhatIDoData({
    required String id,
    required String techStackTitle,
    required String techStackDesc,
    required String? techStackImgUrl,
    List<String>? descHighLightWords,
    Uint8List? imgdata,
  }) async {
    try {
      UserWhatIDoModel whatIDoModel = UserWhatIDoModel(
          id: id,
          techStackTitle: techStackTitle,
          techStackDesc: techStackDesc,
          imgUrl: techStackImgUrl,
          descHighLightWord: descHighLightWords);

      if (imgdata != null) {
        final imgUrl = await _userWhatIDoDataSource.updateTechStackFile(
            imgdata, whatIDoModel);

        whatIDoModel = whatIDoModel.copyWith(imgUrl: imgUrl);
      }

      final data = _userWhatIDoDataSource.updateWhatIdoData(whatIDoModel);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserWhatIDoModel?> deleteWhatIDoData({
    required UserWhatIDoModel whatIdo,
  }) async {
    try {
      final data = _userWhatIDoDataSource.deleteWhatIdoData(whatIdo);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
