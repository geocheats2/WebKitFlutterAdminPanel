import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/apps/contact/edit_profile_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/my_string_utils.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/layout.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with SingleTickerProviderStateMixin, UIMixin {
  late EditProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(EditProfileController());
  }

  final ImagePicker picker = ImagePicker();

  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Edit Profile",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Contact"),
                        MyBreadcrumbItem(name: "Edit Profile", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-6",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                imageFile = await picker.pickImage(
                                    source: ImageSource.gallery);
                                debugPrint(
                                    "imageFile!.path --------------------->>> ${imageFile!.path}");
                                setState(() {});
                              },
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  imageFile == null
                                      ? MyContainer.rounded(
                                          height: 150,
                                          width: 150,
                                          paddingAll: 0,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.asset(
                                            Images.avatars[0],
                                            fit: BoxFit.cover,
                                          ))
                                      : MyContainer.rounded(
                                          paddingAll: 0,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.file(
                                              File(imageFile!.path),
                                              fit: BoxFit.cover),
                                        ),
                                ],
                              ),
                            ),
                            MySpacing.height(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextField(
                                    "First Name", "Enter your First Name"),
                                MySpacing.height(20),
                                buildTextField(
                                    "Last Name", "Enter your Last Name"),
                                MySpacing.height(20),
                                MyText.labelMedium(
                                  "Email address",
                                ),
                                MySpacing.height(8),
                                Form(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      if (value != null &&
                                          !MyStringUtils.isEmail(value)) {
                                        return 'Invalid Email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Email Address",
                                      hintStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                    ),
                                  ),
                                ),
                                MySpacing.height(20),
                                MyText.labelMedium(
                                  "Contact Number",
                                ),
                                MySpacing.height(8),
                                TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    PhoneInputFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "Enter Contact Number",
                                    hintStyle:
                                        MyTextStyle.bodySmall(xMuted: true),
                                    border: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    focusedBorder: focusedInputBorder,
                                    contentPadding: MySpacing.all(16),
                                    isCollapsed: true,
                                  ),
                                ),
                                MySpacing.height(20),
                                buildTextField("Address", "Enter Address"),
                                MySpacing.height(20),
                                MyText.labelMedium(
                                  "password",
                                ),
                                MySpacing.height(8),
                                TextFormField(
                                  validator: controller.validation
                                      .getValidation('password'),
                                  controller: controller.validation
                                      .getController('password'),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: !controller.showPassword,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle:
                                        MyTextStyle.bodySmall(xMuted: true),
                                    border: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    focusedBorder: focusedInputBorder,
                                    suffixIcon: InkWell(
                                      onTap: controller.onChangeShowPassword,
                                      child: Icon(
                                        controller.showPassword
                                            ? LucideIcons.eye
                                            : LucideIcons.eyeOff,
                                        size: 18,
                                      ),
                                    ),
                                    contentPadding: MySpacing.all(16),
                                    isCollapsed: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                ),
                                MySpacing.height(20),
                                MyButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  padding: MySpacing.xy(20, 16),
                                  backgroundColor: contentTheme.primary,
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: MyText.bodySmall(
                                    'Save',
                                    color: contentTheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildTextField(String fieldTitle, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(
          fieldTitle,
        ),
        MySpacing.height(8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            border: outlineInputBorder,
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    return newValue.copyWith(
      text: text.isNotEmpty ? text : '',
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
