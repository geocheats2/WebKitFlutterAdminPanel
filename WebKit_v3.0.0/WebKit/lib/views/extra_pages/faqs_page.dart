import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/extra_pages/faqs_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
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

class FaqsPage extends StatefulWidget {
  const FaqsPage({Key? key}) : super(key: key);

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late FaqsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FaqsController());
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
                      "faqs".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(
                            name: 'extra_pages'.tr().capitalizeWords),
                        MyBreadcrumbItem(name: 'faqs'.tr(), active: true),
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
                      sizes: "lg-10",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText.titleLarge(
                                "FAQs",
                                fontWeight: 600,
                                fontSize: 40,
                              ),
                              MyButton(
                                onPressed: () {},
                                elevation: 0,
                                padding: MySpacing.xy(20, 16),
                                borderColor: contentTheme.primary,
                                backgroundColor:
                                    contentTheme.primary.withAlpha(28),
                                splashColor: contentTheme.primary.withAlpha(28),
                                borderRadiusAll: AppStyle.buttonRadius.medium,
                                child: Row(
                                  children: [
                                    MyText.bodySmall(
                                      'Documentation',
                                      color: contentTheme.primary,
                                    ),
                                    MySpacing.width(8),
                                    Icon(
                                      LucideIcons.externalLink,
                                      color: contentTheme.primary,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          MySpacing.height(16),
                          MyText.bodyMedium(
                            controller.dummyTexts[1],
                            maxLines: 2,
                            xMuted: true,
                            fontSize: 12,
                          ),
                          MySpacing.height(80),
                          Padding(
                            padding: MySpacing.all(16),
                            child: MyFlex(
                              wrapAlignment: WrapAlignment.center,
                              wrapCrossAlignment: WrapCrossAlignment.center,
                              children: [
                                MyFlexItem(
                                    sizes: "lg-6 md-12",
                                    child: Column(
                                      children: [
                                        buildFAQItem(
                                            "what_is_lorem_ipsum?".tr(),
                                            controller.dummyTexts[1],
                                            LucideIcons.smile),
                                        MySpacing.height(28),
                                        buildFAQItem(
                                            "why_use_lorem_ipsum?".tr(),
                                            controller.dummyTexts[1],
                                            LucideIcons.files),
                                        MySpacing.height(28),
                                        buildFAQItem(
                                            "how_many_variations_exist?".tr(),
                                            controller.dummyTexts[1],
                                            LucideIcons.users),
                                        MySpacing.height(28),
                                        buildFAQItem(
                                            "What_is_lorem_ipsum?".tr(),
                                            controller.dummyTexts[1],
                                            LucideIcons.folder),
                                      ],
                                    )),
                                MyFlexItem(
                                    sizes: "lg-6 md-12",
                                    child: Column(
                                      children: [
                                        buildFAQItem(
                                            "is_safe_use_lorem_ipsum?".tr(),
                                            controller.dummyTexts[1],
                                            LucideIcons.database),
                                        MySpacing.height(28),
                                        buildFAQItem(
                                            "when_can_be_used?".tr(),
                                            controller.dummyTexts[1],
                                            LucideIcons.userPlus),
                                        MySpacing.height(28),
                                        buildFAQItem(
                                            "license_&_copyright"
                                                .tr()
                                                .capitalizeWords,
                                            controller.dummyTexts[1],
                                            LucideIcons.play),
                                        MySpacing.height(28),
                                        buildFAQItem(
                                            "is_safe_use_lorem_ipsum?".tr(),
                                            controller.dummyTexts[1],
                                            LucideIcons.mail),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          MySpacing.height(60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(
                                onPressed: () {},
                                elevation: 0,
                                padding: MySpacing.xy(20, 16),
                                backgroundColor: contentTheme.success,
                                borderRadiusAll: AppStyle.buttonRadius.medium,
                                child: Row(
                                  children: [
                                    Icon(
                                      LucideIcons.phone,
                                      size: 14,
                                      color: contentTheme.onSuccess,
                                    ),
                                    MySpacing.width(10),
                                    MyText.bodySmall(
                                      'contact_us'.tr().capitalizeWords,
                                      color: contentTheme.onSuccess,
                                    ),
                                  ],
                                ),
                              ),
                              MySpacing.width(16),
                              MyButton(
                                onPressed: () {},
                                elevation: 0,
                                padding: MySpacing.xy(20, 16),
                                backgroundColor: contentTheme.primary,
                                borderRadiusAll: AppStyle.buttonRadius.medium,
                                child: Row(
                                  children: [
                                    Icon(
                                      LucideIcons.mail,
                                      size: 14,
                                      color: contentTheme.onPrimary,
                                    ),
                                    MySpacing.width(12),
                                    MyText.bodySmall(
                                      'email_us_your_question'.tr(),
                                      color: contentTheme.onSuccess,
                                    ),
                                  ],
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
            ],
          );
        },
      ),
    );
  }

  Widget buildFAQItem(String title, String description, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyContainer(
          height: 30,
          width: 30,
          paddingAll: 0,
          color: contentTheme.primary.withAlpha(28),
          child: Center(
              child: Icon(
            icon,
            size: 16,
            color: contentTheme.primary,
          )),
        ),
        MySpacing.width(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.labelLarge(
                title,
              ),
              MySpacing.height(4),
              MyText.bodySmall(
                description,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
