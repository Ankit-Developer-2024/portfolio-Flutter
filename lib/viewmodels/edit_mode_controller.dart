import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:portfolio/utils/utilty/user_file_picker.dart';

class EditModeController extends GetxController {
  RxDouble maxWidth = Get.size.width.obs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController userTecStackController = TextEditingController();
  TextEditingController userLinkInUrlController = TextEditingController();
  TextEditingController userGithubUrlController = TextEditingController();
  TextEditingController userPhoneNumberController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userLocationController = TextEditingController();
  TextEditingController userLocationUrlController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var userImage = Rxn<Uint8List>();
  var userResume = Rxn<Uint8List>();
  PdfController? pdfController;

  //home dialogboc
  TextEditingController aboutMeDescController = TextEditingController();
  TextEditingController whatIDoTitleController = TextEditingController();
  TextEditingController whatIDoTitleDescController = TextEditingController();
  var whatIDoTitleImage = Rxn<Uint8List>();

  final GlobalKey<FormState> formHomeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formHomeAnoutMeKey = GlobalKey<FormState>();

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

  RxBool currWorking = false.obs;
  RxBool bothDatesRequired = false.obs;
  RxBool startDateRequired = false.obs;

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

  //project dialogbox
  final GlobalKey<FormState> formProjectKey = GlobalKey<FormState>();

  TextEditingController projectNameController = TextEditingController();
  TextEditingController developmentFieldsController = TextEditingController();
  TextEditingController techStackController = TextEditingController();
  RxList<Uint8List?> projectImagesList = <Uint8List?>[].obs;
  RxBool projectMinImagRequired = false.obs;
  RxBool projectMaxImagRequired = false.obs;

  void getImage() async {
    Uint8List? image = await UserFilePicker.pickImage();

    if (image != null) {
      userImage.value = image;
    }
  }

  void getResume() async {
    Uint8List? resume = await UserFilePicker.pickPdfFile();

    if (resume != null) {
      userResume.value = resume;
      pdfController = PdfController(document: PdfDocument.openData(resume));
    }
  }

  void uploadUserData() {
    print("object2");
    if (formKey.currentState!.validate()) {
      print("object");
      print(userNameController.text);
    } else {
      print("object2");
    }
  }

  //home dialog
  void whatIDoTitlePickImage() async {
    Uint8List? image = await UserFilePicker.pickImage();

    if (image != null) {
      whatIDoTitleImage.value = image;
    }
  }

  void uploadHomeData() {
    if (formHomeKey.currentState!.validate()) {
      print(whatIDoTitleController.text);
    }
  }

  void uploadHomeAboutMeData() {
    if (formHomeAnoutMeKey.currentState!.validate()) {
      print(aboutMeDescController.text);
    }
  }

  // experience dialog
  void uploadExperienceData() {
    bool dates() {
      if (currWorking.value) {
        if (startSelectMonth.value != 'Month' &&
            startSelectYear.value != 'Year') {
          bothDatesRequired.value = false;
          startDateRequired.value = false;
          return true;
        } else {
          bothDatesRequired.value = false;
          startDateRequired.value = true;
          return false;
        }
      } else {
        if (startSelectMonth.value != 'Month' &&
            startSelectYear.value != 'Year' &&
            endSelectMonth.value != 'Month' &&
            endSelectYear.value != 'Year') {
          bothDatesRequired.value = false;
          startDateRequired.value = false;
          return true;
        } else {
          bothDatesRequired.value = true;
          startDateRequired.value = false;
          return false;
        }
      }
    }

    if (formExperienceKey.currentState!.validate() && dates()) {
      // bothDatesRequired.value = false;
      // startDateRequired.value = false;
      print(whatIDoTitleController.text);
    } else {
      dates();
    }
  }

  //skill dialog
  void skillPickImage() async {
    Uint8List? image = await UserFilePicker.pickImage();

    if (image != null) {
      skillImage.value = image;
      isSkillImageRequired.value = false;
    }
  }

  void uploadSkillData() {
    if (formSkillKey.currentState!.validate() && skillImage.value != null) {
      print(skillNameController.text);
    } else {
      skillImage.value == null
          ? isSkillImageRequired.value = true
          : isSkillImageRequired.value = false;
    }
  }

  //home dialog
  void projectPickImages() async {
    List<Uint8List?> imagesList =
        await UserFilePicker.pickImage(isMultileAllow: true);

    if (imagesList.isNotEmpty) {
      projectImagesList.assignAll([...projectImagesList, ...imagesList]);

      projectImageRequiredValidation();
    }
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

  void uploadProjectData() {
    print("object2");
    if (formProjectKey.currentState!.validate() &&
        (projectImagesList.length >= 4 && projectImagesList.length <= 10)) {
    } else {
      if (projectImagesList.length < 4) {
        projectMinImagRequired.value = true;
      } else if (projectImagesList.length > 10) {
        projectMaxImagRequired.value = true;
      }
    }
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
    userTecStackController.dispose();

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
    techStackController.dispose();
    super.onClose();
  }
}
