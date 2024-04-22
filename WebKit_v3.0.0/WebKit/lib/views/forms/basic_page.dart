import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/app_constant.dart';
import 'package:webkit/controller/forms/basic_controller.dart';
import 'package:webkit/helpers/extensions/date_time_extention.dart';
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

class BasicPage extends StatefulWidget {
  const BasicPage({Key? key}) : super(key: key);

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late BasicController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(BasicController());
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
                      "basic_forms".tr().capitalizeWords,
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'forms'.tr()),
                        MyBreadcrumbItem(name: 'Basic'.tr(), active: true),
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
                      sizes: "lg-7",
                      child: MyContainer.bordered(
                        paddingAll: 0,
                        child: Column(
                          children: [
                            Padding(
                              padding: MySpacing.x(8),
                              child: MyContainer(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      LucideIcons.toggleRight,
                                      size: 16,
                                    ),
                                    MySpacing.width(12),
                                    MyText.titleMedium(
                                      "basic_input".tr().capitalizeWords,
                                      fontWeight: 600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: MySpacing.nTop(flexSpacing),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "first_name".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "First Name",
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
                                          ],
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "last_name".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Last Name",
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
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  MyText.labelMedium(
                                    "email_address".tr().capitalizeWords,
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "demo@getappui.com",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
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
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: !controller.showPassword,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        prefixIcon: const Icon(
                                          LucideIcons.lock,
                                          size: 20,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap:
                                              controller.onChangeShowPassword,
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
                                  MySpacing.height(20),
                                  Row(
                                    children: [
                                      MyText.labelLarge("gender".tr()),
                                      MySpacing.width(16),
                                      Expanded(
                                        child: Wrap(
                                            spacing: 16,
                                            children: Gender.values
                                                .map(
                                                  (gender) => InkWell(
                                                    onTap: () => controller
                                                        .onChangeGender(gender),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Radio<Gender>(
                                                          value: gender,
                                                          activeColor:
                                                              contentTheme
                                                                  .primary,
                                                          groupValue: controller
                                                              .selectedGender,
                                                          onChanged: controller
                                                              .onChangeGender,
                                                          visualDensity:
                                                              getCompactDensity,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                        ),
                                                        MySpacing.width(8),
                                                        MyText.labelMedium(
                                                            gender.name
                                                                .capitalize!)
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList()),
                                      )
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  MyText.labelLarge(
                                      "other_settings:".tr().capitalizeWords),
                                  MySpacing.height(4),
                                  SwitchListTile(
                                      activeColor: contentTheme.primary,
                                      value: controller.publicStatus,
                                      onChanged: controller.changeAccountStatus,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      visualDensity: getCompactDensity,
                                      contentPadding: MySpacing.zero,
                                      title: MyText.bodyMedium(
                                          "set_profile_to_private".tr())),
                                  SwitchListTile(
                                      activeColor: contentTheme.primary,
                                      value: controller.newsletter,
                                      onChanged:
                                          controller.changeNewsletterStatus,
                                      visualDensity: getCompactDensity,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding: MySpacing.zero,
                                      title: MyText.bodyMedium(
                                          "opt-in_daily_newsletter_at_the_email"
                                              .tr())),
                                  MySpacing.height(16),
                                  InkWell(
                                    onTap: () => controller
                                        .onChangedChecked(!controller.checked),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          onChanged:
                                              controller.onChangedChecked,
                                          value: !controller.checked,
                                          activeColor: contentTheme.primary,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: getCompactDensity,
                                        ),
                                        MySpacing.width(16),
                                        RichText(
                                          text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "i_agree_with".tr(),
                                                ),
                                                const TextSpan(text: " "),
                                                TextSpan(
                                                    text: "terms_&_conditions"
                                                        .tr(),
                                                    style:
                                                        MyTextStyle.bodyMedium(
                                                            color: contentTheme
                                                                .success,
                                                            fontWeight: 600)),
                                              ],
                                              style: MyTextStyle.bodyMedium(
                                                  fontWeight: 600)),
                                        )
                                      ],
                                    ),
                                  ),
                                  MySpacing.height(8),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'submit'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer.bordered(
                        paddingAll: 0,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: MySpacing.x(8),
                              child: MyContainer(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      LucideIcons.layers,
                                      size: 16,
                                    ),
                                    MySpacing.width(12),
                                    MyText.titleMedium(
                                      "more_inputs".tr().capitalizeWords,
                                      fontWeight: 600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: MySpacing.nTop(flexSpacing),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.labelLarge(
                                      "date_time_pickers".tr().capitalizeWords),
                                  MySpacing.height(12),
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: [
                                      MyButton.outlined(
                                        onPressed: () {
                                          controller.pickDate();
                                        },
                                        borderColor: contentTheme.primary,
                                        padding: MySpacing.xy(16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              LucideIcons.calendar,
                                              color: contentTheme.primary,
                                              size: 16,
                                            ),
                                            MySpacing.width(10),
                                            MyText.labelMedium(
                                                controller.selectedDate != null
                                                    ? dateFormatter.format(
                                                        controller
                                                            .selectedDate!)
                                                    : "select_date"
                                                        .tr()
                                                        .capitalizeWords,
                                                fontWeight: 600,
                                                color: contentTheme.primary),
                                          ],
                                        ),
                                      ),
                                      MyButton.outlined(
                                        onPressed: () {
                                          controller.pickTime();
                                        },
                                        borderColor: contentTheme.primary,
                                        padding: MySpacing.xy(16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              LucideIcons.clock4,
                                              color: contentTheme.primary,
                                              size: 16,
                                            ),
                                            MySpacing.width(10),
                                            MyText.labelMedium(
                                                controller.selectedTime != null
                                                    ? timeFormatter.format(
                                                        DateTime.now().applied(
                                                            controller
                                                                .selectedTime!))
                                                    : "select_time"
                                                        .tr()
                                                        .capitalizeWords,
                                                fontWeight: 600,
                                                color: contentTheme.primary),
                                          ],
                                        ),
                                      ),
                                      MyButton.outlined(
                                        onPressed: () {
                                          controller.pickDateRange();
                                        },
                                        borderColor: contentTheme.primary,
                                        padding: MySpacing.xy(16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              LucideIcons.calendarDays,
                                              color: contentTheme.primary,
                                              size: 16,
                                            ),
                                            MySpacing.width(10),
                                            MyText.labelMedium(
                                                controller.selectedDateTimeRange !=
                                                        null
                                                    ? "${dateFormatter.format(controller.selectedDateTimeRange!.start)} - ${dateFormatter.format(controller.selectedDateTimeRange!.end)}"
                                                    : "select_range"
                                                        .tr()
                                                        .capitalizeWords,
                                                fontWeight: 600,
                                                color: contentTheme.primary),
                                          ],
                                        ),
                                      ),
                                      MyButton.outlined(
                                        onPressed: () {
                                          controller.pickDateTime();
                                        },
                                        borderColor: contentTheme.primary,
                                        padding: MySpacing.xy(16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Icon(
                                              LucideIcons.calendarCheck,
                                              color: contentTheme.primary,
                                              size: 16,
                                            ),
                                            MySpacing.width(10),
                                            MyText.labelMedium(
                                                controller.selectedDateTime !=
                                                        null
                                                    ? "${dateFormatter.format(controller.selectedDateTime!)} ${timeFormatter.format(controller.selectedDateTime!)}"
                                                    : "select_date_&_time"
                                                        .tr()
                                                        .capitalizeWords,
                                                fontWeight: 600,
                                                color: contentTheme.primary),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  MyText.labelLarge("sliders".tr()),
                                  MySpacing.height(8),
                                  Slider(
                                    activeColor: contentTheme.primary,
                                    inactiveColor:
                                        contentTheme.primary.withAlpha(50),
                                    value: controller.slider1,
                                    onChanged: controller.onChangeSlider1,
                                    min: 0,
                                    max: 50,
                                  ),
                                  MyContainer.bordered(
                                    margin: MySpacing.x(flexSpacing),
                                    paddingAll: 8,
                                    child: Center(
                                      child: MyText.titleSmall(
                                          "${controller.slider1}"),
                                    ),
                                  ),
                                  Slider(
                                    activeColor: contentTheme.primary,
                                    inactiveColor:
                                        contentTheme.primary.withAlpha(50),
                                    value: controller.slider2,
                                    min: 0,
                                    max: 100,
                                    divisions: 100,
                                    label:
                                        controller.slider2.floor().toString(),
                                    onChanged: controller.onChangeSlider2,
                                  ),
                                  MyContainer.bordered(
                                    margin: MySpacing.x(flexSpacing),
                                    paddingAll: 8,
                                    child: Center(
                                      child: MyText.titleSmall(
                                          "${controller.slider2}"),
                                    ),
                                  ),
                                  RangeSlider(
                                    values: controller.rangeSlider,
                                    min: 0,
                                    max: 100,
                                    divisions: 100,
                                    labels: RangeLabels(
                                        controller.rangeSlider.start
                                            .floor()
                                            .toString(),
                                        controller.rangeSlider.end
                                            .floor()
                                            .toString()),
                                    onChanged: controller.onChangeRangeSlider,
                                    activeColor: contentTheme.primary,
                                    inactiveColor:
                                        contentTheme.primary.withAlpha(50),
                                  ),
                                  MyContainer.bordered(
                                    margin: MySpacing.x(flexSpacing),
                                    paddingAll: 8,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        MyText.bodyMedium(
                                            "${controller.rangeSlider.start}"),
                                        MyText.bodyMedium(
                                            "${controller.rangeSlider.end}")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer.bordered(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        paddingAll: 0,
                        child: Column(
                          children: [
                            Padding(
                              padding: MySpacing.x(8),
                              child: MyContainer(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      LucideIcons.settings,
                                      size: 16,
                                    ),
                                    MySpacing.width(12),
                                    MyText.titleMedium(
                                      "builder".tr(),
                                      fontWeight: 600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: MySpacing.nTop(flexSpacing),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 180,
                                          child: MyText.labelLarge(
                                              "floating_label_type"
                                                  .tr()
                                                  .capitalizeWords)),
                                      PopupMenuButton(
                                          onSelected:
                                              controller.onChangeLabelType,
                                          itemBuilder: (BuildContext context) {
                                            return FloatingLabelBehavior.values
                                                .map((behavior) {
                                              return PopupMenuItem(
                                                value: behavior,
                                                height: 32,
                                                child: MyText.bodySmall(
                                                  behavior.name.capitalize!,
                                                  color: theme
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600,
                                                ),
                                              );
                                            }).toList();
                                          },
                                          color: theme.cardTheme.color,
                                          child: MyContainer.bordered(
                                            padding: MySpacing.xy(12, 8),
                                            child: Row(
                                              children: <Widget>[
                                                MyText.labelMedium(
                                                  controller
                                                      .floatingLabelBehavior
                                                      .name
                                                      .capitalize!,
                                                  color: theme
                                                      .colorScheme.onBackground,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 4),
                                                  child: Icon(
                                                    LucideIcons.chevronDown,
                                                    size: 22,
                                                    color: theme.colorScheme
                                                        .onBackground,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  MySpacing.height(8),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 180,
                                          child: MyText.labelLarge("border_type"
                                              .tr()
                                              .capitalizeWords)),
                                      PopupMenuButton(
                                          onSelected:
                                              controller.onChangeBorderType,
                                          itemBuilder: (BuildContext context) {
                                            return TextFieldBorderType.values
                                                .map((borderType) {
                                              return PopupMenuItem(
                                                value: borderType,
                                                height: 32,
                                                child: MyText.bodySmall(
                                                  borderType.name.capitalize!,
                                                  color: theme
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600,
                                                ),
                                              );
                                            }).toList();
                                          },
                                          color: theme.cardTheme.color,
                                          child: MyContainer.bordered(
                                            padding: MySpacing.xy(12, 8),
                                            child: Row(
                                              children: <Widget>[
                                                MyText.labelMedium(
                                                  controller.borderType.name
                                                      .capitalize!,
                                                  color: theme
                                                      .colorScheme.onBackground,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 4),
                                                  child: Icon(
                                                    LucideIcons.chevronDown,
                                                    size: 22,
                                                    color: theme.colorScheme
                                                        .onBackground,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  MySpacing.height(12),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 180,
                                          child:
                                              MyText.labelLarge("filled".tr())),
                                      Switch(
                                        onChanged:
                                            controller.onChangedFilledChecked,
                                        value: controller.filled,
                                        activeColor: contentTheme.primary,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        // visualDensity: getCompactDensity,
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  MyText.labelLarge("output".tr()),
                                  MySpacing.height(20),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "Sample Text Field",
                                        border: controller.inputBorder,
                                        focusedBorder: controller.inputBorder,
                                        filled: controller.filled,
                                        enabledBorder: controller.inputBorder,
                                        floatingLabelBehavior:
                                            controller.floatingLabelBehavior),
                                  ),
                                ],
                              ),
                            )
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
