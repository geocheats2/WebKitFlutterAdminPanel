import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:webkit/controller/ui/notifications_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/theme/admin_theme.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin, UIMixin {
  late NotificationsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(NotificationsController(this));
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
                      "notifications".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ui'.tr().toUpperCase()),
                        MyBreadcrumbItem(
                            name: 'notifications'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing * 2),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                        sizes: "lg-8 md-12",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: MySpacing.xy(flexSpacing, 12),
                              child: MyText.titleMedium(
                                "${controller.showBanner ? "banner".tr() : "toast".tr()} Customizer",
                                fontWeight: 600,
                              ),
                            ),
                            MyContainer(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              paddingAll: 0,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: MySpacing.xy(flexSpacing, 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText.labelLarge(
                                            "type".tr(),
                                          ),
                                          MySpacing.height(8),
                                          MyContainer.bordered(
                                            paddingAll: 12,
                                            width: double.infinity,
                                            child: Wrap(
                                              spacing: 16,
                                              runSpacing: 4,
                                              children: [
                                                InkWell(
                                                  onTap: () => controller
                                                      .setBannerType(false),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Radio<bool>(
                                                        value: false,
                                                        activeColor:
                                                            contentTheme
                                                                .primary,
                                                        groupValue: controller
                                                            .showBanner,
                                                        onChanged: (_) =>
                                                            controller
                                                                .setBannerType(
                                                                    false),
                                                        visualDensity:
                                                            getCompactDensity,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                      ),
                                                      MySpacing.width(8),
                                                      MyText.labelMedium(
                                                          "toast".tr())
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () => controller
                                                      .setBannerType(true),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Radio<bool>(
                                                        value: true,
                                                        activeColor:
                                                            contentTheme
                                                                .primary,
                                                        groupValue: controller
                                                            .showBanner,
                                                        onChanged: (_) =>
                                                            controller
                                                                .setBannerType(
                                                                    true),
                                                        visualDensity:
                                                            getCompactDensity,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                      ),
                                                      MySpacing.width(8),
                                                      MyText.labelMedium(
                                                          "banner".tr())
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          MySpacing.height(20),
                                          MyText.labelLarge(
                                            "title_text".tr().capitalizeWords,
                                          ),
                                          MySpacing.height(8),
                                          TextFormField(
                                            controller:
                                                controller.toastTitleController,
                                            decoration: InputDecoration(
                                              labelText:
                                                  "Please Enter Notification Text  ",
                                              border: outlineInputBorder,
                                              enabledBorder: outlineInputBorder,
                                              contentPadding: MySpacing.all(16),
                                              isCollapsed: false,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                            ),
                                          ),
                                          MySpacing.height(20),
                                          MyText.labelLarge(
                                            "color_variant"
                                                .tr()
                                                .capitalizeWords,
                                          ),
                                          MySpacing.height(8),
                                          MyContainer.bordered(
                                            paddingAll: 12,
                                            width: double.infinity,
                                            child: Wrap(
                                                spacing: 16,
                                                runSpacing: 4,
                                                children: ContentThemeColor
                                                    .values
                                                    .map(
                                                      (color) => InkWell(
                                                        onTap: () => controller
                                                            .onChangeColor(
                                                                color),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Radio<
                                                                ContentThemeColor>(
                                                              value: color,
                                                              activeColor:
                                                                  controller
                                                                      .selectedColor
                                                                      .color,
                                                              groupValue: controller
                                                                  .selectedColor,
                                                              onChanged: controller
                                                                  .onChangeColor,
                                                              visualDensity:
                                                                  getCompactDensity,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                            ),
                                                            MySpacing.width(8),
                                                            MyText.labelMedium(
                                                                color.name
                                                                    .capitalize!)
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .toList()),
                                          ),
                                          MySpacing.height(20),
                                          if (!controller.showBanner) ...[
                                            MyText.labelLarge(
                                              "floating_type"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            MyContainer.bordered(
                                              width: double.infinity,
                                              paddingAll: 12,
                                              child: Wrap(
                                                  spacing: 16,
                                                  children: SnackBarBehavior
                                                      .values
                                                      .map(
                                                        (behavior) => InkWell(
                                                          onTap: () => controller
                                                              .onChangeBehavior(
                                                                  behavior),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Radio<
                                                                  SnackBarBehavior>(
                                                                value: behavior,
                                                                activeColor:
                                                                    contentTheme
                                                                        .primary,
                                                                groupValue:
                                                                    controller
                                                                        .selectedBehavior,
                                                                onChanged:
                                                                    controller
                                                                        .onChangeBehavior,
                                                                visualDensity:
                                                                    getCompactDensity,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                              ),
                                                              MySpacing.width(
                                                                  8),
                                                              MyText.labelMedium(
                                                                  behavior.name
                                                                      .capitalize!)
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                      .toList()),
                                            ),
                                            MySpacing.height(20),
                                          ],
                                          MyText.labelLarge(
                                            "actions".tr(),
                                          ),
                                          MySpacing.height(8),
                                          CheckboxListTile(
                                              value: controller.showCloseIcon,
                                              onChanged: controller
                                                  .onChangeShowCloseIcon,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              visualDensity: getCompactDensity,
                                              contentPadding: MySpacing.zero,
                                              dense: true,
                                              activeColor: contentTheme.primary,
                                              title: MyText.bodyMedium(
                                                  "show_close_icon"
                                                      .tr()
                                                      .capitalizeWords)),
                                          if (!controller.showBanner)
                                            CheckboxListTile(
                                                value: controller.showOkAction,
                                                onChanged: controller
                                                    .onChangeShowOkAction,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                visualDensity:
                                                    getCompactDensity,
                                                contentPadding: MySpacing.zero,
                                                dense: true,
                                                activeColor:
                                                    contentTheme.primary,
                                                title: MyText.bodyMedium(
                                                    "show_ok_action"
                                                        .tr()
                                                        .capitalizeWords)),
                                          if (controller.showBanner)
                                            CheckboxListTile(
                                                value:
                                                    controller.showLeadingIcon,
                                                onChanged: controller
                                                    .onChangeShowLeadingIcon,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                visualDensity:
                                                    getCompactDensity,
                                                contentPadding: MySpacing.zero,
                                                dense: true,
                                                activeColor:
                                                    contentTheme.primary,
                                                title: MyText.bodyMedium(
                                                    "show_leading_icon"
                                                        .tr()
                                                        .capitalizeWords)),
                                          MySpacing.height(20),
                                          MyText.labelLarge(
                                            "timeout".tr(),
                                          ),
                                          MySpacing.height(8),
                                          MyContainer.bordered(
                                            paddingAll: 8,
                                            width: double.infinity,
                                            child: SwitchListTile(
                                                activeColor:
                                                    contentTheme.primary,
                                                value: controller.sticky,
                                                onChanged:
                                                    controller.onChangeSticky,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                visualDensity:
                                                    getCompactDensity,
                                                contentPadding: MySpacing.zero,
                                                dense: true,
                                                title: MyText.bodyMedium(
                                                    "${"infinite".tr()} (∞)")),
                                          ),
                                          MySpacing.height(20),
                                          Center(
                                            child: MyButton(
                                              onPressed: controller.show,
                                              elevation: 0,
                                              padding: MySpacing.xy(20, 16),
                                              backgroundColor:
                                                  contentTheme.primary,
                                              borderRadiusAll:
                                                  AppStyle.buttonRadius.medium,
                                              child: MyText.bodySmall(
                                                'show'.tr(),
                                                color: contentTheme.onPrimary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )),
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
