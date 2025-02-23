import 'dart:typed_data';

import 'package:portfolio/data/data_sources/user_project_data_sources.dart';
import 'package:portfolio/data/models/user_project_model.dart';
import 'package:uuid/uuid.dart';

class UserProjectRepository {
  final UserProjectDataSources _userProjectDataSources =
      UserProjectDataSources();

  Future<List<UserProjectModel>> getUserProjectsData() async {
    try {
      List<UserProjectModel> data =
          await _userProjectDataSources.getUserProjectsData();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProjectModel?> uploadUserProject({
    required String projectName,
    required String projectDevelopmentField,
    required String projectTechnologyStack,
    required String? projectURL,
    required List<Uint8List> projectImgData,
    required List<String> projectDescription,
   
  }) async {
    try {
      UserProjectModel projectModel = UserProjectModel(
          id: const Uuid().v1(),
          projectName: projectName,
          projectDevelopmentField: projectDevelopmentField,
          projectTechnologyStack: projectTechnologyStack,
          projectUrl: projectURL,
          projectImgUrls: [],
          projectDescription: projectDescription,
           isOpenProjectDescription: false,
          isProjectItemHovering: false,
          );

      if (projectImgData.isNotEmpty) {
        List<String> imgUrls = await _userProjectDataSources.uploadProjectImg(
            projectImgData, projectModel);

        projectModel = projectModel.copWith(projectImgUrls: imgUrls);
      }

      final data =
          await _userProjectDataSources.uploadUserProject(projectModel);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProjectModel?> updateUserProject({
    required String id,
    required String projectName,
    required String projectDevelopmentField,
    required String projectTechnologyStack,
      required String? projectURL,
    required List<String> projectImgUrls,
    required List<Uint8List> projectImgData,
    required List<String> projectDescription,
  }) async {
    try {
      UserProjectModel projectModel = UserProjectModel(
          id: id,
          projectName: projectName,
          projectDevelopmentField: projectDevelopmentField,
          projectTechnologyStack: projectTechnologyStack,
          projectImgUrls: projectImgUrls,
          projectUrl: projectURL,
          projectDescription: projectDescription,
          isOpenProjectDescription: false,
          isProjectItemHovering: false,
          );

      if (projectImgData.isNotEmpty) {
        List<String> imgUrls = await _userProjectDataSources.updateProjectImg(
            projectImgData, projectModel);

        projectModel = projectModel.copWith(projectImgUrls: imgUrls);
      }

      final data =
          await _userProjectDataSources.updateUserProject(projectModel);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProjectModel?> deleteUserProject(
      {required UserProjectModel projectModel}) async {
    try {
      final data =
          await _userProjectDataSources.deleteUserProject(projectModel);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
