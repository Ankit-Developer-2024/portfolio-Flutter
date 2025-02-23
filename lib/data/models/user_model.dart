class UserModel {
  final String id;
  final String userName;
  final String techStack;
  final String linkedUrl;
  final String githubUrl;
  final String userImageUrl;
  final String userResumeUrl;
  final String phoneNumber;
  final String email;
  final String location;
  String? locationUrl;
  String? aboutMe;

  UserModel(
      {required this.userName,
      required this.techStack,
      required this.linkedUrl,
      required this.githubUrl,
      required this.userImageUrl,
      required this.userResumeUrl,
      required this.phoneNumber,
      required this.email,
      required this.location,
      required this.id,
      this.locationUrl,
      this.aboutMe
      });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      userName: json['username'] ?? '',
      techStack: json['tech_stack'] ?? '',
      linkedUrl: json['linked_url'] ?? '',
      githubUrl: json['github_url'] ?? '',
      locationUrl: json['location_url'] ?? '',
      userImageUrl: json['user_image_url'] ?? '',
      userResumeUrl: json['user_resume_url'] ?? '',
      phoneNumber: json['phone_no'] ?? '',
      email: json['email'] ?? '',
      location: json['location'] ?? '',
      aboutMe: json['about_me']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": userName,
      "tech_stack": techStack,
      "linked_url": linkedUrl,
      "github_url": githubUrl,
      "location_url": locationUrl,
      "user_image_url": userImageUrl,
      "user_resume_url": userResumeUrl,
      "phone_no": phoneNumber,
      "email": email,
      "location": location,
      "about_me": aboutMe
    };
  }

  UserModel copyWith({
    String? userName,
    String? techStack,
    String? linkedUrl,
    String? githubUrl,
    String? locationUrl,
    String? userImageUrl,
    String? userResumeUrl,
    String? phoneNumber,
    String? email,
    String? location,
    String? id,
    String? aboutMe,
  }) {
    return UserModel(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        techStack: techStack ?? this.techStack,
        linkedUrl: linkedUrl ?? this.linkedUrl,
        githubUrl: githubUrl ?? this.githubUrl,
        userImageUrl: userImageUrl ?? this.userImageUrl,
        userResumeUrl: userResumeUrl ?? this.userResumeUrl,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        locationUrl: locationUrl ?? this.locationUrl,
        location: location ?? this.location,
        aboutMe: aboutMe ?? this.aboutMe,
        
        );
  }
}
