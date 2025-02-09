import 'dart:typed_data';

import 'package:portfolio/data/data_sources/user_data_sources.dart';
import 'package:portfolio/data/models/user_model.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  Future<UserModel?> uploadUserData({
    required String userName,
    required String techStack,
    required String linkedUrl,
    required String githubUrl,
    required String? locationUrl,
    required Uint8List userImage,
    required Uint8List userResume,
    required String phoneNumber,
    required String email,
    required String location,
  }) async {
    try {
      UserModel user = UserModel(
          id: const Uuid().v1(),
          userName: userName,
          techStack: techStack,
          linkedUrl: linkedUrl,
          githubUrl: githubUrl,
          locationUrl: locationUrl,
          userImageUrl: "",
          userResumeUrl: "",
          phoneNumber: phoneNumber,
          email: email,
          location: location);

      final imageUrl =
          await UserDataSources().uploadUserFile(userImage, true, user);
      final resumeUrl =
          await UserDataSources().uploadUserFile(userResume, false, user);

      user = user.copyWith(userImageUrl: imageUrl, userResumeUrl: resumeUrl);
      final userData = await UserDataSources().uploadUserData(user);
      return userData;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> updateUserData({
    required String userId,
    required String userName,
    required String techStack,
    required String linkedUrl,
    required String githubUrl,
    required String? locationUrl,
    required Uint8List userImage,
    required Uint8List userResume,
    required String phoneNumber,
    required String email,
    required String location,
    required String imageUrl,
    required String resumeUrl,
  }) async {
    try {
      UserModel user = UserModel(
          id: userId,
          userName: userName,
          techStack: techStack,
          linkedUrl: linkedUrl,
          githubUrl: githubUrl,
          locationUrl: locationUrl,
          userImageUrl: imageUrl,
          userResumeUrl: resumeUrl,
          phoneNumber: phoneNumber,
          email: email,
          location: location);

      final imgUrl =
          await UserDataSources().updateUserFile(userImage, true, user);
      final resUrl =
          await UserDataSources().updateUserFile(userResume, false, user);

      user = user.copyWith(userImageUrl: imgUrl, userResumeUrl: resUrl);
      final userData = await UserDataSources().updateUserData(user);
      return userData;
    } catch (e) {
      rethrow;
    }
  }
}
