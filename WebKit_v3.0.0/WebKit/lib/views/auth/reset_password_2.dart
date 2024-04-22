import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/auth/reset_password_2_controller.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/auth_layout_2.dart';

class ResetPassword2 extends StatefulWidget {
  const ResetPassword2({super.key});

  @override
  State<ResetPassword2> createState() => _ResetPassword2State();
}

class _ResetPassword2State extends State<ResetPassword2>
    with SingleTickerProviderStateMixin, UIMixin {
  late ResetPassword2Controller controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ResetPassword2Controller());
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
                          "Reset Password",
                          fontSize: 20,
                          fontWeight: 600,
                        ),
                        MySpacing.height(12),
                        MyText.bodyMedium(
                          "Your password will be reset",
                          fontSize: 12,
                          fontWeight: 600,
                          xMuted: true,
                          textAlign: TextAlign.center,
                        ),
                        MySpacing.height(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.labelMedium("Password"),
                            MySpacing.height(4),
                            TextFormField(
                              validator: controller.basicValidator
                                  .getValidation('password'),
                              controller: controller.basicValidator
                                  .getController('password'),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                            MySpacing.height(15),
                            MyText.labelMedium("Confirm Password"),
                            MySpacing.height(4),
                            TextFormField(
                              validator: controller.basicValidator
                                  .getValidation('confirm_password'),
                              controller: controller.basicValidator
                                  .getController('confirm_password'),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.confirmPassword,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                labelStyle: MyTextStyle.bodySmall(xMuted: true),
                                border: outlineInputBorder,
                                prefixIcon: const Icon(
                                  LucideIcons.lock,
                                  size: 20,
                                ),
                                suffixIcon: InkWell(
                                  onTap: controller.onResetPasswordPassword,
                                  child: Icon(
                                    controller.confirmPassword
                                        ? LucideIcons.eye
                                        : LucideIcons.eyeOff,
                                    size: 20,
                                  ),
                                ),
                                contentPadding: MySpacing.all(16),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                            MySpacing.height(25),
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
                                              color:
                                                  theme.colorScheme.onPrimary,
                                              strokeWidth: 1.2,
                                            ),
                                          )
                                        : Container(),
                                    if (controller.loading) MySpacing.width(16),
                                    MyText.bodySmall(
                                      'Confirm',
                                      color: contentTheme.onPrimary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
