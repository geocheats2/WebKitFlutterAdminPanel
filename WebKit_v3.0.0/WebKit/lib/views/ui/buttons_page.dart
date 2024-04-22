import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/ui/buttons_controller.dart';
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
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage>
    with TickerProviderStateMixin, UIMixin {
  late ButtonsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ButtonsController(this));
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<ButtonsController>(
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
                      "Buttons",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'UI'),
                        MyBreadcrumbItem(name: 'Buttons', active: true),
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
                      sizes: "lg-8 md-12",
                      child: MyContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(
                              controller: controller.normalTabController,
                              isScrollable: true,
                              // indicatorColor: contentTheme.primary,

                              tabs: [
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Elevated Buttons",
                                    fontWeight:
                                        controller.normalIndex == 0 ? 600 : 500,
                                    color: controller.normalIndex == 0
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Flat Buttons",
                                    fontWeight:
                                        controller.normalIndex == 1 ? 600 : 500,
                                    color: controller.normalIndex == 1
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Outline Buttons",
                                    fontWeight:
                                        controller.normalIndex == 2 ? 600 : 500,
                                    color: controller.normalIndex == 2
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Soft Buttons",
                                    fontWeight:
                                        controller.normalIndex == 3 ? 600 : 500,
                                    color: controller.normalIndex == 3
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Text Buttons",
                                    fontWeight:
                                        controller.normalIndex == 4 ? 600 : 500,
                                    color: controller.normalIndex == 4
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                              ],
                              // controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            MySpacing.height(16),
                            SizedBox(
                              height: 150,
                              child: TabBarView(
                                controller: controller.normalTabController,
                                children: [
                                  buildElevatedButtons(),
                                  buildFlatButtons(),
                                  buildOutlineButtons(),
                                  buildSoftButtons(),
                                  buildTextButtons(),
                                ],
                                // controller: _tabController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-8 md-12",
                      child: MyContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(
                              controller: controller.roundedTabController,
                              isScrollable: true,
                              tabs: [
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Elevated Rounded Buttons",
                                    fontWeight: controller.roundedIndex == 0
                                        ? 600
                                        : 500,
                                    color: controller.roundedIndex == 0
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Rounded Buttons",
                                    fontWeight: controller.roundedIndex == 1
                                        ? 600
                                        : 500,
                                    color: controller.roundedIndex == 1
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Outline Rounded Buttons",
                                    fontWeight: controller.roundedIndex == 2
                                        ? 600
                                        : 500,
                                    color: controller.roundedIndex == 2
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Soft Rounded Buttons",
                                    fontWeight: controller.roundedIndex == 3
                                        ? 600
                                        : 500,
                                    color: controller.roundedIndex == 3
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Text Rounded Buttons",
                                    fontWeight: controller.roundedIndex == 4
                                        ? 600
                                        : 500,
                                    color: controller.roundedIndex == 4
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                              ],
                              // controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            MySpacing.height(16),
                            SizedBox(
                              height: 150,
                              child: TabBarView(
                                controller: controller.roundedTabController,
                                children: [
                                  buildElevatedRoundedButtons(),
                                  buildRoundedButtons(),
                                  buildOutlineRoundedButton(),
                                  buildSoftRoundedButtons(),
                                  buildTextRoundedButtons(),
                                ],
                                // controller: _tabController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-8 md-12",
                      child: MyContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(
                              controller: controller.groupAndSizedTabController,
                              isScrollable: true,
                              tabs: [
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Sized Buttons",
                                    fontWeight:
                                        controller.groupAndSizedButtons == 0
                                            ? 600
                                            : 500,
                                    color: controller.groupAndSizedButtons == 0
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                                Tab(
                                  icon: MyText.bodyMedium(
                                    "Buttons Group",
                                    fontWeight:
                                        controller.groupAndSizedButtons == 1
                                            ? 600
                                            : 500,
                                    color: controller.groupAndSizedButtons == 1
                                        ? contentTheme.primary
                                        : null,
                                  ),
                                ),
                              ],
                              // controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            MySpacing.height(16),
                            SizedBox(
                              height: 150,
                              child: TabBarView(
                                controller:
                                    controller.groupAndSizedTabController,
                                children: [
                                  buildSizedButtons(),
                                  buildGroupButtons(),
                                ],
                                // controller: _tabController,
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

  //--------------> NormalButtons <--------------//

  Widget buildElevatedButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.onPrimary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.secondary,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.onSecondary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.success,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.onSuccess,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.warning,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.onWarning,
              fontWeight: 600,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.info,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.onInfo,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.danger,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.onDanger,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFlatButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.onPrimary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.secondary,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.onSecondary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.success,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.onSuccess,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.warning,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.onWarning,
              fontWeight: 600,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.info,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.onInfo,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.danger,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.onDanger,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOutlineButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.primary,
            splashColor: contentTheme.primary.withOpacity(0.1),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.primary,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.secondary,
            splashColor: contentTheme.secondary.withOpacity(0.1),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.secondary,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.success,
            splashColor: contentTheme.success.withOpacity(0.1),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.success,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.warning,
            splashColor: contentTheme.warning.withOpacity(0.1),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.warning,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.info,
            splashColor: contentTheme.info.withOpacity(0.1),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.info,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.danger,
            splashColor: contentTheme.danger.withOpacity(0.1),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.danger,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSoftButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.primary,
            backgroundColor: contentTheme.primary.withOpacity(0.12),
            splashColor: contentTheme.primary.withOpacity(0.2),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.primary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.secondary,
            backgroundColor: contentTheme.secondary.withOpacity(0.12),
            splashColor: contentTheme.secondary.withOpacity(0.2),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.secondary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.success,
            backgroundColor: contentTheme.success.withOpacity(0.12),
            splashColor: contentTheme.success.withOpacity(0.2),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.success,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.warning,
            backgroundColor: contentTheme.warning.withOpacity(0.12),
            splashColor: contentTheme.warning.withOpacity(0.2),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.warning,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.info,
            backgroundColor: contentTheme.info.withOpacity(0.12),
            splashColor: contentTheme.info.withOpacity(0.2),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.info,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.danger,
            backgroundColor: contentTheme.danger.withOpacity(0.12),
            splashColor: contentTheme.danger.withOpacity(0.2),
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.danger,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton.text(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.primary,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            splashColor: contentTheme.secondary.withOpacity(0.1),
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.secondary,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            splashColor: contentTheme.success.withOpacity(0.1),
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.success,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            splashColor: contentTheme.warning.withOpacity(0.1),
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.warning,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            splashColor: contentTheme.info.withOpacity(0.1),
            child: MyText.bodySmall('Info', color: contentTheme.info),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            splashColor: contentTheme.danger.withOpacity(0.1),
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.danger,
            ),
          ),
        ],
      ),
    );
  }

  //--------------> Rounded Buttons <--------------//

  Widget buildElevatedRoundedButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.onPrimary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.secondary,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.onSecondary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.success,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.onSuccess,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.warning,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.onWarning,
              fontWeight: 600,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.info,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.onInfo,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 6,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.danger,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.onDanger,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRoundedButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            // padding: MySpacing.xy(12, 8),

            backgroundColor: contentTheme.primary,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.onPrimary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.secondary,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.onSecondary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.success,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.onSuccess,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.warning,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.onWarning,
              fontWeight: 600,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.info,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.onInfo,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.danger,
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.onDanger,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOutlineRoundedButton() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.primary,
            splashColor: contentTheme.primary.withOpacity(0.1),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.primary,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.secondary,
            splashColor: contentTheme.secondary.withOpacity(0.1),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.secondary,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.success,
            splashColor: contentTheme.success.withOpacity(0.1),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.success,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.warning,
            splashColor: contentTheme.warning.withOpacity(0.1),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.warning,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.info,
            splashColor: contentTheme.info.withOpacity(0.1),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.info,
            ),
          ),
          MyButton.outlined(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.danger,
            splashColor: contentTheme.danger.withOpacity(0.1),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.danger,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSoftRoundedButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.primary,
            backgroundColor: contentTheme.primary.withOpacity(0.12),
            splashColor: contentTheme.primary.withOpacity(0.2),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.primary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.secondary,
            backgroundColor: contentTheme.secondary.withOpacity(0.12),
            splashColor: contentTheme.secondary.withOpacity(0.2),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.secondary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.success,
            backgroundColor: contentTheme.success.withOpacity(0.12),
            splashColor: contentTheme.success.withOpacity(0.2),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.success,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.warning,
            backgroundColor: contentTheme.warning.withOpacity(0.12),
            splashColor: contentTheme.warning.withOpacity(0.2),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.warning,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.info,
            backgroundColor: contentTheme.info.withOpacity(0.12),
            splashColor: contentTheme.info.withOpacity(0.2),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.info,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            borderColor: contentTheme.danger,
            backgroundColor: contentTheme.danger.withOpacity(0.12),
            splashColor: contentTheme.danger.withOpacity(0.2),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.danger,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextRoundedButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            borderRadiusAll: 20,
            child: MyText.bodySmall(
              'primary'.tr(),
              color: contentTheme.primary,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            borderRadiusAll: 20,
            splashColor: contentTheme.secondary.withOpacity(0.1),
            child: MyText.bodySmall(
              'secondary'.tr(),
              color: contentTheme.secondary,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            borderRadiusAll: 20,
            splashColor: contentTheme.success.withOpacity(0.1),
            child: MyText.bodySmall(
              'success'.tr(),
              color: contentTheme.success,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            borderRadiusAll: 20,
            splashColor: contentTheme.warning.withOpacity(0.1),
            child: MyText.bodySmall(
              'warning'.tr(),
              color: contentTheme.warning,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            borderRadiusAll: 20,
            splashColor: contentTheme.info.withOpacity(0.1),
            child: MyText.bodySmall(
              'info'.tr(),
              color: contentTheme.info,
            ),
          ),
          MyButton.text(
            onPressed: () {},
            padding: MySpacing.xy(20, 16),
            borderRadiusAll: 20,
            splashColor: contentTheme.danger.withOpacity(0.1),
            child: MyText.bodySmall(
              'danger'.tr(),
              color: contentTheme.danger,
            ),
          ),
        ],
      ),
    );
  }

  //-----------Sized Buttons------------//

  Widget buildSizedButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(8, 6),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.labelSmall(
              'small'.tr(),
              color: contentTheme.onPrimary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(20, 16),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'medium'.tr(),
              color: contentTheme.onPrimary,
            ),
          ),
          MyButton(
            onPressed: () {},
            elevation: 0,
            padding: MySpacing.xy(40, 24),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: AppStyle.buttonRadius.medium,
            child: MyText.bodySmall(
              'large'.tr(),
              color: contentTheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  //-----------Group Buttons------------//

  Widget buildGroupButtons() {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          MySpacing.height(16),
          ToggleButtons(
            splashColor: theme.colorScheme.primary.withAlpha(48),
            color: theme.colorScheme.onBackground,
// fillColor: theme.colorScheme.primary.withAlpha(48),
            selectedBorderColor: theme.colorScheme.primary.withAlpha(48),
            borderRadius: BorderRadius.all(
                Radius.circular(AppStyle.containerRadius.small)),
            isSelected: controller.selected,
            onPressed: controller.onSelect,
            children: <Widget>[
              Icon(
                Icons.wb_sunny_outlined,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              Icon(
                Icons.dark_mode_outlined,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              Icon(
                Icons.brightness_6_outlined,
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ],
          ),
          MySpacing.height(16),
          ToggleButtons(
            splashColor: theme.colorScheme.primary.withAlpha(48),
            color: theme.colorScheme.onBackground,
            selectedBorderColor: theme.colorScheme.primary.withAlpha(48),
            borderRadius: BorderRadius.all(
                Radius.circular(AppStyle.containerRadius.small)),
            isSelected: controller.selected,
            onPressed: controller.onSelect,
            children: <Widget>[
              Padding(
                padding: MySpacing.x(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.wb_sunny_outlined,
                      color: theme.colorScheme.primary,
                      size: 24,
                    ),
                    MySpacing.width(8),
                    MyText.labelLarge(
                      'light'.tr(),
                      color: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
              Padding(
                padding: MySpacing.x(12),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.moon,
                      color: theme.colorScheme.primary,
                      size: 24,
                    ),
                    MySpacing.width(8),
                    MyText.labelLarge(
                      'dark'.tr(),
                      color: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
              Padding(
                padding: MySpacing.x(12),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.sunMoon,
                      color: theme.colorScheme.primary,
                      size: 24,
                    ),
                    MySpacing.width(8),
                    MyText.labelLarge(
                      'system'.tr(),
                      color: theme.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
