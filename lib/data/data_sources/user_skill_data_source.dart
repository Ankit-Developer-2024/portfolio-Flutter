import 'dart:typed_data';

import 'package:portfolio/data/models/user_skill_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserSkillDataSource {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<List<UserSkillModel>> getUserSkillsData() async {
    try {
      List<UserSkillModel> dataList = [];
      final data = await _supabaseClient.from("user_skills").select();

      if (data.isNotEmpty) {
        for (var i = 0; i < data.length; i++) {
          dataList.add(UserSkillModel.fromJson(data[i]));
        }
        return dataList;
      } else {
        return dataList;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserSkillModel?> uploadUserSkill(UserSkillModel skillModel) async {
    try {
      final data = await _supabaseClient
          .from("user_skills")
          .insert(skillModel.toJson())
          .select();

      return UserSkillModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserSkillModel?> updateUserSkill(UserSkillModel skillModel) async {
    try {
      final data = await _supabaseClient
          .from("user_skills")
          .update(skillModel.toJson())
          .eq('id', skillModel.id)
          .select();

      return UserSkillModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserSkillModel?> deleteUserSkill(UserSkillModel skillModel) async {
    try {
      if (skillModel.skillImgUrl.isNotEmpty) {
        await _supabaseClient.storage
            .from("user_storage")
            .remove(["skillImg-${skillModel.id}"]);
      }

      final response = await _supabaseClient
          .from('user_skills')
          .select()
          .eq('id', skillModel.id)
          .maybeSingle();
      if (response == null) {
        return null;
      } else {
        final data = await _supabaseClient
            .from('user_skills')
            .delete()
            .eq('id', skillModel.id)
            .select();
        return UserSkillModel.fromJson(data.first);    
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> uploadSkillImg(
      Uint8List img, UserSkillModel skillModel) async {
    try {
      await _supabaseClient.storage
          .from("user_storage")
          .uploadBinary("skillImg-${skillModel.id}", img);

      return _supabaseClient.storage
          .from("user_storage")
          .getPublicUrl("skillImg-${skillModel.id}");
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> updateSkillImg(
      Uint8List img, UserSkillModel skillModel) async {
    try {
      if (skillModel.skillImgUrl.isNotEmpty) {
        await _supabaseClient.storage
            .from("user_storage")
            .remove(["skillImg-${skillModel.id}"]);
      }

      await _supabaseClient.storage
          .from("user_storage")
          .uploadBinary("skillImg-${skillModel.id}", img);

      return _supabaseClient.storage
          .from("user_storage")
          .getPublicUrl("skillImg-${skillModel.id}");
    } catch (e) {
      rethrow;
    }
  }
}
