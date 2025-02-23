import 'package:portfolio/data/models/user_experience_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserExperienceDataSource {
  final SupabaseClient _supabaseClient = Supabase.instance.client;


   Future<List<UserExperienceModel>> getUserExperienceData() async {
    try {
       List<UserExperienceModel> dataList = [];
       final data = await _supabaseClient.from("user_experience").select();

       if (data.isNotEmpty) {
        for (var i = 0; i < data.length; i++) {
          dataList.add(UserExperienceModel.fromJson(data[i]));
        }
        return dataList;
      } else {
        return dataList;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserExperienceModel?> uploadExperienceData(
      UserExperienceModel experience) async {
    try {
      final data = await _supabaseClient
          .from("user_experience")
          .insert(experience.toJson())
          .select();
 
      return UserExperienceModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserExperienceModel?> updateExperienceData(
      UserExperienceModel experience) async {
    try {
      final data = await _supabaseClient
          .from("user_experience")
          .update(experience.toJson())
          .eq("id", experience.id)
          .select();

      return UserExperienceModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserExperienceModel?> deleteExperienceData(
      UserExperienceModel experience) async {
    try {
      final data = await _supabaseClient
          .from("user_experience")
          .delete()
          .eq("id", experience.id)
          .select();

      return UserExperienceModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }
}
