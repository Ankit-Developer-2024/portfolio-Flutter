class UserExperienceModel {
  final String id;
  final String techStack;
  final String designation;
  final List<String> startDate;
  final List<String>? endDate;
  final String companyName;
  final String companyLocation;
  final List<String> experienceIncompany;

  UserExperienceModel({
    required this.id,
    required this.techStack,
    required this.designation,
    required this.startDate,
    this.endDate,
    required this.companyName,
    required this.companyLocation,
    required this.experienceIncompany,
  });

  factory UserExperienceModel.fromJson(Map<String, dynamic> json) {
    return UserExperienceModel(
      id: json["id"],
      techStack: json["tech_stack"],
      designation: json['designation'],
      startDate: json["start_date"] != null
          ? List.from((json["start_date"]).map((item) => item))
          : [],
      endDate: json["end_date"] != null
          ? List.from((json["end_date"]).map((item) => item))
          : null,
      companyName: json['company_name'],
      companyLocation: json['company_location'],
      experienceIncompany: json['experience_in_company'] != null
          ? List.from((json["experience_in_company"]).map((item) => item))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tech_stack": techStack,
      "designation": designation,
      "start_date": startDate,
      "end_date": endDate,
      "company_name": companyName,
      "company_location": companyLocation,
      "experience_in_company": experienceIncompany
    };
  }
}
