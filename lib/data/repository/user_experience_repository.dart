import 'package:portfolio/data/data_sources/user_experience_data_source.dart';
import 'package:portfolio/data/models/user_experience_model.dart';
import 'package:uuid/uuid.dart';

class UserExperienceRepository {
  final UserExperienceDataSource _userExperienceDataSource =
      UserExperienceDataSource();


      Future<List<UserExperienceModel>> getUserExperienceData() async {
    try {
      List<UserExperienceModel> data =
          await _userExperienceDataSource.getUserExperienceData();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserExperienceModel?> uploadExperienceData({
    required String techStack,
    required String designation,
    required List<String> startDate,
    List<String>? endDate,
    required String companyName,
    required String companyLocation,
    required List<String> experienceIncompany,
  }) async {
    try {
      UserExperienceModel experienceModel = UserExperienceModel(
          id: const Uuid().v1(),
          techStack: techStack,
          designation: designation,
          startDate: startDate,
          endDate: endDate,
          companyName: companyName,
          companyLocation: companyLocation,
          experienceIncompany: experienceIncompany);

      final data =
          await _userExperienceDataSource.uploadExperienceData(experienceModel);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserExperienceModel?> updateExperienceData({
    required String id,
    required String techStack,
    required String designation,
    required List<String> startDate,
    List<String>? endDate,
    required String companyName,
    required String companyLocation,
    required List<String> experienceIncompany,
  }) async {
    try {
      UserExperienceModel experienceModel = UserExperienceModel(
          id: id,
          techStack: techStack,
          designation: designation,
          startDate: startDate,
          companyName: companyName,
          companyLocation: companyLocation,
          experienceIncompany: experienceIncompany);

      final data =
          await _userExperienceDataSource.updateExperienceData(experienceModel);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserExperienceModel?> deleteExperienceData(
      {required UserExperienceModel experienceModel}) async {
    try {
      final data =
          await _userExperienceDataSource.deleteExperienceData(experienceModel);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
