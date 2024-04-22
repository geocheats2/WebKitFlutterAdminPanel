import 'package:flutter/material.dart';
import 'package:webkit/controller/forms/basic_controller.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_field_validator.dart';
import 'package:webkit/helpers/widgets/my_form_validator.dart';
import 'package:webkit/helpers/widgets/my_validators.dart';

class GenderValidator extends MyFieldValidatorRule<Gender> {
  @override
  String? validate(Gender? value, bool required, Map<String, dynamic> data) {
    return null;
  }
}

class ValidationController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();

  ValidationController() {
    basicValidator.addField('full_name',
        required: true,
        label: "Full Name",
        controller: TextEditingController());

    basicValidator.addField('email',
        required: true,
        label: "Email",
        validators: [MyEmailValidator()],
        controller: TextEditingController());

    basicValidator.addField('password',
        required: true,
        label: "Password",
        validators: [MyLengthValidator(min: 6, max: 10)],
        controller: TextEditingController());

    basicValidator.addField(
      'gender',
      required: true,
      label: "Gender",
      validators: [GenderValidator()],
    );
  }

  void onSubmitBasicForm() {
    basicValidator.validateForm();
  }

  void onResetBasicForm() {
    basicValidator.resetForm();
  }
}
