import 'package:get/get.dart';

class Utils {
  static String getString(String text) {
    return text.tr;
  }

  static String getIcons(String icon) {
    return "/icons/$icon";
  }

  static String getImages(String image) {
    return "/images/$image";
  }

  static String getImagesApi(String image) {
    return "/images/api/$image";
  }

  static String getImagesEcom(String image) {
    return "/images/ecom/$image";
  }

  static String getImagesPortfolio(String image) {
    return "/images/portfolio_img/$image";
  }
}
