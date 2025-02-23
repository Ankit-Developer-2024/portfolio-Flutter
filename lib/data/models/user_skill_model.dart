class UserSkillModel {
  final String id;
  final String skillName;
  final String skillImgUrl;

  UserSkillModel({
    required this.id,
    required this.skillName,
    required this.skillImgUrl,
  });

  factory UserSkillModel.fromJson(Map<String, dynamic> json) {
    return UserSkillModel(
      id: json['id'] ?? '',
      skillName: json['skill_name'] ?? '',
      skillImgUrl: json['skill_img_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'skill_name': skillName,
      'skill_img_url': skillImgUrl,
    };
  }

  UserSkillModel copyWith(
      {String? id, String? skillName, String? skillImgUrl}) {
    return UserSkillModel(
      id: id ?? this.id,
      skillName: skillName ?? this.skillName,
      skillImgUrl: skillImgUrl ?? this.skillImgUrl,
    );
  }
}
