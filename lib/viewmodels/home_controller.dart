import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/componetns/section_seperate_ui.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/views/widgets/sections/user_contact_section.dart';
import 'package:protfolio/views/widgets/sections/user_experience_section.dart';
import 'package:protfolio/views/widgets/sections/user_home_section.dart';
import 'package:protfolio/views/widgets/sections/user_project_section.dart';
import 'package:protfolio/views/widgets/sections/user_resume_section.dart';
import 'package:protfolio/views/widgets/sections/user_skills_section.dart';

class HomeController extends GetxController {
  RxBool lightThemeMode = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailPhoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  var themeMode = ThemeMode.light.obs;

  List<Map<String, dynamic>> listOfSkills = [
    {
      "skillName": "App Development",
      "skillImagePath": "app_development.png",
      "textWight": "bold",
    },
    {
      "skillName": "Web Development",
      "skillImagePath": "web_development.png",
      "textWight": "bold",
    },
    {
      "skillName": "Git",
      "skillImagePath": "git.png",
      "textWight": "bold",
    },
    {
      "skillName": "Flutter",
      "skillImagePath": "flutter.png",
      "textWight": "light",
    },
    {
      "skillName": "Dart",
      "skillImagePath": "dart.png",
      "textWight": "light",
    },
    {
      "skillName": "React.js",
      "skillImagePath": "react_js.png",
      "textWight": "light",
    },
    {
      "skillName": "Node.js",
      "skillImagePath": "node_js.png",
      "textWight": "light",
    },
    {
      "skillName": "Express.js",
      "skillImagePath": "express_js.png",
      "textWight": "light",
    },
    {
      "skillName": "MongoDB",
      "skillImagePath": "mongodb.png",
      "textWight": "light",
    },
    {
      "skillName": "JavaScript",
      "skillImagePath": "javascript.png",
      "textWight": "light",
    },
    {
      "skillName": "HTML",
      "skillImagePath": "html.png",
      "textWight": "light",
    },
    {
      "skillName": "CSS",
      "skillImagePath": "css.png",
      "textWight": "light",
    },
    {
      "skillName": "C++",
      "skillImagePath": "c++.png",
      "textWight": "light",
    },
    {
      "skillName": "OOPS",
      "skillImagePath": "oops.png",
      "textWight": "light",
    },
  ];

  List<String> listOfSkillName = [
    "Flutter",
    "Dart",
    "Git",
    "React.js",
    "Node.js",
    "Express.js",
    "MongoDB",
    "HTML",
    "CSS",
    "JavaScript",
    "C++",
    "OOPS"
  ];

  List<Map<String, dynamic>> prorfolioProject = [
    {
      "projectName": "Portfolio",
      "projectTechUsed": "Flutter",
      "projectDevelopmentIn": "Web Development",
      "listOfImagesPath": [
        "portfolio_img/portfolio_1.png",
        "portfolio_img/portfolio_2.png",
        "portfolio_img/portfolio_3.png",
        "portfolio_img/portfolio_4.png",
        "portfolio_img/portfolio_5.png",
        "portfolio_img/portfolio_7.png"
      ],
    },
    {
      "projectName": "ShopMagnet - An online shoping platform",
      "projectTechUsed": "MERN Stack",
      "projectDevelopmentIn": "Web Development",
      "listOfImagesPath": [
        "ecom/ecom_1.png",
        "ecom/ecom_2.png",
        "ecom/ecom_3.png",
        "ecom/ecom_4.png",
        "ecom/ecom_5.png",
        "ecom/ecom_7.png",
        "ecom/ecom_8.png",
        "ecom/ecom_9.png",
        "ecom/ecom_10.png",
        "ecom/ecom_11.png",
        "ecom/ecom_12.png",
        "ecom/ecom_13.png",
        "ecom/ecom_14.png",
        "ecom/ecom_15.png",
        "ecom/ecom_16.png",
        "ecom/ecom_17.png",
        "ecom/ecom_18.png",
        "ecom/ecom_19.png",
        "ecom/ecom_20.png",
      ],
    },
    {
      "projectName":
          "Server Load Tester - Test the server load by hit api multiple time",
      "projectTechUsed": "Flutter",
      "projectDevelopmentIn": "Web Development",
      "listOfImagesPath": [
        "api/api_1.png",
        "api/api_2.png",
        "api/api_3.png",
        "api/api_4.png",
        "api/api_5.png",
        "api/api_7.png",
        "api/api_8.png",
        "api/api_9.png",
        "api/api_10.png",
      ],
    },
  ];

  RxList<List<dynamic>> navBarButtonData = [
    [
      "Home",
      Utils.getIcons("home.png"),
    ],
    [
      "Experience",
      Utils.getIcons("experience.png"),
    ],
    [
      "Skills",
      Utils.getIcons("skills.png"),
    ],
    [
      "Projects",
      Utils.getIcons("projects.png"),
    ],
    [
      "Resume",
      Utils.getIcons("resume.png"),
    ],
    [
      "Contact",
      Utils.getIcons("contact.png"),
    ]
  ].obs;

  RxInt navBarButtonHoverIndex = 100.obs;
  RxInt navBarButtonSelectedIndex = 0.obs;

  bool isHovering(int val) => navBarButtonHoverIndex.value == val;
  bool isActive(int val) => navBarButtonSelectedIndex.value == val;

  void changeHoveringItem(int val) {
    if (!isHovering(val)) navBarButtonHoverIndex.value = val;
  }

  void changeActiveItem(int val) {
    if (!isActive(val)) navBarButtonSelectedIndex.value = val;
  }

  void menuOnTop(int val) {
    if (!isActive(val)) {
      changeActiveItem(val);
    }
  }

  void changeTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    lightThemeMode.value = !lightThemeMode.value;
    return;
  }

  Widget getUserSection(int value) {
    switch (value) {
      case 0:
        return const Column(
          children: [
            UserHomeSection(),
            SectionSeperateUi(),
            UserExperienceSection(),
            SectionSeperateUi(),
            UserSkillsSection(),
            SectionSeperateUi(),
            UserProjectSection(),
            SectionSeperateUi(),
            UserResumeSection(),
            SectionSeperateUi(),
            UserContactSection(),
            SectionSeperateUi(),
          ],
        );

      case 1:
        return const UserExperienceSection();
      case 2:
        return const UserSkillsSection();
      case 3:
        return const UserProjectSection();
      case 4:
        return const UserResumeSection();
      case 5:
        return const UserContactSection();

      default:
        return const Column(
          children: [
            UserHomeSection(),
            SectionSeperateUi(),
            UserExperienceSection(),
            SectionSeperateUi(),
            UserSkillsSection(),
            SectionSeperateUi(),
            UserProjectSection(),
            SectionSeperateUi(),
            UserResumeSection(),
            SectionSeperateUi(),
            UserContactSection(),
            SectionSeperateUi(),
          ],
        );
    }
  }

  void userFormData() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    print(nameController.text);
    print(messageController.text);
    print(mailPhoneController.text);

    return;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
