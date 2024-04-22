import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/ui/nft_dashboard_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
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
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/layout.dart';

class NFTDashboardScreen extends StatefulWidget {
  const NFTDashboardScreen({super.key});

  @override
  State<NFTDashboardScreen> createState() => _NFTDashboardScreenState();
}

class _NFTDashboardScreenState extends State<NFTDashboardScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late NFTDashboardController controller;
  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 12);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    if (mounted) {
      const reduceSeconds = 1;

      final seconds = myDuration.inSeconds - reduceSeconds;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(NFTDashboardController());
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    debugPrint("$hours : $minutes : $seconds");
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
                      "NFT Dashboard",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "NFT"),
                        MyBreadcrumbItem(name: "Dashboard", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(
                  flexSpacing,
                ),
                child: MyFlex(
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: 'lg-8',
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            child: MyCard(
                              paddingAll: 0,
                              shadow: MyShadow(elevation: 0.5),
                              child: MyFlex(
                                contentPadding: false,
                                children: [
                                  MyFlexItem(
                                    sizes: 'lg-6',
                                    child: MyContainer(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText.titleLarge(
                                                  "Blue and Coral Abstract",
                                                  fontSize: 28,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                MySpacing.height(12),
                                                Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        MyText.bodyMedium(
                                                          "Current Bid",
                                                          fontWeight: 600,
                                                        ),
                                                        MyText.bodyLarge(
                                                          "1.69 ETH",
                                                          fontSize: 16,
                                                        ),
                                                        MyText.bodyMedium(
                                                          "\$ 40.065",
                                                          fontWeight: 600,
                                                        ),
                                                      ],
                                                    ),
                                                    MySpacing.width(20),
                                                    Column(
                                                      children: [
                                                        MyText.bodyMedium(
                                                          "Action Ending in",
                                                          fontWeight: 600,
                                                        ),
                                                        MySpacing.height(8),
                                                        buildTimerContainer(
                                                          hours,
                                                          minutes,
                                                          seconds,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                MySpacing.height(12),
                                                MyButton(
                                                  onPressed: () {},
                                                  elevation: 0,
                                                  padding: MySpacing.xy(20, 16),
                                                  backgroundColor:
                                                      contentTheme.primary,
                                                  borderRadiusAll: AppStyle
                                                      .buttonRadius.medium,
                                                  child: MyText.bodySmall(
                                                    "View Collection",
                                                    fontSize: 12,
                                                    color:
                                                        contentTheme.onPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  MyFlexItem(
                                    sizes: 'lg-6',
                                    child: MyContainer(
                                      height: 200,
                                      paddingAll: 0,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        Images.nft[0],
                                        fit: BoxFit.cover,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText.bodyMedium(
                                      "Hot Collection",
                                      fontSize: 20,
                                      fontWeight: 600,
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      borderColor: contentTheme.primary,
                                      backgroundColor: contentTheme.primary
                                          .withOpacity(0.12),
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: Row(
                                        children: [
                                          MyText.bodySmall(
                                            'View All',
                                            fontWeight: 600,
                                            color: contentTheme.primary,
                                          ),
                                          MySpacing.width(8),
                                          Icon(
                                            LucideIcons.arrowRight,
                                            color: contentTheme.primary,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                MySpacing.height(20),
                                buildHotCollection(),
                              ],
                            ),
                          ),
                          MyFlexItem(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText.bodyMedium(
                                      "Hot Bids",
                                      fontSize: 20,
                                      fontWeight: 600,
                                    ),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      borderColor: contentTheme.primary,
                                      backgroundColor: contentTheme.primary
                                          .withOpacity(0.12),
                                      splashColor:
                                          contentTheme.primary.withOpacity(0.2),
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: Row(
                                        children: [
                                          MyText.bodySmall(
                                            'View All',
                                            fontWeight: 600,
                                            color: contentTheme.primary,
                                          ),
                                          MySpacing.width(8),
                                          Icon(
                                            LucideIcons.arrowRight,
                                            color: contentTheme.primary,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                MySpacing.height(20),
                                buildHotBids(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-4",
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText.bodyMedium(
                                        "History",
                                        fontSize: 20,
                                        fontWeight: 600,
                                      ),
                                      MyButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        borderColor: contentTheme.primary,
                                        backgroundColor: contentTheme.primary
                                            .withOpacity(0.12),
                                        splashColor: contentTheme.primary
                                            .withOpacity(0.2),
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: Row(
                                          children: [
                                            MyText.bodySmall(
                                              'View All',
                                              fontWeight: 600,
                                              color: contentTheme.primary,
                                            ),
                                            MySpacing.width(8),
                                            Icon(
                                              LucideIcons.arrowRight,
                                              color: contentTheme.primary,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  SizedBox(
                                    height: 275,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.nftDashboards.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            MyContainer.rounded(
                                              paddingAll: 0,
                                              height: 40,
                                              child: Image.asset(
                                                  Images.avatars[0]),
                                            ),
                                            MySpacing.width(12),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText.bodyMedium(controller
                                                    .nftDashboards[index].name),
                                                MyText.bodyMedium(
                                                  "${controller.nftDashboards[index].ETH} ETH",
                                                  fontWeight: 600,
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 16,
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              child: Column(
                                children: [
                                  MyText.bodyMedium(
                                    controller.dummyTexts[0],
                                  ),
                                  MySpacing.height(16),
                                  Row(
                                    children: [
                                      MyButton.outlined(
                                        onPressed: () {},
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        borderColor: contentTheme.primary,
                                        splashColor: contentTheme.primary
                                            .withOpacity(0.1),
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: MyText.bodySmall(
                                          'View Artwork',
                                          color: contentTheme.primary,
                                        ),
                                      ),
                                      MySpacing.width(12),
                                      MyButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: MyText.bodySmall(
                                          "Place a bid",
                                          fontSize: 12,
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
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

  Widget buildTimerContainer(String hours, String minutes, String seconds) {
    return Row(
      children: [
        MyContainer.bordered(
          height: 28,
          width: 28,
          paddingAll: 0,
          child: Center(
            child: MyText.bodyMedium(hours),
          ),
        ),
        MySpacing.width(8),
        MyText.bodySmall(":"),
        MySpacing.width(8),
        MyContainer.bordered(
          height: 28,
          width: 28,
          paddingAll: 0,
          child: Center(
            child: MyText.bodyMedium(minutes),
          ),
        ),
        MySpacing.width(8),
        MyText.bodySmall(":"),
        MySpacing.width(8),
        MyContainer.bordered(
          height: 28,
          width: 28,
          paddingAll: 0,
          child: Center(
            child: MyText.bodyMedium(seconds),
          ),
        ),
      ],
    );
  }

  Widget buildHotCollection() {
    return Container(
      height: 150,
      clipBehavior: Clip.none,
      child: ListView.separated(
        shrinkWrap: true,
        clipBehavior: Clip.none,
        itemCount: controller.nftDashboards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MyCard(
            shadow: MyShadow(elevation: 0.5),
            width: 250,
            paddingAll: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    MyContainer(
                      height: 75,
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      enableBorderRadius: false,
                      child: Image.asset(
                        controller.nftDashboards[index].image,
                        fit: BoxFit.fitWidth,
                        opacity: AlwaysStoppedAnimation(0.7),
                      ),
                    ),
                    MyContainer(
                      color: contentTheme.primary.withAlpha(10),
                      height: 75,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText.bodyMedium(
                            controller.nftDashboards[index].name,
                            fontWeight: 600,
                            fontSize: 16,
                          ),
                          MyText.bodyMedium(
                              "${controller.nftDashboards[index].number} items"),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.center,
                    child: MyContainer.rounded(
                      paddingAll: 0,
                      height: 80,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        controller.nftDashboards[index].cartoonImage,
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget buildHotBids() {
    return Container(
      height: 300,
      clipBehavior: Clip.none,
      child: ListView.separated(
        shrinkWrap: true,
        clipBehavior: Clip.none,
        itemCount: controller.nftDashboards.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MyCard(
            shadow: MyShadow(elevation: 0.5),
            height: 300,
            width: 340,
            paddingAll: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    MyContainer(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      paddingAll: 0,
                      child: Image.asset(
                        controller.nftDashboards[index].image,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    MyContainer(
                      height: 100,
                      color: contentTheme.primary.withAlpha(30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyContainer(
                            paddingAll: 0,
                            height: 50,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              Images.avatars[0],
                            ),
                          ),
                          MySpacing.width(12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MyText.bodyMedium(
                                controller.nftDashboards[index].name,
                                fontWeight: 600,
                              ),
                              MyText.bodyMedium(
                                  "${controller.nftDashboards[index].item} items")
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: MySpacing.top(100),
                  child: MyContainer(
                    paddingAll: 0,
                    height: 54,
                    width: 310,
                    child: Center(
                      child: Padding(
                        padding: MySpacing.xy(12, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodyMedium("Sale ends in"),
                                MyText.bodyMedium(
                                  "${controller.nftDashboards[index].number} days",
                                  fontWeight: 600,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MyText.bodyMedium("Current Bid"),
                                MyText.bodyMedium(
                                  "${controller.nftDashboards[index].ETH} ETH",
                                  fontWeight: 600,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 16,
          );
        },
      ),
    );
  }
}
