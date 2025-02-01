import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class UserFilePicker {
  static final FilePicker _filePicker = FilePicker.platform;

  static Future<dynamic> pickImage({bool isMultileAllow = false}) async {
    FilePickerResult? result = await _filePicker.pickFiles(
      allowMultiple: isMultileAllow,
      type: FileType.image,
    );

    if (result != null && result.files.isNotEmpty) {
      if (isMultileAllow) {
        List<Uint8List> dataList =
            result.files.map((file) => file.bytes!).toList();
        return dataList;
      } else {
        return result.files.first.bytes;
      }
    }
    return null;
  }

  static Future<Uint8List?> pickPdfFile() async {
    FilePickerResult? result = await _filePicker.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        withData: true,
        allowedExtensions: ['pdf']);

    if (result != null && result.files.single.bytes != null) {
      return result.files.single.bytes;
    }
    return null;
  }
}
