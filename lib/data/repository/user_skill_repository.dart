import 'dart:typed_data';

import 'package:portfolio/data/data_sources/user_skill_data_source.dart';
import 'package:portfolio/data/models/user_skill_model.dart';
import 'package:uuid/uuid.dart';

class UserSkillRepository {
  final UserSkillDataSource _userSkillDataSource = UserSkillDataSource();


     Future<List<UserSkillModel>> getUserSkillsData() async {
    try {
      List<UserSkillModel> data =
          await _userSkillDataSource.getUserSkillsData();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserSkillModel?> uploadUserSkill({
    required String skillName,
    required Uint8List imgData,
  }) async {
    try {
      UserSkillModel skillModel = UserSkillModel(
          id: const Uuid().v1(), skillName: skillName, skillImgUrl: "");

      final imgUrl =
          await _userSkillDataSource.uploadSkillImg(imgData, skillModel);
      skillModel = skillModel.copyWith(skillImgUrl: imgUrl);

      final skillData = _userSkillDataSource.uploadUserSkill(skillModel);
      return skillData;
    } catch (e) {
      rethrow;
    }
  }
  
  Future<UserSkillModel?> updateUserSkill({
    required String id,
    required String skillName,
    required String skillImgUrl,
    required Uint8List imgData,

  }) async {
    try {
      UserSkillModel skillModel = UserSkillModel(
          id: id, skillName: skillName, skillImgUrl: skillImgUrl);

      final imgUrl =
          await _userSkillDataSource.updateSkillImg(imgData, skillModel);
      skillModel = skillModel.copyWith(skillImgUrl: imgUrl);

      final skillData = _userSkillDataSource.updateUserSkill(skillModel);
      return skillData;
    } catch (e) {
      rethrow;
    }
  }
 
  Future<UserSkillModel?> deleteUserSkill({
    required UserSkillModel skillModel

  }) async {
    try {
     
      final skillData = _userSkillDataSource.deleteUserSkill(skillModel);
      return skillData;
    } catch (e) {
      rethrow;
    }
  }
}
