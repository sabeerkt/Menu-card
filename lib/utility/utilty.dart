

import 'package:image_picker/image_picker.dart';
//camera and gallewrybimage taking
class ImageUtils {
  static Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: source);
    return picked;
  }
}


