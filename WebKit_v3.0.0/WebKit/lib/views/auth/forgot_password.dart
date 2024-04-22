import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/auth/forgot_password_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_responsiv.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/auth_layout.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with SingleTickerProviderStateMixin, UIMixin {
  late ForgotPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ForgotPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<ForgotPasswordController>(
        init: controller,
        builder: (controller) {
          return Padding(
            padding: MySpacing.all(16),
            child: MyFlex(
              contentPadding: false,
              children: [
                MyFlexItem(
                  sizes: "lg-6",
                  child: MyResponsive(builder: (_, __, type) {
                    return type == MyScreenMediaType.xxl
                        ? Image.asset(
                            Images.login[1],
                            fit: BoxFit.fitHeight,
                            height: 500,
                          )
                        : type == MyScreenMediaType.xl
                            ? Image.asset(
                                Images.login[1],
                                fit: BoxFit.fitHeight,
                                height: 500,
                              )
                            : type == MyScreenMediaType.lg
                                ? Image.asset(
                                    Images.login[1],
                                    fit: BoxFit.fitHeight,
                                    height: 500,
                                  )
                                : const SizedBox();
                  }),
                ),
                MyFlexItem(
                  sizes: "lg-6",
                  child: Padding(
                    padding: MySpacing.y(28),
                    child: SizedBox(
                      height: 400,
                      child: Form(
                          key: controller.basicValidator.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: MyText.titleLarge(
                                      "forgot_password".tr().capitalizeWords,
                                      fontWeight: 700,
                                    ),
                                  ),
                                  MySpacing.height(10),
                                  Center(
                                    child: MyText.bodySmall(
                                      "Please reset your password.",
                                      muted: true,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.labelMedium(
                                      "email_address".tr().capitalizeWords),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('email'),
                                    controller: controller.basicValidator
                                        .getController('email'),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText:
                                          "email_address".tr().capitalizeWords,
                                      labelStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      prefixIcon: const Icon(
                                        LucideIcons.mail,
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
                              Column(
                                children: [
                                  MyButton.rounded(
                                    onPressed: controller.onLogin,
                                    elevation: 0,
                                    padding: MySpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        controller.loading
                                            ? SizedBox(
                                                height: 14,
                                                width: 14,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: theme
                                                      .colorScheme.onPrimary,
                                                  strokeWidth: 1.2,
                                                ),
                                              )
                                            : Container(),
                                        if (controller.loading)
                                          MySpacing.width(16),
                                        MyText.bodySmall(
                                          'forgot_password'
                                              .tr()
                                              .capitalizeWords,
                                          color: contentTheme.onPrimary,
                                        ),
                                      ],
                                    ),
                                  ),
                                  MyButton.text(
                                    onPressed: controller.gotoLogIn,
                                    elevation: 0,
                                    padding: MySpacing.x(16),
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.1),
                                    child: MyText.labelMedium(
                                      'back_to_log_in'.tr(),
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
