import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/componetns/section_seperate_ui.dart';
import 'package:protfolio/core/app/componetns/universal_toast_ui.dart';
import 'package:protfolio/core/enum/app_enum.dart';
import 'package:protfolio/services/send_email_services.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/views/widgets/sections/user_contact_section.dart';
import 'package:protfolio/views/widgets/sections/user_experience_section.dart';
import 'package:protfolio/views/widgets/sections/user_home_section.dart';
import 'package:protfolio/views/widgets/sections/user_project_section.dart';
import 'package:protfolio/views/widgets/sections/user_resume_section.dart';
import 'package:protfolio/views/widgets/sections/user_skills_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  RxBool lightThemeMode = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailPhoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String userLinkedInUrl = "www.linkedin.com/in/ankit-kumar-3850512b0";
  String userGithubUrl = "github.com/Ankit-Developer-2024";
  String userLocationUrl =
      "www.google.com/maps/place/Hisar,+Haryana/@29.15639,75.5907228,11z/data=!3m1!4b1!4m6!3m5!1s0x391232d8011d0c37:0x1d3f0df105af1178!8m2!3d29.1491875!4d75.7216527!16zL20vMDN4eWx3?authuser=0&entry=ttu&g_ep=EgoyMDI0MTIxMS4wIKXMDSoASAFQAw%3D%3D";

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
      "projectURL": "",
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
      "projectURL": "ecom-backend-xi-seven.vercel.app/",
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
      "projectURL": "api-time-three.vercel.app/",
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

  void goToSocialMedia(String? url) async {
    if (url != null && url.isNotEmpty) {
      final finalUrl = Uri.parse("https://$url");
      if (!await launchUrl(finalUrl)) {
        Get.snackbar("Get Some Error", "");
      }
    } else {
      toast(
          title: "This project is not hosted yet",
          subTitle: "sub title",
          icon: ToastIcon.info);
    }
  }

  Future<void> makePhoneCall() async {
    final Uri finalUrl = Uri(scheme: "tel", path: "8059650329");
    if (!await launchUrl(finalUrl)) {
      toast(
          title: "Phone call not happen",
          subTitle: "Check your system settings",
          icon: ToastIcon.info);
    }
    return;
  }

  Future<void> sentMail() async {
    final Uri finalUrl = Uri(
      scheme: "mailto",
      path: "kumar990ankit@gmail.com",
    );
    if (!await launchUrl(finalUrl)) {
      toast(
          title: "Gmail app not open",
          subTitle: "Check your system settings",
          icon: ToastIcon.info);
    }
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

  void userFormData() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    await SendEmailServices.sendMail(
        name: nameController.text,
        email: mailPhoneController.text,
        message: messageController.text);

    return;
  }
}
