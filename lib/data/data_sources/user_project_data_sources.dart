import 'dart:typed_data';

import 'package:portfolio/data/models/user_project_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProjectDataSources {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<List<UserProjectModel>> getUserProjectsData() async {
    try {
       List<UserProjectModel> dataList = [];
       final data = await _supabaseClient.from("user_projects").select();

       if (data.isNotEmpty) {
        for (var i = 0; i < data.length; i++) {
          dataList.add(UserProjectModel.fromJson(data[i]));
        }
        return dataList;
      } else {
        return dataList;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProjectModel?> uploadUserProject(
      UserProjectModel projectModel) async {
    try {
      final data = await _supabaseClient
          .from("user_projects")
          .insert(projectModel.toJson())
          .select();

      return UserProjectModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProjectModel?> updateUserProject(
      UserProjectModel projectModel) async {
    try {
      final data = await _supabaseClient
          .from("user_projects")
          .update(projectModel.toJson())
          .eq('id', projectModel.id)
          .select();

      return UserProjectModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProjectModel?> deleteUserProject(
      UserProjectModel projectModel) async {
    try {
      if (projectModel.projectImgUrls.isNotEmpty) {
        for (var i = 0; i < projectModel.projectImgUrls.length; i++) {
          await _supabaseClient.storage
              .from("user_storage")
              .remove(["project-${projectModel.id}-Img${i + 1}"]);
        }
      }

      final data = await _supabaseClient
          .from("user_projects")
          .delete()
          .eq('id', projectModel.id)
          .select();

      return UserProjectModel.fromJson(data.first);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> uploadProjectImg(
      List<Uint8List> images, UserProjectModel projectModel) async {
    try {
      List<String> imgUrls = [];

      for (int i = 0; i < images.length; i++) {
        await _supabaseClient.storage
            .from("user_storage")
            .uploadBinary("project-${projectModel.id}-Img${i + 1}", images[i]);

        String url = _supabaseClient.storage
            .from("user_storage")
            .getPublicUrl("project-${projectModel.id}-Img${i + 1}");

        imgUrls.add(url);
      }

      return imgUrls;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> updateProjectImg(
      List<Uint8List> images, UserProjectModel projectModel) async {
    try {
      List<String> imgUrls = [];
      if (projectModel.projectImgUrls.isNotEmpty) {
        for (var i = 0; i < projectModel.projectImgUrls.length; i++) {
          await _supabaseClient.storage
              .from("user_storage")
              .remove(["project-${projectModel.id}-Img${i + 1}"]);
        }
      }

      for (int i = 0; i < images.length; i++) {
        await _supabaseClient.storage
            .from("user_storage")
            .uploadBinary("project-${projectModel.id}-Img${i + 1}", images[i]);

        String url = _supabaseClient.storage
            .from("user_storage")
            .getPublicUrl("project-${projectModel.id}-Img${i + 1}");

        imgUrls.add(url);
      }

      return imgUrls;
    } catch (e) {
      rethrow;
    }
  }
}
