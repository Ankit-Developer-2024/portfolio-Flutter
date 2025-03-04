import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/section_seperate_ui.dart';
import 'package:portfolio/core/app/componetns/universal_toast_ui.dart';
import 'package:portfolio/core/enum/app_enum.dart';
import 'package:portfolio/data/models/user_experience_model.dart';
import 'package:portfolio/data/models/user_model.dart';
import 'package:portfolio/data/models/user_project_model.dart';
import 'package:portfolio/data/models/user_skill_model.dart';
import 'package:portfolio/data/models/user_what_i_do_model.dart';
import 'package:portfolio/data/repository/api_res_in_bytes_repository.dart';
import 'package:portfolio/data/repository/user_experience_repository.dart';
import 'package:portfolio/data/repository/user_project_repository.dart';
import 'package:portfolio/data/repository/user_repository.dart';
import 'package:portfolio/data/repository/user_skill_repository.dart';
import 'package:portfolio/data/repository/user_what_i_do_repository.dart';
import 'package:portfolio/services/send_email_services.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/views/home/widgets/sections/user_contact_section.dart';
import 'package:portfolio/views/home/widgets/sections/user_experience_section.dart';
import 'package:portfolio/views/home/widgets/sections/user_home_section.dart';
import 'package:portfolio/views/home/widgets/sections/user_project_section.dart';
import 'package:portfolio/views/home/widgets/sections/user_resume_section.dart';
import 'package:portfolio/views/home/widgets/sections/user_skills_section.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  RxBool lightThemeMode = true.obs;
  SupabaseClient supabase = Supabase.instance.client;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailPhoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void replaceFormKey() {
    formKey = GlobalKey<FormState>();

    update(); // Update the UI if needed
  }

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
      "projectURL": "ankit-portfolio-swart.vercel.app/",
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
  RxBool isUserImgHover = false.obs;

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

  RxBool isProjectItemHovering = false.obs;
  RxBool isOpenProjectDescription = false.obs;

  void changeTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    lightThemeMode.value = !lightThemeMode.value;
    return;
  }

  ApiResInBytesRepository apiResInBytesRepository = ApiResInBytesRepository();
  //user data
  final UserRepository userRepository = UserRepository();
  Rxn<UserModel> userModel = Rxn<UserModel>();

  //what i do
  final UserWhatIDoRepository userWhatIDoRepository = UserWhatIDoRepository();
  RxList<UserWhatIDoModel> userWhatIDoModelList = <UserWhatIDoModel>[].obs;
  //experienxce
  final UserExperienceRepository userExperienceRepository =
      UserExperienceRepository();
  RxList<UserExperienceModel> userExperienceModelList =
      <UserExperienceModel>[].obs;

  //skills
  final UserSkillRepository userSkillRepository = UserSkillRepository();
  RxList<UserSkillModel> userSkillModelList = <UserSkillModel>[].obs;

  //projects
  final UserProjectRepository userProjectRepository = UserProjectRepository();
  RxList<UserProjectModel> userProjectModelList = <UserProjectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
    getWhatIdo();
    getUserExperience();
    getUserSkills();
    getProjectSkills();
  }

  void getUserData() async {
    try {
      final data = await userRepository.getUser();
      if (data != null) {
        toast(
            title: Utils.getString("user_fetch_succ"), icon: ToastIcon.success);
        userModel.value = data;
      } else {
        toast(
            title: Utils.getString("user_fetch_not_succ"),
            icon: ToastIcon.warning);
        userModel.value = null;
      }
    } on PostgrestException catch (e) {
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  void getWhatIdo() async {
    try {
      final data = await userWhatIDoRepository.getWhatIDoData();
      if (data.isNotEmpty) {
        userWhatIDoModelList.value = [...data];
      } else {
        toast(
            title: Utils.getString("user_tech_stack_not_succ"),
            icon: ToastIcon.warning);
        userWhatIDoModelList.value = [];
      }
    } on PostgrestException catch (e) {
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  void getUserExperience() async {
    try {
      final data = await userExperienceRepository.getUserExperienceData();
      if (data.isNotEmpty) {
        userExperienceModelList.value = [...data];
      } else {
        toast(
            title: Utils.getString("user_experience_not_succ"),
            icon: ToastIcon.warning);
        userExperienceModelList.value = [];
      }
    } on PostgrestException catch (e) {
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  void getUserSkills() async {
    try {
      final data = await userSkillRepository.getUserSkillsData();
      if (data.isNotEmpty) {
        userSkillModelList.value = [...data];
      } else {
        toast(
            title: Utils.getString("user_skills_not_succ"),
            icon: ToastIcon.warning);
        userSkillModelList.value = [];
      }
    } on PostgrestException catch (e) {
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  void getProjectSkills() async {
    try {
      final data = await userProjectRepository.getUserProjectsData();
      if (data.isNotEmpty) {
        userProjectModelList.value = [...data];
      } else {
        toast(
            title: Utils.getString("user_project_not_succ"),
            icon: ToastIcon.warning);
        userProjectModelList.value = [];
      }
    } on PostgrestException catch (e) {
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  Future<Widget> imgFromUrl({required String url}) async {
    try {
      final data = await apiResInBytesRepository.getApiResInBytes(url: url);
      if (data.uint8list != null) {
        return Image.memory(
          data.uint8list!,
          fit: BoxFit.cover,
        );
      } else {
        toast(
            title: Utils.getString("img_data_fetch_not_succ"),
            icon: ToastIcon.warning);
        return const Icon(Icons.image);
      }
    } catch (e) {
      toast(title: e.toString(), icon: ToastIcon.error);
      return const Icon(Icons.image);
    }
  }

  void toggleIsOpenProjectDescription(int index) {
    userProjectModelList[index].isOpenProjectDescription =
        !userProjectModelList[index].isOpenProjectDescription;

    userProjectModelList.refresh();
  }

  void toggleIsProjectItemHovering(int index) {
    userProjectModelList[index].isProjectItemHovering =
        !userProjectModelList[index].isProjectItemHovering;

    userProjectModelList.refresh();
  }

  void goToSocialMedia(String? url) async {
    if (url != null && url.isNotEmpty) {
      final finalUrl = Uri.parse(url);
      if (!await launchUrl(finalUrl)) {
        toast(title: "Get Some Error", icon: ToastIcon.error);
      }
    } else {
      toast(title: "This project is not hosted yet", icon: ToastIcon.info);
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri finalUrl = Uri(scheme: "tel", path: phoneNumber);
    if (!await launchUrl(finalUrl)) {
      toast(
          title: "Phone call not happen",
          subTitle: "Check your system settings",
          icon: ToastIcon.info);
    }
    return;
  }

  Future<void> sentMail(String email) async {
    final Uri finalUrl = Uri(
      scheme: "mailto",
      path: email,
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
    formKey.currentState!.reset();

    return;
  }

  @override
  void onClose() {
    nameController.dispose();
    mailPhoneController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
