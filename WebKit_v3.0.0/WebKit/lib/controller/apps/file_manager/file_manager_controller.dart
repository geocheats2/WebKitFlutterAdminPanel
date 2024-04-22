import 'package:file_picker/file_picker.dart';
import 'package:webkit/controller/my_controller.dart';

class FileManagerController extends MyController {
  List<PlatformFile> files = [];

  Future<void> pickFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result?.files[0] != null) {
      files.add(result!.files[0]);
    }
    update();
  }
}
