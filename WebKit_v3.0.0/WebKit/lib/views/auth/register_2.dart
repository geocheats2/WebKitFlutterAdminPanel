import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/auth/register_2_controller.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/auth_layout_2.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2>
    with SingleTickerProviderStateMixin, UIMixin {
  late Register2Controller controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(Register2Controller());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout2(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return MyContainer(
            child: Form(
              key: controller.basicValidator.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.logoIcon,
                        height: 24,
                        color: contentTheme.primary,
                      ),
                      MySpacing.width(16),
                      MyText.bodyMedium(
                        "WebKit",
                        fontSize: 24,
                        fontWeight: 600,
                      ),
                    ],
                  ),
                  Divider(
                    height: 40,
                  ),
                  Column(
                    children: [
                      MyText.bodyLarge(
                        "Register",
                        fontSize: 20,
                        fontWeight: 600,
                      ),
                      MySpacing.height(12),
                      MyText.bodyMedium(
                        "Make your app management easy and fun!",
                        fontSize: 12,
                        fontWeight: 600,
                        xMuted: true,
                        textAlign: TextAlign.center,
                      ),
                      MySpacing.height(20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.labelMedium(
                                      "First Name",
                                    ),
                                    MySpacing.height(4),
                                    TextFormField(
                                      validator: controller.basicValidator
                                          .getValidation('first_name'),
                                      controller: controller.basicValidator
                                          .getController('first_name'),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: "First Name",
                                        labelStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        prefixIcon: const Icon(
                                          LucideIcons.user,
                                          size: 20,
                                        ),
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MySpacing.width(20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.labelMedium(
                                      "Last Name",
                                    ),
                                    MySpacing.height(4),
                                    TextFormField(
                                      validator: controller.basicValidator
                                          .getValidation('last_name'),
                                      controller: controller.basicValidator
                                          .getController('last_name'),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: "Last Name",
                                        labelStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        prefixIcon: const Icon(
                                          LucideIcons.user,
                                          size: 20,
                                        ),
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  MySpacing.height(20),
                  MyText.labelMedium(
                    "Emial Address",
                  ),
                  MySpacing.height(4),
                  TextFormField(
                    validator: controller.basicValidator.getValidation('email'),
                    controller:
                        controller.basicValidator.getController('email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      labelStyle: MyTextStyle.bodySmall(xMuted: true),
                      border: outlineInputBorder,
                      prefixIcon: const Icon(
                        LucideIcons.mail,
                        size: 20,
                      ),
                      contentPadding: MySpacing.all(16),
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  MySpacing.height(20),
                  MyText.labelMedium(
                    "Email Password",
                  ),
                  MySpacing.height(4),
                  TextFormField(
                    validator:
                        controller.basicValidator.getValidation('password'),
                    controller:
                        controller.basicValidator.getController('password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !controller.showPassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: MyTextStyle.bodySmall(xMuted: true),
                        border: outlineInputBorder,
                        prefixIcon: const Icon(
                          LucideIcons.lock,
                          size: 20,
                        ),
                        suffixIcon: InkWell(
                          onTap: controller.onChangeShowPassword,
                          child: Icon(
                            controller.showPassword
                                ? LucideIcons.eye
                                : LucideIcons.eyeOff,
                            size: 20,
                          ),
                        ),
                        contentPadding: MySpacing.all(16),
                        isCollapsed: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                  ),
                  MySpacing.height(30),
                  Center(
                    child: MyButton.rounded(
                      onPressed: controller.onLogin,
                      elevation: 0,
                      padding: MySpacing.xy(20, 16),
                      backgroundColor: contentTheme.primary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controller.loading
                              ? SizedBox(
                                  height: 14,
                                  width: 14,
                                  child: CircularProgressIndicator(
                                    color: theme.colorScheme.onPrimary,
                                    strokeWidth: 1.2,
                                  ),
                                )
                              : Container(),
                          if (controller.loading) MySpacing.width(16),
                          MyText.bodySmall(
                            'Register',
                            color: contentTheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: MyButton.text(
                      onPressed: controller.gotoLogin,
                      elevation: 0,
                      padding: MySpacing.x(16),
                      splashColor: contentTheme.secondary.withOpacity(0.1),
                      child: MyText.labelMedium(
                        'Already Have Account ?',
                        color: contentTheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
