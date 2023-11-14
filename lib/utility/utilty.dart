
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/Model/model.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: source);
    return picked;
  }
}


