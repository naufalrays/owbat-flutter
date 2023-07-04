import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannerProvider with ChangeNotifier {
  Future<String> pickImage({required bool isCamera}) async {
    final picker = ImagePicker();

    String path = '';

    try {
      final getImage = await picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);
      if (getImage != null) {
        path = getImage.path;
      } else {
        path = '';
      }
    } catch (e) {
      e.toString();
    }
    return path;
  }
}
