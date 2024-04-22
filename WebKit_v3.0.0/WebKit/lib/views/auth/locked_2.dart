import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/auth/locked_2_controller.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/auth_layout_2.dart';

class LockedPage2 extends StatefulWidget {
  const LockedPage2({super.key});

  @override
  State<LockedPage2> createState() => _LockedPage2State();
}

class _LockedPage2State extends State<LockedPage2>
    with SingleTickerProviderStateMixin, UIMixin {
  late Locked2Controller controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(Locked2Controller());
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout2(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return MyContainer.bordered(
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
                        Center(
                          child: MyText.titleLarge(
                            "locked",
                            fontWeight: 700,
                          ),
                        ),
                        MySpacing.height(8),
                        Center(
                          child: MyText(
                            "Hi ! Den",
                          ),
                        ),
                        MySpacing.height(16),
                        Center(
                          child: MyContainer.none(
                            borderRadiusAll: 26,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.avatars[5],
                              height: 44,
                              width: 44,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.labelMedium(
                              "Password",
                              fontWeight: 600,
                            ),
                            MySpacing.height(8),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: controller.basicValidator
                                  .getController('password'),
                              validator: controller.basicValidator
                                  .getValidation('password'),
                              obscureText: !controller.showPassword,
                              decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: controller.onShowPassword,
                                    child: Icon(
                                      controller.showPassword
                                          ? LucideIcons.eye
                                          : LucideIcons.eyeOff,
                                      size: 20,
                                    ),
                                  ),
                                  prefixIcon:
                                      const Icon(LucideIcons.lock, size: 18),
                                  hintText: "Password",
                                  hintStyle:
                                      MyTextStyle.bodySmall(xMuted: true),
                                  border: outlineInputBorder,
                                  contentPadding: MySpacing.all(12),
                                  isCollapsed: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never),
                            ),
                          ],
                        ),
                        MySpacing.height(16),
                        Center(
                          child: MyButton.rounded(
                            onPressed: controller.onLock,
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
                                  'unlock',
                                  color: contentTheme.onPrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
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
