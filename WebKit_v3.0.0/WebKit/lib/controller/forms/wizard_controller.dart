import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/extensions/date_time_extention.dart';
import 'package:webkit/helpers/widgets/my_form_validator.dart';
import 'package:webkit/helpers/widgets/my_validators.dart';

class WizardController extends MyController {
  // int selectedTab = 0;
  // bool showPassword = false,
  //     checked = true,
  //     enableValidation = true,
  //     loading = false;
  // DateTime? selectedDateTime;
  // PageController pageController = PageController();
  //
  // MyFormValidator step1Validator = MyFormValidator();
  // MyFormValidator step2Validator = MyFormValidator();
  //
  // WizardController() {
  //   step1Validator.addField('username',
  //       required: true, label: "Username", controller: TextEditingController());
  //
  //   step1Validator.addField('email',
  //       required: true,
  //       label: "Email",
  //       validators: [MyEmailValidator()],
  //       controller: TextEditingController());
  //
  //   step1Validator.addField('password',
  //       required: true,
  //       label: "Password",
  //       validators: [MyLengthValidator(min: 6, max: 10)],
  //       controller: TextEditingController());
  //
  //   step2Validator.addField('first_name',
  //       required: true,
  //       label: "First name",
  //       controller: TextEditingController());
  //
  //   step2Validator.addField('last_name',
  //       required: true,
  //       label: "Last name",
  //       controller: TextEditingController());
  //
  //   step2Validator.addField('phone_number',
  //       required: true,
  //       label: "Phone number",
  //       validators: [MyLengthValidator(required: true, min: 10, max: 12)],
  //       controller: TextEditingController());
  // }
  //
  // void onChangedValidation(bool? validation) {
  //   enableValidation = validation ?? enableValidation;
  //   update();
  // }
  //
  // void onPrev() {
  //   changePage(selectedTab - 1);
  // }
  //
  // void onChangedChecked(bool? value) {
  //   checked = value ?? checked;
  //   update();
  // }
  //
  // void onChangeShowPassword() {
  //   showPassword = !showPassword;
  //   update();
  // }
  //
  // void changePage(int page) {
  //   pageController.animateToPage(page,
  //       duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  // }
  //
  // void onNext() {
  //   if (enableValidation) {
  //     if (selectedTab == 0 && step1Validator.validateForm()) {
  //       changePage(selectedTab + 1);
  //     }
  //     if (selectedTab == 1 && step2Validator.validateForm()) {
  //       changePage(selectedTab + 1);
  //     }
  //   } else {
  //     changePage(selectedTab + 1);
  //   }
  // }
  //
  // Future<void> pickDateTime() async {
  //   final DateTime? pickedDate = await showDatePicker(
  //       context: Get.context!,
  //       initialDate: selectedDateTime ?? DateTime.now(),
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (pickedDate != null) {
  //     final TimeOfDay? pickedTime = await showTimePicker(
  //         context: Get.context!,
  //         initialTime: selectedDateTime?.timeOfDay ?? TimeOfDay.now());
  //     if (pickedTime != null) {
  //       selectedDateTime = pickedDate.applied(pickedTime);
  //       update();
  //     }
  //   }
  // }
  int selectedTab = 0;

  PageController pageController = PageController();

  MyFormValidator step1Validator = MyFormValidator();
  MyFormValidator step2Validator = MyFormValidator();

  bool showPassword = false,
      loading = false,
      checked = true,
      enableValidation = true;
  DateTime? selectedDateTime;

  WizardController() {
    step1Validator.addField('username',
        required: true, label: "Username", controller: TextEditingController());

    step1Validator.addField('email',
        required: true,
        label: "Email",
        validators: [MyEmailValidator()],
        controller: TextEditingController());

    step1Validator.addField('password',
        required: true,
        label: "Password",
        validators: [MyLengthValidator(min: 6, max: 10)],
        controller: TextEditingController());

    step2Validator.addField('first_name',
        required: true,
        label: "First name",
        controller: TextEditingController());

    step2Validator.addField('last_name',
        required: true,
        label: "Last name",
        controller: TextEditingController());

    step2Validator.addField('phone_number',
        required: true,
        label: "Phone number",
        validators: [MyLengthValidator(required: true, min: 10, max: 12)],
        controller: TextEditingController());
  }

  @override
  void onReady() {
    super.onReady();
    pageController.jumpToPage(selectedTab);
  }

  void changePage(int page) {
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onChangedValidation(bool? validation) {
    enableValidation = validation ?? enableValidation;
    update();
  }

  void onChangePage(int page) {
    selectedTab = page;
    update();
  }

  void onNext() {
    if (enableValidation) {
      if (selectedTab == 0 && step1Validator.validateForm()) {
        changePage(selectedTab + 1);
      }
      if (selectedTab == 1 && step2Validator.validateForm()) {
        changePage(selectedTab + 1);
      }
    } else {
      changePage(selectedTab + 1);
    }
  }

  void onPrev() {
    changePage(selectedTab - 1);
  }

  void onFinish() {}

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onChangedChecked(bool? value) {
    checked = value ?? checked;
    update();
  }

  Future<void> pickDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDateTime ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
          context: Get.context!,
          initialTime: selectedDateTime?.timeOfDay ?? TimeOfDay.now());
      if (pickedTime != null) {
        selectedDateTime = pickedDate.applied(pickedTime);
        update();
      }
    }
  }
}
