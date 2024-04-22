import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/extra_pages/pricing_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class Pricing extends StatefulWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing>
    with TickerProviderStateMixin, UIMixin {
  late PricingController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(PricingController());
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
                      "Pricing",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Extra Pages'),
                        MyBreadcrumbItem(name: 'Pricing', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Column(
                children: [
                  MyText.titleLarge("Pricing", fontWeight: 600),
                  MySpacing.height(40),
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        buildTabBarItem("Monthly", 1),
                        buildTabBarItem("Annual", 2),
                      ],
                    ),
                  ),
                  MySpacing.height(60),
                  Center(
                    child: [
                      pricingCard(),
                      pricingCard()
                    ][controller.currentTabId - 1],
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildTabBarItem(text, id) {
    return Expanded(
      child: MyContainer(
        paddingAll: 12,
        onTap: () {
          setTabId(id);
        },
        borderRadiusAll: AppStyle.buttonRadius.medium,
        color: controller.currentTabId == id
            ? contentTheme.primary
            : Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
            child: MyText.bodyMedium(
          text,
          color: controller.currentTabId == id ? contentTheme.onPrimary : null,
          fontSize: 16,
          fontWeight: 600,
        )),
      ),
    );
  }

  void setTabId(id) {
    setState(() {
      controller.currentTabId = id;
    });
  }

  Widget pricingCard() {
    return Wrap(
      runSpacing: 50,
      spacing: 50,
      children: [
        SizedBox(
          height: 425,
          width: 300,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              MyCard(
                shadow: MyShadow(elevation: 0.5),
                borderRadiusAll: AppStyle.buttonRadius.medium,
                height: 415,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MySpacing.height(20),
                        controller.currentTabId % 2 == 1
                            ? MyText.titleLarge(
                                "\$56",
                                fontSize: 40,
                              )
                            : MyText.titleLarge(
                                "\$150",
                                fontSize: 40,
                              ),
                        MySpacing.height(20),
                        buildPricingCardDetail(
                          LucideIcons.check,
                          "10GB Storage",
                        ),
                        MySpacing.height(16),
                        buildPricingCardDetail(
                          LucideIcons.check,
                          "500Gb BandWidth",
                        ),
                        MySpacing.height(16),
                        buildPricingCardDetail(
                          LucideIcons.check,
                          "Domain",
                        ),
                        MySpacing.height(16),
                        buildPricingCardDetail(
                          LucideIcons.minus,
                          "0 User",
                        ),
                        MySpacing.height(16),
                        buildPricingCardDetail(
                          LucideIcons.minus,
                          "Email Support",
                        ),
                        MySpacing.height(16),
                        buildPricingCardDetail(
                          LucideIcons.minus,
                          "API Access",
                        ),
                        MySpacing.height(16),
                        MyButton(
                          onPressed: () {},
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: contentTheme.primary,
                          borderRadiusAll: AppStyle.buttonRadius.medium,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText.bodySmall(
                                'Join',
                                color: contentTheme.onPrimary,
                              ),
                              MySpacing.width(8),
                              Icon(
                                LucideIcons.moveRight,
                                color: contentTheme.light,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: MyCard(
                    shadow: MyShadow(elevation: 0.5),
                    height: 30,
                    width: 110,
                    borderRadiusAll: 12,
                    paddingAll: 0,
                    child: Center(child: MyText.bodyMedium("Starter"))),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 425,
          width: 300,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              MyCard(
                shadow: MyShadow(elevation: 0.5),
                borderRadiusAll: AppStyle.buttonRadius.medium,
                height: 415,
                width: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          MySpacing.height(20),
                          controller.currentTabId % 2 == 1
                              ? MyText.titleLarge(
                                  "\$89",
                                  fontSize: 40,
                                )
                              : MyText.titleLarge(
                                  "\$200",
                                  fontSize: 40,
                                ),
                          MySpacing.height(20),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "50GB Storage",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "900Gb BandWidth",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "2 Domain",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "10 User",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.minus,
                            "Email Support",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.minus,
                            "API Access",
                          ),
                          MySpacing.height(16),
                          MyButton(
                            onPressed: () {},
                            elevation: 0,
                            padding: MySpacing.xy(20, 16),
                            backgroundColor: contentTheme.primary,
                            borderRadiusAll: AppStyle.buttonRadius.medium,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText.bodySmall(
                                  'Join',
                                  color: contentTheme.onPrimary,
                                ),
                                MySpacing.width(8),
                                Icon(
                                  LucideIcons.moveRight,
                                  color: contentTheme.light,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          contentTheme.primary,
                          contentTheme.red,
                        ],
                      ),
                    ),
                    child: Center(
                        child: MyText.bodyMedium(
                      "Premium",
                      color: contentTheme.onPrimary,
                    )),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 425,
          width: 300,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              MyCard(
                shadow: MyShadow(elevation: 0.5),
                borderRadiusAll: AppStyle.buttonRadius.medium,
                height: 415,
                width: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          MySpacing.height(20),
                          controller.currentTabId % 2 == 1
                              ? MyText.titleLarge(
                                  "\$100",
                                  fontSize: 40,
                                )
                              : MyText.titleLarge(
                                  "\$300",
                                  fontSize: 40,
                                ),
                          MySpacing.height(20),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "100GB Storage",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "Unlimited BandWidth",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "50 Domain",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "20 User",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "Email Support",
                          ),
                          MySpacing.height(16),
                          buildPricingCardDetail(
                            LucideIcons.check,
                            "API Access",
                          ),
                          MySpacing.height(16),
                          MyButton(
                            onPressed: () {},
                            elevation: 0,
                            padding: MySpacing.xy(20, 16),
                            backgroundColor: contentTheme.primary,
                            borderRadiusAll: AppStyle.buttonRadius.medium,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText.bodySmall(
                                  'Join',
                                  color: contentTheme.onPrimary,
                                ),
                                MySpacing.width(8),
                                Icon(
                                  LucideIcons.moveRight,
                                  color: contentTheme.light,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: MyCard(
                    shadow: MyShadow(elevation: 0.5),
                    height: 30,
                    width: 110,
                    borderRadiusAll: 12,
                    paddingAll: 0,
                    child: Center(child: MyText.bodyMedium("Enterprise"))),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPricingCardDetail(IconData icon, String detail) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
        ),
        MySpacing.width(8),
        MyText.bodyMedium(
          detail,
          fontWeight: 600,
          fontSize: 16,
        ),
      ],
    );
  }
}
