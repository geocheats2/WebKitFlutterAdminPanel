import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/ui/cards_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
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

class CardsPage extends StatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late CardsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CardsController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Cards",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'UI'),
                        MyBreadcrumbItem(name: 'Card', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    MyFlexItem(
                      sizes: "xl-3 md-6 sm-12",
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          MyCard(
                            paddingAll: 0,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.landscapeImages[2],
                              fit: BoxFit.cover,
                              height: 300,
                              width: double.infinity,
                            ),
                          ),
                          MyContainer(
                            color: contentTheme.dark.withAlpha(150),
                            height: 300,
                            borderRadiusAll: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.titleMedium(
                                      'card_title'.tr().capitalizeWords,
                                      fontWeight: 600,
                                      color: contentTheme.light,
                                    ),
                                    MySpacing.height(8),
                                    MyText.bodySmall(
                                      controller.dummyTexts[1],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      color: contentTheme.light,
                                      fontWeight: 600,
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: MyButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: MySpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: MyText.bodySmall(
                                      'click_me'.tr().capitalizeWords,
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-3 md-6 sm-12",
                      child: Stack(
                        children: [
                          MyCard(
                            paddingAll: 0,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.landscapeImages[1],
                              fit: BoxFit.cover,
                              height: 300,
                              width: double.infinity,
                            ),
                          ),
                          MyContainer(
                            color: contentTheme.dark.withAlpha(150),
                            height: 300,
                            borderRadiusAll: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MySpacing.height(8),
                                MyText.bodySmall(
                                  controller.dummyTexts[1],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  color: contentTheme.light,
                                  fontWeight: 600,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-3 md-6 sm-12",
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          MyCard(
                            borderRadiusAll: 12,
                            paddingAll: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.squareImages[8],
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          MyContainer(
                            color: contentTheme.dark.withAlpha(150),
                            height: 300,
                            borderRadiusAll: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.titleMedium(
                                      'card_title'.tr().capitalizeWords,
                                      fontWeight: 600,
                                      color: contentTheme.light,
                                    ),
                                    MySpacing.height(4),
                                    MyText.bodySmall(
                                      'subtitle_is_more_useful'.tr(),
                                      muted: true,
                                      fontWeight: 600,
                                      color: contentTheme.light,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(8, 12),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'ok'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                    MySpacing.width(8),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(8, 12),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'cancel'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-3 md-6 sm-12",
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          MyCard(
                            shadow: MyShadow.none(),
                            paddingAll: 0,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.squareImages[6],
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          MyContainer(
                            color: contentTheme.dark.withAlpha(150),
                            height: 300,
                            borderRadiusAll: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleMedium(
                                  'no_shadow'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  color: contentTheme.light,
                                ),
                                MyText.bodySmall(
                                  controller.dummyTexts[4],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  color: contentTheme.light,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-3 md-6 sm-12",
                      child: Stack(
                        children: [
                          MyCard.bordered(
                            shadow: MyShadow.none(),
                            paddingAll: 0,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.squareImages[8],
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          MyContainer(
                            color: contentTheme.dark.withAlpha(150),
                            height: 300,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleMedium(
                                  'bordered'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  color: contentTheme.light,
                                ),
                                MyText.bodySmall(
                                  controller.dummyTexts[4],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  color: contentTheme.light,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-3 md-6 sm-12",
                      child: Stack(
                        children: [
                          MyCard(
                            shadow: MyShadow(elevation: 1),
                            paddingAll: 0,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.squareImages[9],
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          MyContainer(
                            color: contentTheme.dark.withAlpha(150),
                            height: 300,
                            borderRadiusAll: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleMedium(
                                  '${'shadow'.tr()}: 1',
                                  fontWeight: 600,
                                  color: contentTheme.light,
                                ),
                                MyText.bodySmall(
                                  controller.dummyTexts[4],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  color: contentTheme.light,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-3 md-6 sm-12",
                      child: Stack(
                        children: [
                          MyCard(
                            shadow: MyShadow(elevation: 10),
                            paddingAll: 0,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.squareImages[12],
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          MyContainer(
                            color: contentTheme.dark.withAlpha(150),
                            height: 300,
                            borderRadiusAll: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleMedium(
                                  'shadow : very_high'.tr().capitalizeWords,
                                  fontWeight: 600,
                                  color: contentTheme.light,
                                ),
                                MyText.bodySmall(
                                  controller.dummyTexts[5],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  color: contentTheme.light,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-3 md-6 sm-12",
                      child: MyContainer(
                        height: 300,
                        borderRadiusAll: 12,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyContainer.rounded(
                              paddingAll: 0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                Images.avatars[1],
                                height: 100,
                                width: 100,
                              ),
                            ),
                            MySpacing.height(16),
                            MyText.bodyMedium(
                              "Bonne Green",
                              fontWeight: 600,
                              fontSize: 16,
                            ),
                            MyText.titleMedium(
                              controller.dummyTexts[5],
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                            MySpacing.height(16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  padding: MySpacing.xy(8, 12),
                                  backgroundColor: contentTheme.primary,
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: MyText.bodySmall(
                                    'Add Friend'.tr(),
                                    color: contentTheme.onPrimary,
                                  ),
                                ),
                                MySpacing.width(8),
                                MyButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  padding: MySpacing.xy(8, 12),
                                  backgroundColor: contentTheme.primary,
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: MyText.bodySmall(
                                    'Message'.tr(),
                                    color: contentTheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-6 md-12 sm-12",
                      child: MyContainer.bordered(
                        // height: 302,
                        paddingAll: 0,
                        borderRadiusAll: 12,
                        child: Wrap(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              child: Image.asset(
                                Images.landscapeImages[3],
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: MySpacing.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleMedium(
                                    "Box Title",
                                    fontWeight: 600,
                                    fontSize: 20,
                                  ),
                                  MySpacing.height(12),
                                  MyText.bodyMedium(
                                    controller.dummyTexts[5],
                                    maxLines: 3,
                                    fontSize: 12,
                                  ),
                                  MySpacing.height(16),
                                  Row(
                                    children: [
                                      MyText.bodyMedium(
                                        'Card Link',
                                        fontWeight: 600,
                                        style: MyTextStyle.bodyMedium(
                                          color: contentTheme.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      MySpacing.width(12),
                                      MyText.bodyMedium(
                                        'Another Link',
                                        fontWeight: 600,
                                        style: MyTextStyle.bodyMedium(
                                          color: contentTheme.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
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
              MySpacing.height(flexSpacing * 2),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    MyFlexItem(
                      sizes: "xl-6 sm-12",
                      child: MyContainer.bordered(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyContainer(
                              child: MyText.titleMedium(
                                "card_customizer".tr().capitalizeWords,
                                fontWeight: 600,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Padding(
                              padding: MySpacing.xy(flexSpacing, 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        child: MyText.bodyMedium(
                                          "shadow_position"
                                              .tr()
                                              .capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      PopupMenuButton(
                                          key: controller.shadowPositionKey,
                                          onSelected:
                                              controller.onChangePosition,
                                          itemBuilder: (BuildContext context) {
                                            return MyShadowPosition.values
                                                .map((position) {
                                              return PopupMenuItem(
                                                value: position,
                                                height: 32,
                                                child: MyText.bodySmall(
                                                  position.humanReadable,
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
                                                  controller.shadowPosition
                                                      .humanReadable,
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
                                        width: 120,
                                        child: MyText.bodyMedium(
                                          "shadow_size".tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      Slider(
                                        value: controller.shadowElevation,
                                        min: 0,
                                        max: 40,
                                        divisions: 40,
                                        label: controller.shadowElevation
                                            .floor()
                                            .toString(),
                                        onChanged: controller.onChangeElevation,
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(12),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: MyText.bodyMedium(
                                          "shadow_color".tr().capitalizeWords,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      BlockPicker(
                                        pickerColor: controller.shadowColor,
                                        onColorChanged:
                                            controller.onChangeColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xl-4 md-6 sm-12",
                      child: Stack(
                        children: [
                          MyCard(
                            shadow: MyShadow(
                              elevation: controller.shadowElevation,
                              position: controller.shadowPosition,
                              color: controller.shadowColor.withAlpha(100),
                            ),
                            paddingAll: 0,
                            borderRadiusAll: 12,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.squareImages[2],
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          MyContainer(
                            color: Colors.transparent,
                            height: 300,
                            borderRadiusAll: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleMedium(
                                  'result'.tr(),
                                  fontWeight: 600,
                                  color: contentTheme.light,
                                ),
                              ],
                            ),
                          ),
                        ],
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
