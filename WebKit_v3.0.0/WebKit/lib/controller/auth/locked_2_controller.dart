import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_form_validator.dart';
import 'package:webkit/helpers/widgets/my_validators.dart';

class Locked2Controller extends MyController {
  MyFormValidator basicValidator = MyFormValidator();

  bool showPassword = false, loading = false;

  @override
  void onInit() {
    super.onInit();

    basicValidator.addField(
      'password',
      required: true,
      label: 'Password',
      validators: [MyLengthValidator(min: 6, max: 10)],
      controller: TextEditingController(),
    );
  }

  void onShowPassword() {
    showPassword = !showPassword;
    update();
  }

  // Services
  Future<void> onLock() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      await Future.delayed(Duration(seconds: 1));
      Get.toNamed('/dashboard');

      loading = false;
      update();
    }
  }
}
