import 'package:flutter/foundation.dart';
import 'package:portfolio/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDataSources {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<UserModel?> uploadUserData(UserModel user) async {
    try {
      var userData = await _supabaseClient
          .from("user_data")
          .insert(user.toJson())
          .select();

      return UserModel.fromJson(userData.first);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Future<UserModel?> updateUserData(UserModel user) async {
    try {
      var userData = await _supabaseClient
          .from("user_data")
          .update(user.toJson())
          .eq('id', user.id)
          .select();

      return UserModel.fromJson(userData.first);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Future<String?> uploadUserFile(
      Uint8List data, bool isImage, UserModel user) async {
    try {
      if (isImage) {
        await _supabaseClient.storage
            .from("user_storage")
            .uploadBinary("image-${user.id}-U${0}", data);
        return _supabaseClient.storage
            .from("user_storage")
            .getPublicUrl("image-${user.id}-U${0}");
      } else {
        await _supabaseClient.storage
            .from("user_storage")
            .uploadBinary("resume-${user.id}-U${0}", data);
        return _supabaseClient.storage
            .from("user_storage")
            .getPublicUrl("resume-${user.id}-U${0}");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw e.toString();
    }
  }

  Future<String?> updateUserFile(
      Uint8List data, bool isImage, UserModel user) async {
    try {
      if (isImage) {
        int index = user.userImageUrl.length;
        int? val2 = toInt(user.userImageUrl[index - 1]);

        await _supabaseClient.storage
            .from("user_storage")
            .updateBinary("image-${user.id}-U${val2! + 1}", data);
        return _supabaseClient.storage
            .from("user_storage")
            .getPublicUrl("image-${user.id}-U${val2 + 1}");
      } else {
        int index = user.userResumeUrl.length;
        int? val2 = toInt(user.userResumeUrl[index - 1]);

        await _supabaseClient.storage
            .from("user_storage")
            .updateBinary("resume-${user.id}-U${val2! + 1}", data);
        return _supabaseClient.storage
            .from("user_storage")
            .getPublicUrl("resume-${user.id}-U${val2 + 1}");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw e.toString();
    }
  }
}
