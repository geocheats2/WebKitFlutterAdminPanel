import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/ui/landing_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_list_extension.dart';
import 'package:webkit/helpers/widgets/my_responsiv.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late LandingController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(LandingController(this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder(
          init: controller,
          builder: (controller) {
            return Column(
              children: [
                MyContainer(
                  width: double.infinity,
                  color: contentTheme.primary.withAlpha(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Images.logoIcon,
                                height: 24,
                                fit: BoxFit.cover,
                                color: contentTheme.primary,
                              ),
                              MySpacing.width(8),
                              MyText.titleMedium(
                                "WEBKIT",
                                fontWeight: 600,
                                fontSize: 24,
                                letterSpacing: 2,
                                color: contentTheme.primary,
                              ),
                            ],
                          ),
                          MySpacing.width(200),
                          TabBar(
                            controller: controller.defaultTabController,
                            isScrollable: true,
                            tabs: [
                              Tab(
                                icon: MyText.bodyMedium(
                                  "Home",
                                  fontWeight:
                                      controller.defaultIndex == 0 ? 600 : 500,
                                  color: controller.defaultIndex == 0
                                      ? contentTheme.primary
                                      : null,
                                ),
                              ),
                              Tab(
                                icon: MyText.bodyMedium(
                                  "Feature",
                                  fontWeight:
                                      controller.defaultIndex == 1 ? 600 : 500,
                                  color: controller.defaultIndex == 1
                                      ? contentTheme.primary
                                      : null,
                                ),
                              ),
                              Tab(
                                icon: MyText.bodyMedium(
                                  "Pricing",
                                  fontWeight:
                                      controller.defaultIndex == 2 ? 600 : 500,
                                  color: controller.defaultIndex == 2
                                      ? contentTheme.primary
                                      : null,
                                ),
                              ),
                              Tab(
                                icon: MyText.bodyMedium(
                                  "FAQs",
                                  fontWeight:
                                      controller.defaultIndex == 3 ? 600 : 500,
                                  color: controller.defaultIndex == 3
                                      ? contentTheme.primary
                                      : null,
                                ),
                              ),
                              Tab(
                                icon: MyText.bodyMedium(
                                  "Client",
                                  fontWeight:
                                      controller.defaultIndex == 4 ? 600 : 500,
                                  color: controller.defaultIndex == 4
                                      ? contentTheme.primary
                                      : null,
                                ),
                              ),
                              Tab(
                                icon: MyText.bodyMedium(
                                  "Contact",
                                  fontWeight:
                                      controller.defaultIndex == 5 ? 600 : 500,
                                  color: controller.defaultIndex == 5
                                      ? contentTheme.primary
                                      : null,
                                ),
                              ),
                            ],
                            indicatorSize: TabBarIndicatorSize.tab,
                          ),
                          MySpacing.width(200),
                          Row(
                            children: [
                              MyButton(
                                onPressed: () {},
                                elevation: 0,
                                padding: MySpacing.xy(20, 16),
                                backgroundColor: contentTheme.primary,
                                borderRadiusAll: AppStyle.buttonRadius.medium,
                                child: Row(
                                  children: [
                                    const Icon(
                                      LucideIcons.walletCards,
                                      size: 20,
                                    ),
                                    MySpacing.width(8),
                                    MyText.bodySmall(
                                      "Purchase Now",
                                      color: contentTheme.onPrimary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      MySpacing.height(flexSpacing),
                      MyFlex(
                        children: [
                          MyFlexItem(
                            sizes: "xxl-4 xl-4 lg-6 md-6",
                            child: MyResponsive(
                              builder: (_, __, type) {
                                return Padding(
                                  padding: MySpacing.y(
                                      type == MyScreenMediaType.xxl ||
                                              type == MyScreenMediaType.xl
                                          ? 150
                                          : type == MyScreenMediaType.lg ||
                                                  type == MyScreenMediaType.md
                                              ? 150
                                              : type == MyScreenMediaType.sm
                                                  ? 100
                                                  : 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          MyContainer(
                                            borderRadiusAll: 20,
                                            paddingAll: 0,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: contentTheme.red,
                                            child: Padding(
                                              padding: MySpacing.xy(12, 4),
                                              child: MyText.bodyMedium(
                                                "New",
                                                color: contentTheme.onRed,
                                              ),
                                            ),
                                          ),
                                          MySpacing.width(12),
                                          Expanded(
                                            child: MyText.bodyMedium(
                                              "Welcome to new landing page",
                                              muted: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                      MySpacing.height(40),
                                      MyText.titleLarge(
                                        "Webkit - Responsive Web UI Kit & Dashboard Template",
                                        fontSize: 28,
                                      ),
                                      MySpacing.height(40),
                                      MyText.titleMedium(
                                        "Webkit is a fully featured dashboard and admin template comes with tones of well designed UI elements, components, widgets and pages.",
                                      ),
                                      MySpacing.height(40),
                                      Row(
                                        children: [
                                          MyButton(
                                            onPressed: () {},
                                            elevation: 0,
                                            padding: MySpacing.xy(20, 16),
                                            backgroundColor:
                                                contentTheme.primary,
                                            borderRadiusAll:
                                                AppStyle.buttonRadius.medium,
                                            child: Row(
                                              children: [
                                                MyText.bodySmall(
                                                  'Get Free Trial',
                                                  color: contentTheme.onPrimary,
                                                ),
                                                MySpacing.width(8),
                                                const Icon(
                                                  LucideIcons.arrowRight,
                                                  size: 16,
                                                )
                                              ],
                                            ),
                                          ),
                                          MySpacing.width(16),
                                          MyButton(
                                            onPressed: () {},
                                            elevation: 0,
                                            padding: MySpacing.xy(20, 16),
                                            backgroundColor: contentTheme.info,
                                            borderRadiusAll:
                                                AppStyle.buttonRadius.medium,
                                            child: MyText.bodySmall(
                                              'Check Demo',
                                              color: contentTheme.onInfo,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          MyFlexItem(
                            sizes: "xxl-4 xl-4 lg-6 md-6",
                            child: MyResponsive(
                              builder: (_, __, type) {
                                return Padding(
                                  padding: MySpacing.y(
                                      type == MyScreenMediaType.xxl ||
                                              type == MyScreenMediaType.xl
                                          ? 150
                                          : type == MyScreenMediaType.lg ||
                                                  type == MyScreenMediaType.md
                                              ? 150
                                              : type == MyScreenMediaType.sm
                                                  ? 20
                                                  : 0),
                                  child: Image.asset(
                                    Images.landing[0],
                                    fit: BoxFit.scaleDown,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                MyContainer(
                  width: double.infinity,
                  child: MyResponsive(
                    builder: (_, __, type) {
                      return Padding(
                        padding: MySpacing.xy(
                            (type == MyScreenMediaType.xxl
                                ? 200
                                : type == MyScreenMediaType.xl
                                    ? 150
                                    : type == MyScreenMediaType.lg
                                        ? 100
                                        : type == MyScreenMediaType.md
                                            ? 50
                                            : type == MyScreenMediaType.sm
                                                ? 20
                                                : 0),
                            (type == MyScreenMediaType.xxl ||
                                    type == MyScreenMediaType.xl)
                                ? 100
                                : 50),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.infinity,
                              size: 40,
                              color: contentTheme.secondary,
                            ),
                            MySpacing.height(20),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'The admin is fully ',
                                    style: MyTextStyle.getStyle(
                                      fontSize: 24,
                                      fontWeight: 600,
                                    ),
                                  ),
                                  TextSpan(
                                      text: 'Responsive ',
                                      style: MyTextStyle.getStyle(
                                          fontWeight: 600,
                                          fontSize: 24,
                                          color: contentTheme.primary)),
                                  TextSpan(
                                    text: 'and easy to ',
                                    style: MyTextStyle.getStyle(
                                        fontSize: 24, fontWeight: 600),
                                  ),
                                  TextSpan(
                                      text: 'Customize',
                                      style: MyTextStyle.getStyle(
                                          fontWeight: 600,
                                          fontSize: 24,
                                          color: contentTheme.primary)),
                                ],
                              ),
                            ),
                            MySpacing.height(16),
                            SizedBox(
                              width: 500,
                              child: MyText.bodyMedium(
                                controller.dummyTexts[0],
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            MySpacing.height(60),
                            Wrap(
                              spacing: 100,
                              runSpacing: 40,
                              children: [
                                buildCustomizeData(
                                  LucideIcons.monitor,
                                  "Responsive Layouts",
                                  controller.dummyTexts[1],
                                ),
                                buildCustomizeData(
                                  LucideIcons.command,
                                  "Based on Bootstrap UI",
                                  controller.dummyTexts[2],
                                ),
                                buildCustomizeData(
                                  LucideIcons.tv,
                                  "Creative Design",
                                  controller.dummyTexts[3],
                                ),
                                buildCustomizeData(
                                  LucideIcons.layoutGrid,
                                  "Multiple Applications",
                                  controller.dummyTexts[4],
                                ),
                                buildCustomizeData(
                                  LucideIcons.shoppingCart,
                                  "Ecommerce Pages",
                                  controller.dummyTexts[5],
                                ),
                                buildCustomizeData(
                                  LucideIcons.columns,
                                  "Multiple Layouts",
                                  controller.dummyTexts[6],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                MyContainer(
                  width: double.infinity,
                  child: Padding(
                    padding: MySpacing.y(100),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Flexible ',
                                style: MyTextStyle.getStyle(
                                  fontSize: 24,
                                  fontWeight: 600,
                                ),
                              ),
                              TextSpan(
                                  text: 'Layouts',
                                  style: MyTextStyle.getStyle(
                                      fontWeight: 600,
                                      fontSize: 24,
                                      color: contentTheme.primary)),
                            ],
                          ),
                        ),
                        MySpacing.height(flexSpacing),
                        SizedBox(
                          width: 500,
                          child: MyText.bodyMedium(
                            controller.dummyTexts[0],
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        MySpacing.height(flexSpacing),
                        MyResponsive(builder: (_, __, type) {
                          return Padding(
                            padding: MySpacing.x(
                              type == MyScreenMediaType.xxl
                                  ? 250
                                  : type == MyScreenMediaType.xl
                                      ? 150
                                      : type == MyScreenMediaType.lg
                                          ? 100
                                          : type == MyScreenMediaType.md
                                              ? 50
                                              : type == MyScreenMediaType.sm
                                                  ? 20
                                                  : 0,
                            ),
                            child: Wrap(
                              spacing: 90,
                              runSpacing: 47,
                              children: [
                                buildLayoutsData([Images.landscapeImages[0]],
                                    "Vertical Layout"),
                                buildLayoutsData([Images.landscapeImages[1]],
                                    "Horizontal Layout"),
                                buildLayoutsData([Images.landscapeImages[2]],
                                    "Detached Layout"),
                                buildLayoutsData([Images.landscapeImages[3]],
                                    "Light Sidenav Layout"),
                                buildLayoutsData([Images.landscapeImages[0]],
                                    "Boxed Layout"),
                                buildLayoutsData([Images.landscapeImages[1]],
                                    "Semi Dark Layout"),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                MyContainer(
                  width: double.infinity,
                  child: Padding(
                    padding: MySpacing.y(100),
                    child: Column(
                      children: [
                        Icon(
                          LucideIcons.heart,
                          size: 40,
                          color: contentTheme.secondary,
                        ),
                        MySpacing.height(20),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Features you'll ",
                                style: MyTextStyle.getStyle(
                                  fontSize: 24,
                                  fontWeight: 600,
                                ),
                              ),
                              TextSpan(
                                text: 'Love',
                                style: MyTextStyle.getStyle(
                                  fontWeight: 600,
                                  fontSize: 24,
                                  color: contentTheme.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MySpacing.height(flexSpacing),
                        MyText.bodyMedium(
                            "Webkit comes with next generation ui design and have multiple benefits"),
                        MySpacing.height(flexSpacing * 2),
                        MyFlex(
                          children: [
                            MyFlexItem(
                              sizes: 'xxl-4 xl-4 lg-6 md-6',
                              child: Image.asset(
                                Images.landing[1],
                                fit: BoxFit.fill,
                              ),
                            ),
                            MyFlexItem(
                              sizes: 'xxl-4 xl-4 lg-6 md-6',
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleLarge(
                                      "Inbuilt applications and pages"),
                                  MySpacing.height(16),
                                  MyText.bodyMedium(
                                    controller.dummyTexts[2],
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                  ),
                                  MySpacing.height(16),
                                  buildFeatureData(
                                    contentTheme.primary,
                                    "Projects & Tasks",
                                  ),
                                  MySpacing.height(16),
                                  buildFeatureData(
                                    contentTheme.primary,
                                    "Ecommerce Application Pages",
                                  ),
                                  MySpacing.height(16),
                                  buildFeatureData(
                                    contentTheme.primary,
                                    "Profile, pricing, invoice",
                                  ),
                                  MySpacing.height(16),
                                  buildFeatureData(
                                    contentTheme.primary,
                                    "Login, signup, forget password",
                                  ),
                                  MySpacing.height(20),
                                  MyButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: MySpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        MyText.bodySmall(
                                          'Read More',
                                          color: contentTheme.onPrimary,
                                        ),
                                        MySpacing.width(12),
                                        const Icon(LucideIcons.arrowRight)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MySpacing.height(flexSpacing * 2),
                        MyFlex(
                          children: [
                            MyFlexItem(
                              sizes: 'xxl-4 xl-4 lg-6 md-6',
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleLarge(
                                      "Inbuilt applications and pages"),
                                  MySpacing.height(16),
                                  MyText.bodyMedium(
                                    controller.dummyTexts[2],
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                  ),
                                  MySpacing.height(16),
                                  buildFeatureData(
                                    contentTheme.success,
                                    "Projects & Tasks",
                                  ),
                                  MySpacing.height(16),
                                  buildFeatureData(
                                    contentTheme.success,
                                    "Ecommerce Application Pages",
                                  ),
                                  MySpacing.height(16),
                                  buildFeatureData(
                                    contentTheme.success,
                                    "Profile, pricing, invoice",
                                  ),
                                  MySpacing.height(16),
                                  buildFeatureData(
                                    contentTheme.success,
                                    "Login, signup, forget password",
                                  ),
                                  MySpacing.height(20),
                                  MyButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: MySpacing.xy(20, 16),
                                    backgroundColor: contentTheme.success,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        MyText.bodySmall(
                                          'Read More',
                                          color: contentTheme.onSuccess,
                                        ),
                                        MySpacing.width(12),
                                        const Icon(LucideIcons.arrowRight)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MyFlexItem(
                              sizes: 'xxl-4 xl-4 lg-6 md-6',
                              child: SizedBox(
                                height: 500,
                                child: Image.asset(Images.landing[1]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MyContainer(
                  width: double.infinity,
                  child: Padding(
                    padding: MySpacing.y(100),
                    child: Column(
                      children: [
                        Icon(
                          LucideIcons.tags,
                          size: 40,
                          color: contentTheme.secondary,
                        ),
                        MySpacing.height(20),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Choose Simple ",
                                style: MyTextStyle.getStyle(
                                  fontSize: 24,
                                  fontWeight: 600,
                                ),
                              ),
                              TextSpan(
                                  text: 'Pricing',
                                  style: MyTextStyle.getStyle(
                                      fontWeight: 600,
                                      fontSize: 24,
                                      color: contentTheme.red)),
                            ],
                          ),
                        ),
                        MySpacing.height(flexSpacing),
                        SizedBox(
                          width: 500,
                          child: MyText.bodyMedium(
                            controller.dummyTexts[2],
                            maxLines: 2,
                            fontSize: 12,
                          ),
                        ),
                        MySpacing.height(flexSpacing),
                        Wrap(
                          runSpacing: 20,
                          spacing: 20,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          runAlignment: WrapAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            MyContainer.bordered(
                              width: 350,
                              child: Column(
                                children: [
                                  buildPricing(
                                      "STANDARD LICENSE",
                                      LucideIcons.user,
                                      "\$49",
                                      "10 GB Storage",
                                      "500 GB Bandwidth",
                                      "No Domain",
                                      "1 User"),
                                  MyButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: MySpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: MyText.bodySmall(
                                      'Choose Plan',
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MyContainer.bordered(
                              paddingAll: 0,
                              height: 550,
                              child: Column(
                                children: [
                                  MyContainer(
                                    paddingAll: 0,
                                    height: 25,
                                    width: 350,
                                    color: contentTheme.red.withAlpha(28),
                                    child: Center(
                                      child: MyText.bodyMedium(
                                        "Recommended",
                                        fontSize: 12,
                                        color: contentTheme.red,
                                      ),
                                    ),
                                  ),
                                  MySpacing.height(12),
                                  SizedBox(
                                    width: 350,
                                    child: Column(
                                      children: [
                                        buildPricing(
                                            "MULTIPLE LICENSE",
                                            LucideIcons.briefcase,
                                            "\$89",
                                            "50 GB Storage",
                                            "900 GB Bandwidth",
                                            "2 Domain",
                                            "10 User"),
                                        MyButton(
                                          onPressed: () {},
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          backgroundColor: contentTheme.primary,
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'Choose Plan',
                                            color: contentTheme.onPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MyContainer.bordered(
                              width: 350,
                              child: Column(
                                children: [
                                  buildPricing(
                                      "EXTENDED LICENSE",
                                      LucideIcons.user,
                                      "\$599",
                                      "100 GB Storage",
                                      "Unlimited Bandwidth",
                                      "10 Domain",
                                      "Unlimited User"),
                                  MyButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    padding: MySpacing.xy(20, 16),
                                    backgroundColor: contentTheme.primary,
                                    borderRadiusAll:
                                        AppStyle.buttonRadius.medium,
                                    child: MyText.bodySmall(
                                      'Choose Plan',
                                      color: contentTheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MyContainer(
                  width: double.infinity,
                  child: Padding(
                    padding: MySpacing.y(100),
                    child: Column(
                      children: [
                        Icon(
                          LucideIcons.messageSquare,
                          size: 40,
                          color: contentTheme.secondary,
                        ),
                        MySpacing.height(20),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Frequently Asked ",
                                style: MyTextStyle.getStyle(
                                  fontSize: 24,
                                  fontWeight: 600,
                                ),
                              ),
                              TextSpan(
                                text: "Questions",
                                style: MyTextStyle.getStyle(
                                  color: contentTheme.primary,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MySpacing.height(flexSpacing),
                        SizedBox(
                          width: 400,
                          child: MyText.bodySmall(
                            controller.dummyTexts[7],
                            maxLines: 2,
                          ),
                        ),
                        MySpacing.height(40),
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
                                    LucideIcons.mail,
                                    size: 14,
                                    color: contentTheme.onSuccess,
                                  ),
                                  MySpacing.width(10),
                                  MyText.bodySmall(
                                    'Email us your question',
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
                                    LucideIcons.twitter,
                                    size: 14,
                                    color: contentTheme.onPrimary,
                                  ),
                                  MySpacing.width(12),
                                  MyText.bodySmall(
                                    'Send us a tweet',
                                    color: contentTheme.onSuccess,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: MySpacing.top(40),
                          child: MyFlex(
                            wrapAlignment: WrapAlignment.center,
                            wrapCrossAlignment: WrapCrossAlignment.center,
                            children: [
                              MyFlexItem(
                                  sizes: 'xxl-4 xl-4 lg-6 md-6',
                                  child: Column(
                                    children: [
                                      buildFAQItem(
                                          "Can I use this template for my client?",
                                          controller.dummyTexts[1]),
                                      MySpacing.height(28),
                                      buildFAQItem(
                                          "How do I get help with the theme?",
                                          controller.dummyTexts[1]),
                                    ],
                                  )),
                              MyFlexItem(
                                  sizes: 'xxl-4 xl-4 lg-6 md-6',
                                  child: Column(
                                    children: [
                                      buildFAQItem(
                                          "Can this theme work with Wordpress?",
                                          controller.dummyTexts[1]),
                                      MySpacing.height(28),
                                      buildFAQItem(
                                          "Will you regularly give updates of Webkit?",
                                          controller.dummyTexts[1]),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyContainer(
                  width: double.infinity,
                  child: Padding(
                    padding: MySpacing.y(100),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Get In",
                                style: MyTextStyle.getStyle(
                                    fontSize: 24, fontWeight: 600),
                              ),
                              TextSpan(
                                text: ' Touch',
                                style: MyTextStyle.getStyle(
                                    fontWeight: 600,
                                    fontSize: 24,
                                    color: contentTheme.primary),
                              ),
                            ],
                          ),
                        ),
                        MySpacing.height(16),
                        SizedBox(
                          width: 500,
                          child: MyText.bodyMedium(
                            controller.dummyTexts[2],
                            maxLines: 2,
                            fontSize: 12,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        MySpacing.height(flexSpacing * 2),
                        MyFlex(
                          children: [
                            MyFlexItem(
                              sizes: "xxl-3 xl-3 lg-5 md-5",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleMedium(
                                    "Customer Support:",
                                    fontWeight: 600,
                                    muted: true,
                                  ),
                                  MySpacing.height(4),
                                  MyText.bodyMedium("+1 234 56 7894",
                                      muted: true),
                                  MySpacing.height(28),
                                  MyText.titleMedium(
                                    "Email Address:",
                                    fontWeight: 600,
                                    muted: true,
                                  ),
                                  MySpacing.height(4),
                                  MyText.bodyMedium("info@gmail.com",
                                      muted: true),
                                  MySpacing.height(28),
                                  MyText.titleMedium("Office Address:",
                                      fontWeight: 600, muted: true),
                                  MySpacing.height(4),
                                  MyText.bodyMedium(
                                      "4461 Cedar Street Moro, AR 72368",
                                      muted: true),
                                  MySpacing.height(28),
                                  MyText.titleMedium("Office Time:",
                                      fontWeight: 600, muted: true),
                                  MySpacing.height(4),
                                  MyText.bodyMedium(
                                    "9:00AM To 6:00PM",
                                    muted: true,
                                  ),
                                ],
                              ),
                            ),
                            MyFlexItem(
                              sizes: "xxl-4 xl-4 lg-6 md-6",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MyFlex(
                                    children: [
                                      MyFlexItem(
                                        sizes: "md-6 sm-12",
                                        child: buildTextField(
                                            'Your Name', "Enter your name"),
                                      ),
                                      MyFlexItem(
                                        sizes: "md-6 sm-12",
                                        child: buildTextField(
                                          "Your Email",
                                          "Enter your email",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: MySpacing.xy(12, 16),
                                    child: buildTextField(
                                        "Your subject", "Enter subject"),
                                  ),
                                  Padding(
                                    padding: MySpacing.x(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyMedium(
                                          "Message",
                                          fontWeight: 600,
                                          xMuted: true,
                                        ),
                                        MySpacing.height(8),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 3,
                                          decoration: InputDecoration(
                                            hintText: "Write somethings",
                                            hintStyle: MyTextStyle.bodySmall(
                                                xMuted: true),
                                            disabledBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            border: InputBorder.none,
                                            isCollapsed: true,
                                            filled: true,
                                            fillColor: contentTheme.secondary
                                                .withAlpha(30),
                                            focusedBorder: InputBorder.none,
                                            contentPadding: MySpacing.all(12),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: MySpacing.xy(12, 16),
                                    child: MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'Send a message',
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MyContainer(
                  borderRadiusAll: 0,
                  width: double.infinity,
                  color: contentTheme.dark,
                  child: Padding(
                    padding: MySpacing.y(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          runSpacing: 40,
                          spacing: 40,
                          alignment: WrapAlignment.center,
                          children: [
                            SizedBox(
                              width: 600,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        Images.logoIcon,
                                        height: 20,
                                      ),
                                      MySpacing.width(8),
                                      MyText.bodyMedium(
                                        "WebKit",
                                        color: contentTheme.light,
                                        fontSize: 20,
                                        fontWeight: 600,
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  SizedBox(
                                    width: 400,
                                    child: MyText.bodyMedium(
                                      controller.dummyTexts[5],
                                      maxLines: 3,
                                      color: contentTheme.light,
                                      xMuted: true,
                                    ),
                                  ),
                                  MySpacing.height(20),
                                  Row(
                                    children: [
                                      MyContainer.rounded(
                                        color:
                                            contentTheme.primary.withAlpha(28),
                                        paddingAll: 0,
                                        child: IconButton(
                                          splashRadius: 1,
                                          iconSize: 16,
                                          onPressed: () {},
                                          icon: Icon(
                                            LucideIcons.facebook,
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                      ),
                                      MySpacing.width(12),
                                      MyContainer.rounded(
                                        paddingAll: 0,
                                        color: contentTheme.red.withAlpha(28),
                                        child: IconButton(
                                          splashRadius: 1,
                                          iconSize: 16,
                                          onPressed: () {},
                                          icon: Icon(
                                            LucideIcons.instagram,
                                            color: contentTheme.red,
                                          ),
                                        ),
                                      ),
                                      MySpacing.width(12),
                                      MyContainer.rounded(
                                        color: contentTheme.info.withAlpha(28),
                                        paddingAll: 0,
                                        child: IconButton(
                                          splashRadius: 1,
                                          iconSize: 16,
                                          onPressed: () {},
                                          icon: Icon(
                                            LucideIcons.twitter,
                                            color: contentTheme.info,
                                          ),
                                        ),
                                      ),
                                      MySpacing.width(12),
                                      MyContainer.rounded(
                                        color: contentTheme.secondary
                                            .withAlpha(28),
                                        paddingAll: 0,
                                        child: IconButton(
                                          splashRadius: 1,
                                          iconSize: 16,
                                          onPressed: () {},
                                          icon: Icon(
                                            LucideIcons.github,
                                            color: contentTheme.secondary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            buildFooterData("Company", "About Us",
                                "Documentation", "Blog", "Affiliate Program"),
                            buildFooterData("Apps", "Ecommerce Pages", "Email",
                                "Social Feed", "Projects"),
                            buildFooterData("Discovery", "Help Center",
                                "Our Products", "Our Products", "Privacy")
                          ],
                        ),
                        MySpacing.height(32),
                        MyText.bodyMedium(
                          "© 2018 - 2023 Webkit. Design",
                          fontSize: 12,
                          color: contentTheme.light,
                          muted: true,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildFooterData(String footerTitle, String footerSubTitle1,
      String footerSubTitle2, String footerSubTitle3, String footerSubTitle4) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.titleMedium(footerTitle,
            fontWeight: 600, color: contentTheme.light),
        MySpacing.height(16),
        MyText.bodyMedium(footerSubTitle1,
            color: contentTheme.light, xMuted: true),
        MySpacing.height(16),
        MyText.bodyMedium(footerSubTitle2,
            color: contentTheme.light, xMuted: true),
        MySpacing.height(16),
        MyText.bodyMedium(footerSubTitle3,
            color: contentTheme.light, xMuted: true),
        MySpacing.height(16),
        MyText.bodyMedium(footerSubTitle4,
            color: contentTheme.light, xMuted: true),
      ],
    );
  }

  buildTextField(String fieldTitle, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(
          fieldTitle,
          fontWeight: 600,
          xMuted: true,
        ),
        MySpacing.height(8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            contentPadding: MySpacing.all(12),
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            isCollapsed: true,
            filled: true,
            fillColor: contentTheme.secondary.withAlpha(30),
          ),
        ),
      ],
    );
  }

  Widget buildFAQItem(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyContainer.rounded(
          height: 30,
          width: 30,
          paddingAll: 0,
          color: contentTheme.primary.withOpacity(0.12),
          child: Center(
            child: MyText(
              'Q',
              color: contentTheme.primary,
              fontWeight: 600,
            ),
          ),
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

  Widget buildPricing(
    String priceTitle,
    IconData icon,
    String price,
    String storage,
    String bandWidth,
    String domain,
    String user,
  ) {
    return Column(
      children: [
        MyText.bodyMedium(priceTitle),
        MySpacing.height(flexSpacing),
        MyContainer.rounded(
          color: contentTheme.primary.withAlpha(30),
          child: Icon(
            icon,
            color: contentTheme.primary,
          ),
        ),
        MySpacing.height(flexSpacing),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: price,
                style: MyTextStyle.bodyMedium(
                  fontSize: 24,
                  fontWeight: 600,
                ),
              ),
              TextSpan(
                text: ' /Licences',
                style: MyTextStyle.bodyMedium(
                  muted: true,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        MySpacing.height(flexSpacing),
        MyText.bodyMedium(storage),
        MySpacing.height(flexSpacing),
        MyText.bodyMedium(bandWidth),
        MySpacing.height(flexSpacing),
        MyText.bodyMedium(domain),
        MySpacing.height(flexSpacing),
        MyText.bodyMedium(user),
        MySpacing.height(flexSpacing),
        MyText.bodyMedium("Email Support"),
        MySpacing.height(flexSpacing),
        MyText.bodyMedium("24x7 Support"),
        MySpacing.height(flexSpacing),
      ],
    );
  }

  Widget buildFeatureData(Color color, String data) {
    return Row(
      children: [
        MyContainer.roundBordered(
          paddingAll: 2,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: color,
        ),
        MySpacing.width(12),
        MyText.bodyMedium(data)
      ],
    );
  }

  buildLayoutsData(List<String> images, String layoutName) {
    return Column(
      children: [
        Column(
          children: images
              .mapIndexed((index, image) => Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 1.5,
                    child: Image.asset(
                      image,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList(),
        ),
        MySpacing.height(12),
        MyText.titleMedium(
          layoutName,
          fontWeight: 600,
          // muted: true,
        )
      ],
    );
  }

  Widget buildCustomizeData(IconData icon, String name, String dummyText) {
    return Column(
      children: [
        MyContainer.rounded(
          color: contentTheme.primary.withAlpha(30),
          child: Icon(
            icon,
            color: contentTheme.primary,
          ),
        ),
        MySpacing.height(16),
        MyText.titleLarge(
          name,
          fontWeight: 600,
        ),
        MySpacing.height(16),
        SizedBox(
          width: 300,
          child: MyText.bodyMedium(
            dummyText,
            fontWeight: 600,
            muted: true,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
