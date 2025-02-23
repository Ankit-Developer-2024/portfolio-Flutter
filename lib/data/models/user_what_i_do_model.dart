class UserWhatIDoModel {
  final String id;
  final String techStackTitle;
  final String techStackDesc;
  final String? imgUrl;
  final List<String>? descHighLightWord;

  UserWhatIDoModel({
    required this.id,
    required this.techStackTitle,
    required this.techStackDesc,
    this.imgUrl,
    this.descHighLightWord,
  });

  factory UserWhatIDoModel.fromJson(Map<String, dynamic> json) {
    return UserWhatIDoModel(
      id: json['id'] ?? "",
      techStackTitle: json["tech_stack_title"] ?? '',
      techStackDesc: json["tech_stack_desc"] ?? "",
      imgUrl: json["img_url"],
      descHighLightWord: json['desc_highlight_words'] != null
          ? List.from(json['desc_highlight_words'].map((item) => item))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tech_stack_title": techStackTitle,
      "tech_stack_desc": techStackDesc,
      "img_url": imgUrl,
      "desc_highlight_words": descHighLightWord
    };
  }

  UserWhatIDoModel copyWith(
      {String? id,
      String? techStackTitle,
      String? techStackDesc,
      String? imgUrl,
      List<String>? descHighLightWord}) {
    return UserWhatIDoModel(
      id: id ?? this.id,
      techStackTitle: techStackTitle ?? this.techStackTitle,
      techStackDesc: techStackDesc ?? this.techStackDesc,
      imgUrl: imgUrl ?? this.imgUrl,
      descHighLightWord: descHighLightWord ?? this.descHighLightWord,
    );
  }
}
