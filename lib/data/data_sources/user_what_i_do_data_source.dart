import 'package:flutter/foundation.dart';
import 'package:portfolio/data/models/user_what_i_do_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserWhatIDoDataSource {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<List<UserWhatIDoModel>> getWhatIDoData() async {
    try {
      List<UserWhatIDoModel> dataList = [];
      final data = await _supabaseClient.from("what_i_do").select();

      if (data.isNotEmpty) {
        for (var i = 0; i < data.length; i++) {
          dataList.add(UserWhatIDoModel.fromJson(data[i]));
        }
        return dataList;
      } else {
        return dataList;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserWhatIDoModel?> uploadWhatIdoData(UserWhatIDoModel whatIdo) async {
    try {
      final data = await _supabaseClient
          .from("what_i_do")
          .insert(whatIdo.toJson())
          .select();
      return UserWhatIDoModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserWhatIDoModel?> updateWhatIdoData(UserWhatIDoModel whatIdo) async {
    try {

      
      final data = await _supabaseClient
          .from("what_i_do")
          .update(whatIdo.toJson())
          .eq("id", whatIdo.id)
          .select();
      return UserWhatIDoModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserWhatIDoModel?> deleteWhatIdoData(UserWhatIDoModel whatIdo) async {
    try {
      if (whatIdo.imgUrl != null && whatIdo.imgUrl!.isNotEmpty) {
        await _supabaseClient.storage
            .from("user_storage")
            .remove(["techStackImage-${whatIdo.id}"]); //delete
      }
      final data = await _supabaseClient
          .from("what_i_do")
          .delete()
          .eq("id", whatIdo.id)
          .select();
      return UserWhatIDoModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> uploadTechStackFile(
      Uint8List data, UserWhatIDoModel whatIdo) async {
    try {
      await _supabaseClient.storage
          .from("user_storage")
          .uploadBinary("techStackImage-${whatIdo.id}", data);
      return _supabaseClient.storage
          .from("user_storage")
          .getPublicUrl("techStackImage-${whatIdo.id}");
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw e.toString();
    }
  }

  Future<String?> updateTechStackFile(
      Uint8List data, UserWhatIDoModel whatIdo) async {
    try {
      if (whatIdo.imgUrl != null && whatIdo.imgUrl!.isNotEmpty) {
        await _supabaseClient.storage
            .from("user_storage")
            .remove(["techStackImage-${whatIdo.id}"]); //delete
      }
      await _supabaseClient.storage
          .from("user_storage")
          .uploadBinary("techStackImage-${whatIdo.id}", data);
      return _supabaseClient.storage
          .from("user_storage")
          .getPublicUrl("techStackImage-${whatIdo.id}");
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw e.toString();
    }
  }
}
