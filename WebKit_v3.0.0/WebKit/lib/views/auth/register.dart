import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/auth/register_controller.dart';
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

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin, UIMixin {
  late RegisterController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        child: GetBuilder<RegisterController>(
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
                          Images.login[2],
                          fit: BoxFit.cover,
                          height: 500,
                        )
                      : type == MyScreenMediaType.xl
                          ? Image.asset(
                              Images.login[2],
                              fit: BoxFit.cover,
                              height: 500,
                            )
                          : type == MyScreenMediaType.lg
                              ? Image.asset(
                                  Images.login[2],
                                  fit: BoxFit.cover,
                                  height: 500,
                                )
                              : const SizedBox();
                }),
              ),
              MyFlexItem(
                sizes: "lg-6",
                child: Padding(
                  padding: MySpacing.y(20),
                  child: Form(
                    key: controller.basicValidator.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: MyText.titleLarge(
                          "register".tr(),
                          fontWeight: 700,
                        )),
                        MySpacing.height(10),
                        Center(
                            child: MyText.bodySmall(
                          "don't_have_an_account?_create_your_\naccount,_it_takes_less_than_a_minute"
                              .tr(),
                          muted: true,
                        )),
                        MySpacing.height(45),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.labelMedium(
                                    "first_name".tr().capitalizeWords,
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
                                    "last_name".tr().capitalizeWords,
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
                        MySpacing.height(20),
                        MyText.labelMedium(
                          "email_address".tr().capitalizeWords,
                        ),
                        MySpacing.height(4),
                        TextFormField(
                          validator:
                              controller.basicValidator.getValidation('email'),
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
                          "email_password".tr().capitalizeWords,
                        ),
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
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 20,
                                ),
                              ),
                              contentPadding: MySpacing.all(16),
                              isCollapsed: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                        ),
                        MySpacing.height(30),
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
                                  'register'.tr(),
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
                            splashColor:
                                contentTheme.secondary.withOpacity(0.1),
                            child: MyText.labelMedium(
                              'already_have_account_?'.tr(),
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
    ));
  }
}
