import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/auth/login_controller.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late LoginController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder<LoginController>(
        init: controller,
        builder: (controller) {
          return Padding(
            padding: MySpacing.all(16),
            child: MyFlex(
              contentPadding: false,
              children: [
                MyFlexItem(
                  sizes: "lg-6",
                  child: MyResponsive(
                    builder: (_, __, type) {
                      return type == MyScreenMediaType.xxl
                          ? Image.asset(
                              Images.login[3],
                              fit: BoxFit.cover,
                              height: 500,
                            )
                          : type == MyScreenMediaType.xl
                              ? Image.asset(
                                  Images.login[3],
                                  fit: BoxFit.cover,
                                  height: 500,
                                )
                              : type == MyScreenMediaType.lg
                                  ? Image.asset(
                                      Images.login[3],
                                      fit: BoxFit.cover,
                                      height: 500,
                                    )
                                  : const SizedBox();
                    },
                  ),
                ),
                MyFlexItem(
                  sizes: "lg-6",
                  child: Padding(
                    padding: MySpacing.y(28),
                    child: Form(
                      key: controller.basicValidator.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: MyText.titleLarge(
                              "Welcome",
                              fontWeight: 600,
                              fontSize: 24,
                            ),
                          ),
                          Center(
                            child: MyText.bodyMedium(
                              "Login your account",
                              fontSize: 16,
                            ),
                          ),
                          MySpacing.height(40),
                          MyText.bodyMedium(
                            "Your Email",
                          ),
                          MySpacing.height(8),
                          TextFormField(
                            validator: controller.basicValidator
                                .getValidation('email'),
                            controller: controller.basicValidator
                                .getController('email'),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                          ),
                          MySpacing.height(16),
                          MyText.labelMedium(
                            "password".tr(),
                          ),
                          MySpacing.height(8),
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
                                    FloatingLabelBehavior.never),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => controller
                                    .onChangeCheckBox(!controller.isChecked),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      onChanged: controller.onChangeCheckBox,
                                      value: controller.isChecked,
                                      activeColor: theme.colorScheme.primary,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: getCompactDensity,
                                    ),
                                    MySpacing.width(16),
                                    MyText.bodyMedium(
                                      "Remember Me",
                                    ),
                                  ],
                                ),
                              ),
                              MyButton.text(
                                onPressed: controller.goToForgotPassword,
                                elevation: 0,
                                padding: MySpacing.xy(8, 0),
                                splashColor:
                                    contentTheme.secondary.withOpacity(0.1),
                                child: MyText.labelSmall(
                                  'forgot_password?'.tr().capitalizeWords,
                                  color: contentTheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          MySpacing.height(40),
                          Center(
                            child: MyButton.rounded(
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
                                          child: CircularProgressIndicator(
                                            color: theme.colorScheme.onPrimary,
                                            strokeWidth: 1.2,
                                          ),
                                        )
                                      : Container(),
                                  if (controller.loading) MySpacing.width(16),
                                  MyText.bodySmall(
                                    'login'.tr(),
                                    color: contentTheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: MyButton.text(
                              onPressed: controller.gotoRegister,
                              elevation: 0,
                              padding: MySpacing.x(16),
                              splashColor:
                                  contentTheme.secondary.withOpacity(0.1),
                              child: MyText.labelMedium(
                                'i_haven_t_account'.tr(),
                                color: contentTheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
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
