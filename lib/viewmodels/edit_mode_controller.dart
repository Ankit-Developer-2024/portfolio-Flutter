import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:portfolio/core/app/componetns/universal_toast_ui.dart';
import 'package:portfolio/core/enum/app_enum.dart';
import 'package:portfolio/data/data_sources/user_data_sources.dart';
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
import 'package:portfolio/utils/utilty/user_file_picker.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class EditModeController extends GetxController {
  RxDouble maxWidth = Get.size.width.obs;
  RxBool isApiLoderShow = false.obs;

  final HomeController homeController = Get.find<HomeController>();
  final ApiResInBytesRepository apiResInBytesRepository =
      ApiResInBytesRepository();

  UserRepository userRepository = UserRepository();
  UserWhatIDoRepository userWhatIDoRepository = UserWhatIDoRepository();
  UserExperienceRepository userExperienceRepository =
      UserExperienceRepository();
  UserSkillRepository userSkillRepository = UserSkillRepository();
  UserProjectRepository userProjectRepository = UserProjectRepository();

  TextEditingController userNameController = TextEditingController();
  TextEditingController userTechStackController = TextEditingController();
  TextEditingController userLinkInUrlController = TextEditingController();
  TextEditingController userGithubUrlController = TextEditingController();
  TextEditingController userPhoneNumberController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userLocationController = TextEditingController();
  TextEditingController userLocationUrlController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var userImage = Rxn<Uint8List>();
  var userResume = Rxn<Uint8List>();
  RxBool isUserImageRequired = false.obs;
  RxBool isUserResumeRequired = false.obs;
  var pdfController = Rxn<PdfController>();
  Rxn<UserModel> userModel = Rxn<UserModel>();

  //home dialogboc
  final GlobalKey<FormState> formHomeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formHomeAboutMeKey = GlobalKey<FormState>();

  TextEditingController aboutMeDescController = TextEditingController();
  TextEditingController whatIDoTitleController = TextEditingController();
  TextEditingController whatIDoTitleDescController = TextEditingController();
  TextEditingController whatIDoTitleDescHighLightWordsController =
      TextEditingController();

  var whatIDoTitleImage = Rxn<Uint8List>();
  Rxn<UserWhatIDoModel> userWhatIDoModel = Rxn<UserWhatIDoModel>();

  //experience dialogbox
  TextEditingController tectStackInCompanyController = TextEditingController();
  TextEditingController designationInCompanyController =
      TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyLocationController = TextEditingController();
  TextEditingController yourExperiencePoint1Controller =
      TextEditingController();
  TextEditingController yourExperiencePoint2Controller =
      TextEditingController();
  TextEditingController yourExperiencePoint3Controller =
      TextEditingController();

  final GlobalKey<FormState> formExperienceKey = GlobalKey<FormState>();
  Rxn<UserExperienceModel> userExperienceModel = Rxn<UserExperienceModel>();

  RxBool currWorking = false.obs;
  RxBool bothDatesRequired = false.obs;
  RxBool startDateRequired = false.obs;
  RxBool isEndDateNotPickCorrect = false.obs;

  List<String> month = [
    'Month',
    'Jan',
    'Feb',
    'Mar',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];
  Rx<String> startSelectMonth = "Month".obs;
  Rx<String> endSelectMonth = "Month".obs;

  Rx<String> startSelectYear = 'Year'.obs;
  Rx<String> endSelectYear = 'Year'.obs;
  List<String> year = List.generate(50, (index) {
    if (index == 0) {
      return 'Year';
    } else {
      return (DateTime.now().year - index).toString();
    }
  });

  //skill dialogbox
  final GlobalKey<FormState> formSkillKey = GlobalKey<FormState>();

  TextEditingController skillNameController = TextEditingController();
  var skillImage = Rxn<Uint8List>();
  RxBool isSkillImageRequired = false.obs;
  Rxn<UserSkillModel> userSkillModel = Rxn<UserSkillModel>();

  //project dialogbox
  final GlobalKey<FormState> formProjectKey = GlobalKey<FormState>();

  TextEditingController projectNameController = TextEditingController();
  TextEditingController developmentFieldsController = TextEditingController();
  TextEditingController projectTechStackController = TextEditingController();
  TextEditingController projectUrlController = TextEditingController();
  TextEditingController projectDescriptionPoint1Controller =
      TextEditingController();
  TextEditingController projectDescriptionPoint2Controller =
      TextEditingController();
  TextEditingController projectDescriptionPoint3Controller =
      TextEditingController();
  RxList<Uint8List> projectImagesList = <Uint8List>[].obs;
  RxBool projectMinImagRequired = false.obs;
  RxBool projectMaxImagRequired = false.obs;

  Rxn<UserProjectModel> userProjectModel = Rxn<UserProjectModel>();

  void getImage() async {
    Uint8List? image = await UserFilePicker.pickImage();

    if (image != null) {
      isUserImageRequired.value = false;
      userImage.value = image;
    }
  }

  void getResume() async {
    Uint8List? resume = await UserFilePicker.pickPdfFile();
    pdfController.value?.dispose();
    pdfController.value = null;
    pdfController.refresh();
    if (resume != null) {
      isUserResumeRequired.value = false;
      userResume.value = resume;
      Future.delayed(const Duration(milliseconds: 100), () {
        pdfController.value =
            PdfController(document: PdfDocument.openData(userResume.value!));
        pdfController.refresh(); // Ensure refresh after assignment
      });
    }
  }

  void uploadUserData() async {
    if (formKey.currentState!.validate() &&
        userImage.value != null &&
        userResume.value != null) {
      isUserResumeRequired.value = false;
      isUserImageRequired.value = false;
      try {
        isApiLoderShow.value = true;
        userModel.value = await userRepository.uploadUserData(
          userName: userNameController.text,
          techStack: userTechStackController.text,
          linkedUrl: userLinkInUrlController.text,
          githubUrl: userGithubUrlController.text,
          locationUrl: userLocationUrlController.text,
          userImage: userImage.value!,
          userResume: userResume.value!,
          phoneNumber: userPhoneNumberController.text,
          email: userEmailController.text,
          location: userLocationController.text,
        );

        isApiLoderShow.value = false;

        if (userModel.value != null) {
          homeController.userModel.value = userModel.value;
          Get.back();
          toast(
              title: Utils.getString("info_upload_succ"),
              icon: ToastIcon.success);
        } else {
          Get.back();
          toast(
              title: Utils.getString("info_upload_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      if (userImage.value == null) {
        isUserImageRequired.value = true;
      }
      if (userResume.value == null) {
        isUserResumeRequired.value = true;
      }
    }
  }

  void updateUserData() async {
    if (formKey.currentState!.validate() &&
        userImage.value != null &&
        userResume.value != null) {
      isUserResumeRequired.value = false;
      isUserImageRequired.value = false;
      try {
        isApiLoderShow.value = true;
        if (userModel.value != null) {
          userModel.value = await userRepository.updateUserData(
            userId: userModel.value!.id,
            userName: userNameController.text,
            techStack: userTechStackController.text,
            linkedUrl: userLinkInUrlController.text,
            githubUrl: userGithubUrlController.text,
            locationUrl: userLocationUrlController.text,
            userImage: userImage.value!,
            userResume: userResume.value!,
            phoneNumber: userPhoneNumberController.text,
            email: userEmailController.text,
            location: userLocationController.text,
            imageUrl: userModel.value!.userImageUrl,
            resumeUrl: userModel.value!.userResumeUrl,
          );
        }
        isApiLoderShow.value = false;

        if (userModel.value != null) {
          homeController.userModel.value = userModel.value;
          Get.back();
          toast(
              title: Utils.getString("info_update_succ"),
              icon: ToastIcon.success);
        } else {
          Get.back();
          toast(
              title: Utils.getString("info_update_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      if (userImage.value == null) {
        isUserImageRequired.value = true;
      }
      if (userResume.value == null) {
        isUserResumeRequired.value = true;
      }
    }
  }

  void initializeEditUserFormData(UserModel user) {
    userNameController.text = user.userName;
    userTechStackController.text = user.techStack;
    userLinkInUrlController.text = user.linkedUrl;
    userGithubUrlController.text = user.githubUrl;
    userLocationUrlController.text = user.locationUrl ?? '';
    userPhoneNumberController.text = user.phoneNumber;
    userEmailController.text = user.email;
    userLocationController.text = user.location;
    insilizePdfData(user.userResumeUrl);
    insilizeImageData(user.userImageUrl);

    userModel.value = user;
  }

  void insilizePdfData(String resumeUrl) async {
    final data = await apiResInBytesRepository.getApiResInBytes(url: resumeUrl);
    if (data.uint8list != null) {
      userResume.value = null;
      userResume.value = data.uint8list;
      pdfController.value?.dispose();
      pdfController.value = null;
      pdfController.refresh();
      Future.delayed(const Duration(milliseconds: 100), () {
        pdfController.value =
            PdfController(document: PdfDocument.openData(userResume.value!));
        pdfController.refresh(); // Ensure refresh after assignment
      });
    } else {
      userResume.value = null;
    }
  }

  void insilizeImageData(String imgUrl) async {
    final data = await apiResInBytesRepository.getApiResInBytes(url: imgUrl);
    if (data.uint8list != null) {
      userImage.value = null;
      userImage.value = data.uint8list;
    } else {
      userImage.value = null;
    }
  }

  void uploadHomeAboutMeData() async {
    if (formHomeAboutMeKey.currentState!.validate() &&
        userModel.value != null) {
      try {
        isApiLoderShow.value = true;
        userModel.value = await userRepository.updateAboutMeSection(
            aboutMe: aboutMeDescController.text, user: userModel.value!);

        isApiLoderShow.value = false;
        if (userModel.value != null) {
          homeController.userModel.value = userModel.value;
          Get.back();
          toast(
              title: Utils.getString("about_me_update_succ"),
              icon: ToastIcon.success);
        } else {
          Get.back();
          toast(
              title: Utils.getString("about_me_update_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      toast(
          title: Utils.getString("user_not_create_yet"), icon: ToastIcon.error);
    }
  }

  //home dialog

  void clearAllWhatIdOFormData() {
    userWhatIDoModel.value = null;
    tectStackInCompanyController.clear();
    whatIDoTitleController.clear();
    whatIDoTitleDescController.clear();
    whatIDoTitleDescHighLightWordsController.clear();

    whatIDoTitleImage.value = null;
  }

  void initializeEditWhatIDoFormData(UserWhatIDoModel whatIdo) async {
    if (whatIdo.imgUrl != null) {
      final data =
          await apiResInBytesRepository.getApiResInBytes(url: whatIdo.imgUrl!);
      if (data.uint8list != null) {
        whatIDoTitleImage.value = data.uint8list;
      } else {
        whatIDoTitleImage.value = null;
      }
    }

    if (whatIdo.descHighLightWord != null &&
        whatIdo.descHighLightWord!.isNotEmpty) {
      whatIDoTitleDescHighLightWordsController.text =
          whatIdo.descHighLightWord!.join(",");
    }

    whatIDoTitleController.text = whatIdo.techStackTitle;
    whatIDoTitleDescController.text = whatIdo.techStackDesc;

    userWhatIDoModel.value = whatIdo;
  }

  void whatIDoTitlePickImage() async {
    Uint8List? image = await UserFilePicker.pickImage();

    if (image != null) {
      whatIDoTitleImage.value = image;
    }
  }

  void uploadHomeWhatIdoData() async {
    if (formHomeKey.currentState!.validate()) {
      try {
        isApiLoderShow.value = true;
        userWhatIDoModel.value = await userWhatIDoRepository.uploadWhatIDoData(
            techStackTitle: whatIDoTitleController.text,
            techStackDesc: whatIDoTitleDescController.text,
            descHighLightWords: getHighLightWord(),
            imgdata: whatIDoTitleImage.value);

        isApiLoderShow.value = false;

        if (userWhatIDoModel.value != null) {
          homeController.userWhatIDoModelList.add(userWhatIDoModel.value!);
          Get.back();
          toast(
              title: Utils.getString("tech_stack_upload_succ"),
              icon: ToastIcon.success);
        } else {
          Get.back();
          toast(
              title: Utils.getString("tech_stack_upload_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    }
  }

  void updateHomeWhatIdoData() async {
    if (formHomeKey.currentState!.validate()) {
      try {
        isApiLoderShow.value = true;
        int index = -1;
        if (userWhatIDoModel.value != null) {
          index = homeController.userWhatIDoModelList
              .indexOf(userWhatIDoModel.value);
          userWhatIDoModel.value =
              await userWhatIDoRepository.updateWhatIDoData(
                  id: userWhatIDoModel.value!.id,
                  techStackTitle: whatIDoTitleController.text,
                  techStackDesc: whatIDoTitleDescController.text,
                  descHighLightWords: getHighLightWord(),
                  techStackImgUrl: userWhatIDoModel.value!.imgUrl,
                  imgdata: whatIDoTitleImage.value);
        }
        isApiLoderShow.value = false;
        if (userWhatIDoModel.value != null && index != -1) {
          homeController.userWhatIDoModelList.removeAt(index);
          homeController.userWhatIDoModelList
              .insert(index, userWhatIDoModel.value!);
          Get.back();
          toast(
              title: Utils.getString("tech_stack_updated_succ"),
              icon: ToastIcon.success);
        } else {
          Get.back();
          toast(
              title: Utils.getString("tech_stack_updated_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    }
  }

  void deleteHomeWhatIdoData(UserWhatIDoModel whatIdo) async {
    try {
      userWhatIDoModel.value =
          await userWhatIDoRepository.deleteWhatIDoData(whatIdo: whatIdo);

      if (userWhatIDoModel.value != null) {
        homeController.userWhatIDoModelList.remove(whatIdo);
        userWhatIDoModel.value = null;
        Get.back();
        toast(
            title: Utils.getString("tech_stack_delete_succ"),
            icon: ToastIcon.success);
      } else {
        userWhatIDoModel.value = null;
        Get.back();
        toast(
            title: Utils.getString("tech_stack_delete_not_succ"),
            icon: ToastIcon.error);
      }
    } on PostgrestException catch (e) {
      isApiLoderShow.value = false;
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      isApiLoderShow.value = false;
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  getHighLightWord() {
    if (whatIDoTitleDescHighLightWordsController.text.isNotEmpty) {
      return whatIDoTitleDescHighLightWordsController.text.split(",");
    } else {
      return null;
    }
  }

  void initializeWhatIDoTextController() {
    if (userWhatIDoModel.value != null) {
      whatIDoTitleController.text = userWhatIDoModel.value!.techStackTitle;
      whatIDoTitleDescController.text = userWhatIDoModel.value!.techStackDesc;
      if (userWhatIDoModel.value?.descHighLightWord != null) {
        whatIDoTitleDescHighLightWordsController.text =
            userWhatIDoModel.value!.descHighLightWord!.join(",");
      }
    }
  }

  void initializeWhatIDoImage() async {
    if (userWhatIDoModel.value != null &&
        userWhatIDoModel.value?.imgUrl != null &&
        userWhatIDoModel.value!.imgUrl!.isNotEmpty) {
      final response =
          await http.get(Uri.parse(userWhatIDoModel.value!.imgUrl!));
      if (response.statusCode == 200) {
        whatIDoTitleImage.value = null;
        whatIDoTitleImage.value = response.bodyBytes;
      }
    }
  }

  // experience dialog

  void clearAllExperienceFormData() {
    userExperienceModel.value = null;
    tectStackInCompanyController.clear();
    designationInCompanyController.clear();
    companyNameController.clear();
    companyLocationController.clear();
    startSelectMonth.value = 'Month';
    startSelectYear.value = 'Year';
    endSelectMonth.value = 'Month';
    endSelectYear.value = 'Year';
    yourExperiencePoint1Controller.clear();
    yourExperiencePoint2Controller.clear();
    yourExperiencePoint3Controller.clear();

    skillImage.value = null;
  }

  void initializeEditExperienceFormData(UserExperienceModel experience) async {
    tectStackInCompanyController.text = experience.techStack;
    designationInCompanyController.text = experience.designation;
    companyNameController.text = experience.companyName;
    companyLocationController.text = experience.companyLocation;

    if (experience.startDate.isNotEmpty) {
      startSelectMonth.value = experience.startDate[0];
      startSelectYear.value = experience.startDate[1];
    } else {
      startSelectMonth.value = 'Month';
      startSelectYear.value = 'Year';
    }
    if (experience.endDate != null && experience.endDate!.isNotEmpty) {
      currWorking.value = false;
      endSelectMonth.value = experience.endDate![0];
      endSelectYear.value = experience.endDate![1];
    } else {
      currWorking.value = true;
      endSelectMonth.value = 'Month';
      endSelectYear.value = 'Year';
    }

    if (experience.experienceIncompany.isNotEmpty) {
      yourExperiencePoint1Controller.text = experience.experienceIncompany[0];
      if (experience.experienceIncompany.length >= 2) {
        yourExperiencePoint2Controller.text = experience.experienceIncompany[1];
      }
      if (experience.experienceIncompany.length >= 3) {
        yourExperiencePoint3Controller.text = experience.experienceIncompany[2];
      }
    } else {
      yourExperiencePoint1Controller.text = "";
      yourExperiencePoint2Controller.text = "";
      yourExperiencePoint3Controller.text = "";
    }

    userExperienceModel.value = experience;
  }

  bool dates() {
    if (currWorking.value) {
      if (startSelectMonth.value != 'Month' &&
          startSelectYear.value != 'Year') {
        bothDatesRequired.value = false;
        startDateRequired.value = false;
        isEndDateNotPickCorrect.value = false;
        return true;
      } else {
        bothDatesRequired.value = false;
        startDateRequired.value = true;
        isEndDateNotPickCorrect.value = false;
        return false;
      }
    } else {
      if (startSelectMonth.value != 'Month' &&
          startSelectYear.value != 'Year' &&
          endSelectMonth.value != 'Month' &&
          endSelectYear.value != 'Year') {
        if (int.parse(endSelectYear.value) >=
            int.parse(startSelectYear.value)) {
          bothDatesRequired.value = false;
          startDateRequired.value = false;
          isEndDateNotPickCorrect.value = false;
          return true;
        } else {
          bothDatesRequired.value = false;
          startDateRequired.value = false;
          isEndDateNotPickCorrect.value = true;
          return false;
        }
      } else {
        bothDatesRequired.value = true;
        startDateRequired.value = false;
        isEndDateNotPickCorrect.value = false;
        return false;
      }
    }
  }

  void uploadExperienceData() async {
    if (formExperienceKey.currentState!.validate() && dates()) {
      bothDatesRequired.value = false;
      startDateRequired.value = false;

      try {
        isApiLoderShow.value = true;
        userExperienceModel.value =
            await userExperienceRepository.uploadExperienceData(
          techStack: tectStackInCompanyController.text,
          designation: designationInCompanyController.text,
          startDate: pickStartDate(),
          endDate: pickEndDate(),
          companyName: companyNameController.text,
          companyLocation: companyLocationController.text,
          experienceIncompany: pickExperience(),
        );

        isApiLoderShow.value = false;

        if (userExperienceModel.value != null) {
          homeController.userExperienceModelList
              .add(userExperienceModel.value!);
          Get.back();
          toast(
              title: Utils.getString("experience_upload_succ"),
              icon: ToastIcon.success);
        } else {
          Get.back();
          toast(
              title: Utils.getString("experience_upload_not_succ"),
              icon: ToastIcon.success);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      dates();
    }
  }

  void updateExperienceData() async {
    if (formExperienceKey.currentState!.validate() && dates()) {
      try {
        isApiLoderShow.value = true;
        int index = -1;
        if (userExperienceModel.value != null) {
          index = homeController.userExperienceModelList
              .indexOf(userExperienceModel.value!);
          userExperienceModel.value =
              await userExperienceRepository.updateExperienceData(
                  id: userExperienceModel.value!.id,
                  techStack: tectStackInCompanyController.text,
                  designation: designationInCompanyController.text,
                  startDate: pickStartDate(),
                  endDate: pickEndDate(),
                  companyName: companyNameController.text,
                  companyLocation: companyLocationController.text,
                  experienceIncompany: pickExperience());
        }
        isApiLoderShow.value = false;

        if (userExperienceModel.value != null && index != -1) {
          homeController.userExperienceModelList.removeAt(index);
          homeController.userExperienceModelList
              .insert(index, userExperienceModel.value!);
          Get.back();
          toast(
              title: Utils.getString("experience_updated_succ"),
              icon: ToastIcon.success);
        } else {
          Get.back();
          toast(
              title: Utils.getString("experience_updated_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      dates();
    }
  }

  void deleteExperienceData(UserExperienceModel experience) async {
    try {
      userExperienceModel.value = await userExperienceRepository
          .deleteExperienceData(experienceModel: experience);

      if (userExperienceModel.value != null) {
        homeController.userExperienceModelList.remove(experience);
        userExperienceModel.value = null;
        Get.back();
        toast(
            title: Utils.getString("experience_delete_succ"),
            icon: ToastIcon.success);
      } else {
        userExperienceModel.value = null;
        Get.back();
        toast(
            title: Utils.getString("experience_delete_not_succ"),
            icon: ToastIcon.error);
      }
    } on PostgrestException catch (e) {
      isApiLoderShow.value = false;
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      isApiLoderShow.value = false;
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  List<String> pickStartDate() {
    if (startSelectMonth.value != 'Month' && startSelectYear.value != 'Year') {
      return [startSelectMonth.value, startSelectYear.value];
    } else {
      return [];
    }
  }

  List<String>? pickEndDate() {
    if (endSelectMonth.value != 'Month' && endSelectYear.value != 'Year') {
      return [endSelectMonth.value, endSelectYear.value];
    } else {
      return null;
    }
  }

  List<String> pickExperience() {
    List<String> experiencePoint = [];
    if (yourExperiencePoint1Controller.text.isNotEmpty) {
      experiencePoint.add(yourExperiencePoint1Controller.text);
    }
    if (yourExperiencePoint2Controller.text.isNotEmpty) {
      experiencePoint.add(yourExperiencePoint2Controller.text);
    }
    if (yourExperiencePoint3Controller.text.isNotEmpty) {
      experiencePoint.add(yourExperiencePoint3Controller.text);
    }
    return experiencePoint;
  }

  //skill dialog

  void clearAllSkillFormData() {
    userSkillModel.value = null;
    skillNameController.clear();
    skillImage.value = null;
  }

  void initializeEditSkillFormData(UserSkillModel skill) async {
    final data =
        await apiResInBytesRepository.getApiResInBytes(url: skill.skillImgUrl);
    if (data.uint8list != null) {
      skillImage.value = data.uint8list;
    } else {
      skillImage.value = null;
    }
    skillNameController.text = skill.skillName;
    userSkillModel.value = skill;
  }

  void skillPickImage() async {
    Uint8List? image = await UserFilePicker.pickImage();

    if (image != null) {
      skillImage.value = image;
      isSkillImageRequired.value = false;
    }
  }

  void uploadSkillData() async {
    if (formSkillKey.currentState!.validate() && skillImage.value != null) {
      try {
        isApiLoderShow.value = true;

        userSkillModel.value = await userSkillRepository.uploadUserSkill(
            skillName: skillNameController.text, imgData: skillImage.value!);

        isApiLoderShow.value = false;

        if (userSkillModel.value != null) {
          toast(
              title: Utils.getString("skill_upload_succ"),
              icon: ToastIcon.success);
          homeController.userSkillModelList.add(userSkillModel.value!);
          Get.back();
        } else {
          Get.back();
          toast(
              title: Utils.getString("skill_upload_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      skillImage.value == null
          ? isSkillImageRequired.value = true
          : isSkillImageRequired.value = false;
    }
  }

  void upldateSkillData() async {
    if (formSkillKey.currentState!.validate() && skillImage.value != null) {
      try {
        int index = -1;
        isApiLoderShow.value = true;
        if (userSkillModel.value != null) {
          index =
              homeController.userSkillModelList.indexOf(userSkillModel.value!);
          userSkillModel.value = await userSkillRepository.updateUserSkill(
              id: userSkillModel.value!.id,
              skillName: skillNameController.text,
              skillImgUrl: userSkillModel.value!.skillImgUrl,
              imgData: skillImage.value!);

          isApiLoderShow.value = false;
        }

        if (userSkillModel.value != null && index != -1) {
          homeController.userSkillModelList.removeAt(index);
          homeController.userSkillModelList
              .insert(index, userSkillModel.value!);
          Get.back();
          toast(
              title: Utils.getString("skill_updated_succ"),
              icon: ToastIcon.success);
        } else {
          Get.back();
          toast(
              title: Utils.getString("skill_updated_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      skillImage.value == null
          ? isSkillImageRequired.value = true
          : isSkillImageRequired.value = false;
    }
  }

  void deleteSkillData(UserSkillModel skillModel) async {
    try {
      isApiLoderShow.value = true;
      userSkillModel.value = await userSkillRepository.deleteUserSkill(
        skillModel: skillModel,
      );

      isApiLoderShow.value = false;
      if (userSkillModel.value != null) {
        toast(
            title: Utils.getString("skill_delete_succ"),
            icon: ToastIcon.success);
        homeController.userSkillModelList.remove(skillModel);
        userSkillModel.value = null;
        Get.back();
      } else {
        userSkillModel.value = null;
        toast(
            title: Utils.getString("skill_delete_not_succ"),
            icon: ToastIcon.error);
        Get.back();
      }
    } on PostgrestException catch (e) {
      isApiLoderShow.value = false;
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      isApiLoderShow.value = false;
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  //home dialog
  void projectPickImages() async {
    List<Uint8List>? imagesList =
        await UserFilePicker.pickImage(isMultileAllow: true);

    if (imagesList != null && imagesList.isNotEmpty) {
      projectImagesList.assignAll([...projectImagesList, ...imagesList]);

      projectImageRequiredValidation();
    }
  }

  void clearAllProjectFormData() {
    userProjectModel.value = null;
    projectNameController.clear();
    developmentFieldsController.clear();
    projectTechStackController.clear();
    projectUrlController.clear();
    projectDescriptionPoint1Controller.clear();
    projectDescriptionPoint2Controller.clear();
    projectDescriptionPoint3Controller.clear();
    projectImagesList.clear();
  }

  Future<void> initializeEditProjectFormData(UserProjectModel project) async {
    projectNameController.text = project.projectName;
    developmentFieldsController.text = project.projectDevelopmentField;
    projectTechStackController.text = project.projectTechnologyStack;
    projectUrlController.text = project.projectUrl ?? "";

    if (project.projectDescription.isNotEmpty) {
      projectDescriptionPoint1Controller.text = project.projectDescription[0];
      if (project.projectDescription.length >= 2) {
        projectDescriptionPoint2Controller.text = project.projectDescription[1];
      }
      if (project.projectDescription.length >= 3) {
        projectDescriptionPoint3Controller.text = project.projectDescription[2];
      }
    } else {
      projectDescriptionPoint1Controller.text = "";
      projectDescriptionPoint2Controller.text = "";
      projectDescriptionPoint3Controller.text = "";
    }

    projectImagesList.clear();

    for (var i = 0; i < project.projectImgUrls.length; i++) {
      final data = await apiResInBytesRepository.getApiResInBytes(
          url: project.projectImgUrls[i]);
      if (data.uint8list != null) {
        projectImagesList.add(data.uint8list!);
      }
    }

    userProjectModel.value = project;
  }

  void projectImageRequiredValidation() {
    if (projectImagesList.length < 4) {
      projectMinImagRequired.value = true;
      projectMaxImagRequired.value = false;
    } else if (projectImagesList.length >= 4 &&
        projectImagesList.length <= 10) {
      projectMaxImagRequired.value = false;
      projectMinImagRequired.value = false;
    } else {
      projectMaxImagRequired.value = true;
      projectMinImagRequired.value = false;
    }
  }

  void uploadProjectData() async {
    if (formProjectKey.currentState!.validate() &&
        (projectImagesList.length >= 4 && projectImagesList.length <= 10)) {
      try {
        isApiLoderShow.value = true;
        userProjectModel.value = await userProjectRepository.uploadUserProject(
            projectName: projectNameController.text,
            projectDevelopmentField: developmentFieldsController.text,
            projectTechnologyStack: projectTechStackController.text,
            projectImgData: projectImagesList,
            projectURL: projectUrlController.text,
            projectDescription: projectDescriptionPoint());

        isApiLoderShow.value = false;
        if (userProjectModel.value != null) {
          homeController.userProjectModelList.add(userProjectModel.value!);
          Get.back();
          toast(
              title: Utils.getString("project_upload_succ"),
              icon: ToastIcon.success);
          //img get from imgurl -code
        } else {
          Get.back();
          toast(
              title: Utils.getString("project_upload_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      if (projectImagesList.length < 4) {
        projectMinImagRequired.value = true;
      } else if (projectImagesList.length > 10) {
        projectMaxImagRequired.value = true;
      }
    }
  }

  void updateProjectData() async {
    if (formProjectKey.currentState!.validate() &&
        (projectImagesList.length >= 4 && projectImagesList.length <= 10)) {
      try {
        isApiLoderShow.value = true;
        int index = -1;
        if (userProjectModel.value != null) {
          index = homeController.userProjectModelList
              .indexOf(userProjectModel.value);
          userProjectModel.value =
              await userProjectRepository.updateUserProject(
                  id: userProjectModel.value!.id,
                  projectName: projectNameController.text,
                  projectDevelopmentField: developmentFieldsController.text,
                  projectTechnologyStack: projectTechStackController.text,
                  projectImgUrls: userProjectModel.value!.projectImgUrls,
                  projectURL: projectUrlController.text,
                  projectImgData: projectImagesList,
                  projectDescription: projectDescriptionPoint());
        }
        isApiLoderShow.value = false;
        if (userProjectModel.value != null && index != -1) {
          homeController.userProjectModelList.removeAt(index);
          homeController.userProjectModelList
              .insert(index, userProjectModel.value!);
          Get.back();
          toast(
              title: Utils.getString("project_updated_succ"),
              icon: ToastIcon.success);
          //img get from imgurl -code
        } else {
          Get.back();
          toast(
              title: Utils.getString("project_updated_not_succ"),
              icon: ToastIcon.error);
        }
      } on PostgrestException catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.message.toString(), icon: ToastIcon.warning);
      } catch (e) {
        isApiLoderShow.value = false;
        toast(title: e.toString(), icon: ToastIcon.error);
      }
    } else {
      if (projectImagesList.length < 4) {
        projectMinImagRequired.value = true;
      } else if (projectImagesList.length > 10) {
        projectMaxImagRequired.value = true;
      }
    }
  }

  void deleteProjectData(UserProjectModel project) async {
    try {
      int index = homeController.userProjectModelList.indexOf(project);
      userProjectModel.value =
          await userProjectRepository.deleteUserProject(projectModel: project);

      if (userProjectModel.value != null && index >= 0) {
        homeController.userProjectModelList.removeAt(index);
        userProjectModel.value = null;
        Get.back();
        toast(
            title: Utils.getString("project_delete_succ"),
            icon: ToastIcon.success);
      } else {
        userProjectModel.value = null;
        Get.back();
        toast(
            title: Utils.getString("project_delete_not_succ"),
            icon: ToastIcon.error);
      }
    } on PostgrestException catch (e) {
      isApiLoderShow.value = false;
      toast(title: e.message.toString(), icon: ToastIcon.warning);
    } catch (e) {
      isApiLoderShow.value = false;
      toast(title: e.toString(), icon: ToastIcon.error);
    }
  }

  List<String> projectDescriptionPoint() {
    List<String> projectPoint = [];
    if (projectDescriptionPoint1Controller.text.isNotEmpty) {
      projectPoint.add(projectDescriptionPoint1Controller.text);
    }
    if (projectDescriptionPoint2Controller.text.isNotEmpty) {
      projectPoint.add(projectDescriptionPoint2Controller.text);
    }
    if (projectDescriptionPoint3Controller.text.isNotEmpty) {
      projectPoint.add(projectDescriptionPoint3Controller.text);
    }
    return projectPoint;
  }

  @override
  void onInit() {
    super.onInit();
    UserDataSources().getUserData();
  }

  @override
  void onClose() {
    userNameController.dispose();
    userEmailController.dispose();
    userGithubUrlController.dispose();
    userLinkInUrlController.dispose();
    userPhoneNumberController.dispose();
    userLocationController.dispose();
    userLocationUrlController.dispose();
    userTechStackController.dispose();

    aboutMeDescController.dispose();
    whatIDoTitleController.dispose();
    whatIDoTitleDescController.dispose();

    tectStackInCompanyController.dispose();
    designationInCompanyController.dispose();
    companyNameController.dispose();
    companyLocationController.dispose();
    yourExperiencePoint1Controller.dispose();
    yourExperiencePoint2Controller.dispose();
    yourExperiencePoint3Controller.dispose();

    projectNameController.dispose();
    developmentFieldsController.dispose();
    projectTechStackController.dispose();
    projectDescriptionPoint1Controller.dispose();
    projectDescriptionPoint2Controller.dispose();
    projectDescriptionPoint3Controller.dispose();
    super.onClose();
  }
}
