import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/forms/basic_controller.dart';
import 'package:webkit/controller/forms/validation_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ValidationController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ValidationController());
  }

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
                      "validation_forms".tr().capitalizeWords,
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'forms'.tr()),
                        MyBreadcrumbItem(name: 'validation'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing * 5),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer(
                        paddingAll: 0,
                        child: Column(
                          children: [
                            MyContainer(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    FeatherIcons.key,
                                    size: 16,
                                  ),
                                  MySpacing.width(12),
                                  MyText.titleMedium(
                                    "Validation".tr().capitalizeWords,
                                    fontWeight: 600,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: MySpacing.all(flexSpacing),
                              child: Column(
                                children: [
                                  MyFlexItem(
                                      sizes: "lg-6 md-12",
                                      child: Form(
                                        key: controller.basicValidator.formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "full_name".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('full_name'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('full_name'),
                                              decoration: InputDecoration(
                                                  hintText: "Denish Navadiya",
                                                  hintStyle:
                                                      MyTextStyle.bodySmall(
                                                          xMuted: true),
                                                  border: outlineInputBorder,
                                                  enabledBorder:
                                                      outlineInputBorder,
                                                  focusedBorder:
                                                      focusedInputBorder,
                                                  contentPadding:
                                                      MySpacing.all(16),
                                                  isCollapsed: true,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never),
                                            ),
                                            MySpacing.height(16),
                                            MyText.labelMedium(
                                              "email_address"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('email'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('email'),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                  hintText: "demo@getappui.com",
                                                  hintStyle:
                                                      MyTextStyle.bodySmall(
                                                          xMuted: true),
                                                  border: outlineInputBorder,
                                                  enabledBorder:
                                                      outlineInputBorder,
                                                  focusedBorder:
                                                      focusedInputBorder,
                                                  prefixIcon: const Icon(
                                                    LucideIcons.mail,
                                                    size: 20,
                                                  ),
                                                  contentPadding:
                                                      MySpacing.all(16),
                                                  isCollapsed: true,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never),
                                            ),
                                            MySpacing.height(16),
                                            MyText.labelMedium(
                                              "password".tr(),
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('password'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('password'),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                  hintText: "****",
                                                  hintStyle:
                                                      MyTextStyle.bodySmall(
                                                          xMuted: true),
                                                  border: outlineInputBorder,
                                                  enabledBorder:
                                                      outlineInputBorder,
                                                  focusedBorder:
                                                      focusedInputBorder,
                                                  prefixIcon: const Icon(
                                                    LucideIcons.lock,
                                                    size: 20,
                                                  ),
                                                  contentPadding:
                                                      MySpacing.all(16),
                                                  isCollapsed: true,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never),
                                            ),
                                            MySpacing.height(20),
                                            MyText.labelMedium(
                                              "gender".tr(),
                                            ),
                                            MySpacing.height(8),
                                            DropdownButtonFormField<Gender>(
                                                dropdownColor: theme
                                                    .colorScheme.background,
                                                menuMaxHeight: 200,
                                                items: Gender.values
                                                    .map((gender) =>
                                                        DropdownMenuItem<
                                                                Gender>(
                                                            value: gender,
                                                            child:
                                                                MyText
                                                                    .labelMedium(
                                                              gender.name
                                                                  .capitalize!,
                                                            )))
                                                    .toList(),
                                                icon: const Icon(
                                                  LucideIcons.chevronDown,
                                                  size: 20,
                                                ),
                                                decoration: InputDecoration(
                                                    hintText: "Select gender",
                                                    hintStyle:
                                                        MyTextStyle.bodySmall(
                                                            xMuted: true),
                                                    border: outlineInputBorder,
                                                    enabledBorder:
                                                        outlineInputBorder,
                                                    focusedBorder:
                                                        focusedInputBorder,
                                                    contentPadding:
                                                        MySpacing.all(16),
                                                    isCollapsed: true,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never),
                                                onChanged: controller
                                                    .basicValidator
                                                    .onChanged<Object?>(
                                                        'gender'),
                                                validator: controller
                                                    .basicValidator
                                                    .getValidation<Gender?>(
                                                        'gender')),
                                            MySpacing.height(20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                MyButton(
                                                  onPressed: controller
                                                      .onResetBasicForm,
                                                  elevation: 0,
                                                  padding: MySpacing.xy(20, 16),
                                                  backgroundColor:
                                                      contentTheme.secondary,
                                                  borderRadiusAll: AppStyle
                                                      .buttonRadius.medium,
                                                  child: MyText.bodySmall(
                                                    'clear'.tr(),
                                                    color: contentTheme
                                                        .onSecondary,
                                                  ),
                                                ),
                                                MySpacing.width(16),
                                                MyButton(
                                                  onPressed: controller
                                                      .onSubmitBasicForm,
                                                  elevation: 0,
                                                  padding: MySpacing.xy(20, 16),
                                                  backgroundColor:
                                                      contentTheme.primary,
                                                  borderRadiusAll: AppStyle
                                                      .buttonRadius.medium,
                                                  child: MyText.bodySmall(
                                                    'submit'.tr(),
                                                    color:
                                                        contentTheme.onPrimary,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
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
}
