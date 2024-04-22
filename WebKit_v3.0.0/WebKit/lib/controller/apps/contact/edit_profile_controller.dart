import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_form_validator.dart';

class EditProfileController extends MyController {
  MyFormValidator validation = MyFormValidator();
  bool showPassword = false;

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }
}
