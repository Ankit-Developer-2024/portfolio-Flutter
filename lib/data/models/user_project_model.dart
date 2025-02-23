class UserProjectModel {
  final String id;
  final String projectName;
  final String projectDevelopmentField;
  final String projectTechnologyStack;
  final String? projectUrl;
  final List<String> projectImgUrls;
  final List<String> projectDescription;
  bool isOpenProjectDescription;
  bool isProjectItemHovering;

  UserProjectModel(
      {required this.id,
      required this.projectName,
      required this.projectDevelopmentField,
      required this.projectTechnologyStack,
      required this.projectImgUrls,
      required this.projectDescription,
      required this.isOpenProjectDescription,
      required this.isProjectItemHovering,
      this.projectUrl});

  factory UserProjectModel.fromJson(Map<String, dynamic> json) {
    return UserProjectModel(
      id: json["id"],
      projectName: json["project_name"],
      projectTechnologyStack: json['project_technology_stack'],
      projectDevelopmentField: json['project_development_field'],
      projectUrl: json['project_url'],
      projectImgUrls: json["project_img_url"] != null
          ? List.from((json["project_img_url"]).map((item) => item))
          : [],
      projectDescription: json["project_description"] != null
          ? List.from((json["project_description"]).map((item) => item))
          : [],
      isOpenProjectDescription: false,
      isProjectItemHovering: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "project_name": projectName,
      "project_development_field": projectDevelopmentField,
      "project_technology_stack": projectTechnologyStack,
      "project_img_url": projectImgUrls,
      "project_description": projectDescription,
      "project_url": projectUrl
    };
  }

  UserProjectModel copWith({
    String? id,
    String? projectName,
    String? projectDevelopmentField,
    String? projectTechnologyStack,
    String? projectUrl,
    List<String>? projectImgUrls,
    List<String>? projectDescription,
    bool? isOpenProjectDescription,
    bool? isProjectItemHovering,
  }) {
    return UserProjectModel(
      id: id ?? this.id,
      projectName: projectName ?? this.projectName,
      projectUrl: projectUrl ?? this.projectUrl,
      projectDevelopmentField:
          projectDevelopmentField ?? this.projectDevelopmentField,
      projectTechnologyStack:
          projectTechnologyStack ?? this.projectTechnologyStack,
      projectImgUrls: projectImgUrls ?? this.projectImgUrls,
      projectDescription: projectDescription ?? this.projectDescription,
      isOpenProjectDescription:
          isOpenProjectDescription ?? this.isOpenProjectDescription,
      isProjectItemHovering:
          isProjectItemHovering ?? this.isProjectItemHovering,
    );
  }
}
