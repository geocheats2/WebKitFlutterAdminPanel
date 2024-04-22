import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/apps/contact/profile_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/utils/utils.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/layout.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProfileController());
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
                      "Profile",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Contact"),
                        MyBreadcrumbItem(name: "Profile", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: "lg-4",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyContainer(
                              paddingAll: 0,
                              borderRadiusAll: 4,
                              height: 205,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          topLeft: Radius.circular(4)),
                                      gradient: LinearGradient(colors: [
                                        Color(0xff8360c3),
                                        Color(0xff6a82fb),
                                        Color(0xff6495ED),
                                        Color(0xff008088),
                                      ], tileMode: TileMode.repeated),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: MySpacing.x(20),
                                      child: MyContainer.rounded(
                                        paddingAll: 4,
                                        child: MyContainer.rounded(
                                          paddingAll: 0,
                                          height: 100,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.asset(
                                            Images.avatars[1],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: MySpacing.x(32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText.bodyMedium(
                                        "Amanda Smith",
                                        fontWeight: 600,
                                        fontSize: 16,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.toNamed('/contacts/edit-profile');
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          LucideIcons.edit,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MyText.bodyMedium("@amandasmith"),
                                ],
                              ),
                            ),
                            MySpacing.height(12),
                            Padding(
                              padding: MySpacing.x(32),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                runSpacing: 12,
                                spacing: 12,
                                children: [
                                  buildButton(
                                    "Design",
                                    contentTheme.primary.withAlpha(30),
                                    contentTheme.primary,
                                  ),
                                  buildButton(
                                    "Management",
                                    contentTheme.primary.withAlpha(30),
                                    contentTheme.primary,
                                  ),
                                  buildButton(
                                    "Ui Design",
                                    contentTheme.primary.withAlpha(30),
                                    contentTheme.primary,
                                  ),
                                  buildButton(
                                    "Projects",
                                    contentTheme.primary.withAlpha(30),
                                    contentTheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            MySpacing.height(12),
                            Padding(
                              padding: MySpacing.x(32),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(LucideIcons.users, size: 16),
                                  MySpacing.width(8),
                                  MyText.bodyMedium(
                                    "128 Contacts",
                                  ),
                                  MySpacing.width(12),
                                  Icon(LucideIcons.folderGit, size: 16),
                                  MySpacing.width(8),
                                  MyText.bodyMedium(
                                    "14 Projects",
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 40,
                            ),
                            Padding(
                              padding: MySpacing.left(20),
                              child: MyText.titleMedium("Inbox"),
                            ),
                            // MySpacing.height(12),
                            Padding(
                              padding: MySpacing.all(20),
                              child: SizedBox(
                                height: 315,
                                child: ListView.separated(
                                  primary: true,
                                  shrinkWrap: true,
                                  itemCount: controller.chat.length,
                                  itemBuilder: (context, index) {
                                    return MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      borderRadiusAll: 8,
                                      backgroundColor: theme
                                          .colorScheme.background
                                          .withAlpha(5),
                                      splashColor: theme
                                          .colorScheme.onBackground
                                          .withAlpha(10),
                                      child: SizedBox(
                                        height: 60,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MyContainer.rounded(
                                              height: 40,
                                              width: 40,
                                              paddingAll: 0,
                                              child: Image.asset(
                                                Images.avatars[index %
                                                    Images.avatars.length],
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            MySpacing.width(12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  MyText.labelLarge(
                                                    controller
                                                        .chat[index].firstName,
                                                  ),
                                                  SizedBox(
                                                    width: 300,
                                                    child: MyText.bodySmall(
                                                      controller
                                                          .chat[index].message,
                                                      muted: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight: 400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                MyText.bodySmall(
                                                  '${Utils.getTimeStringFromDateTime(
                                                    controller
                                                        .chat[index].sendAt,
                                                    showSecond: false,
                                                  )}',
                                                  muted: true,
                                                  fontWeight: 600,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 12,
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-8",
                      child: Column(
                        children: [
                          MyCard(
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodyLarge(
                                  "About Us",
                                  fontSize: 20,
                                  fontWeight: 600,
                                ),
                                MySpacing.height(20),
                                MyText.bodyMedium(
                                  controller.dummyTexts[5],
                                  maxLines: 3,
                                ),
                                MySpacing.height(16),
                                MyFlex(
                                  contentPadding: false,
                                  children: [
                                    MyFlexItem(
                                      sizes: "lg-6",
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                LucideIcons.mapPin,
                                                size: 20,
                                              ),
                                              MySpacing.width(8),
                                              MyText.bodyMedium(
                                                "Live at Andorra",
                                              ),
                                            ],
                                          ),
                                          MySpacing.height(16),
                                          Row(
                                            children: [
                                              const Icon(
                                                LucideIcons.mail,
                                                size: 20,
                                              ),
                                              MySpacing.width(8),
                                              MyText.bodyMedium(
                                                "demo@gmail.com",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    MyFlexItem(
                                      sizes: "lg-6 sm-12",
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                LucideIcons.briefcase,
                                                size: 20,
                                              ),
                                              MySpacing.width(8),
                                              Expanded(
                                                child: MyText.bodyMedium(
                                                  "Data Analyst at Gleichner, Mueller and Tromp",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          MySpacing.height(16),
                                          Row(
                                            children: [
                                              const Icon(
                                                LucideIcons.luggage,
                                                size: 20,
                                              ),
                                              MySpacing.width(8),
                                              Expanded(
                                                child: MyText.bodyMedium(
                                                  "Studied at Nikolaus - Leuschke",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          MySpacing.height(16),
                          MyCard(
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.titleLarge(
                                  "Social",
                                  fontWeight: 600,
                                ),
                                MySpacing.height(16),
                                MyFlex(
                                  children: [
                                    MyFlexItem(
                                      sizes: "lg-6 sm-12",
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const FaIcon(
                                                LucideIcons.facebook,
                                                color: Color(0xff3b5998),
                                              ),
                                              MySpacing.width(12),
                                              Expanded(
                                                child: MyText.bodyMedium(
                                                  "https://www.facebook.com/caitlyn.kerluke",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          MySpacing.height(16),
                                          Row(
                                            children: [
                                              const FaIcon(
                                                LucideIcons.instagram,
                                                color: Color(0xffE4405F),
                                              ),
                                              MySpacing.width(12),
                                              Expanded(
                                                child: MyText.bodyMedium(
                                                  "https://www.instagram.com/caitlyn.kerluke",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    MyFlexItem(
                                      sizes: "lg-6",
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const FaIcon(
                                                LucideIcons.linkedin,
                                                color: Color(0xff0A66C2),
                                              ),
                                              MySpacing.width(8),
                                              Expanded(
                                                child: MyText.bodyMedium(
                                                  "https://www.linkedIn.com/caitlyn.kerluke",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          MySpacing.height(16),
                                          Row(
                                            children: [
                                              const FaIcon(
                                                LucideIcons.twitter,
                                                color: Color(0xff00acee),
                                              ),
                                              MySpacing.width(8),
                                              Expanded(
                                                child: MyText.bodyMedium(
                                                  "https://www.twitter.com/caitlyn.kerluke",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          MySpacing.height(16),
                          MyCard(
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodyLarge(
                                  "Reviews",
                                  fontSize: 20,
                                  fontWeight: 600,
                                ),
                                MySpacing.height(12),
                                SfCartesianChart(
                                  primaryXAxis: NumericAxis(isInversed: true),
                                  primaryYAxis: NumericAxis(isInversed: true),
                                  tooltipBehavior: controller.tool,
                                  series: <ChartSeries<ChartData, double>>[
                                    LineSeries<ChartData, double>(
                                      dataSource: controller.chartData,
                                      markerSettings:
                                          const MarkerSettings(isVisible: true),
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
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

  Widget buildWorkHistory(String productType, String productName) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyText.bodyMedium(
                  productType,
                ),
              ],
            ),
            MyText.bodyMedium(
              productName,
            ),
          ],
        )
      ],
    );
  }

  Widget buildButton(String buttonName, Color colors, Color textColor) {
    return MyButton(
      onPressed: () {},
      elevation: 0,
      padding: MySpacing.xy(16, 8),
      borderColor: textColor,
      backgroundColor: colors,
      splashColor: colors,
      borderRadiusAll: AppStyle.buttonRadius.medium,
      child: MyText.bodySmall(
        buttonName,
        color: textColor,
      ),
    );
  }
}
