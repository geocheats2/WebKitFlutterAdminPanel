import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/apps/project/project_detail_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
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
import 'package:webkit/helpers/widgets/my_list_extension.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/layout.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({Key? key}) : super(key: key);

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail>
    with SingleTickerProviderStateMixin, UIMixin {
  late ProjectDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProjectDetailController());
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
                      "Project Detail",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Projects'),
                        MyBreadcrumbItem(name: 'Project Detail', active: true),
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
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: "xxl-3 xl-3 md-6 sm-12",
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              padding: MySpacing.xy(20, 24),
                              child: buildProjectState(
                                contentTheme.primary,
                                LucideIcons.menu,
                                942,
                                "Total Task",
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: "xxl-3 xl-3 md-6 sm-12",
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              padding: MySpacing.xy(20, 24),
                              child: buildProjectState(
                                contentTheme.warning,
                                LucideIcons.checkCircle,
                                328,
                                "Total Task Complete",
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: "xxl-3 xl-3 sm-6",
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              padding: MySpacing.xy(20, 24),
                              child: buildProjectState(
                                contentTheme.success,
                                LucideIcons.users,
                                17,
                                "Total Team Size",
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: "xxl-3 xl-3 sm-6",
                            child: MyCard(
                              shadow: MyShadow(elevation: 0.5),
                              padding: MySpacing.xy(20, 24),
                              child: buildProjectState(
                                contentTheme.pink,
                                LucideIcons.clock4,
                                412,
                                "Total Hours Spent",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: "lg-8",
                            child: MyFlex(
                              contentPadding: false,
                              children: [
                                MyFlexItem(
                                  sizes: "lg-12",
                                  child: MyCard(
                                    shadow: MyShadow(elevation: 0.5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: MyText.titleLarge(
                                                "App design and development",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            MyContainer.none(
                                              paddingAll: 8,
                                              borderRadiusAll: 5,
                                              child: PopupMenuButton(
                                                offset: const Offset(0, 10),
                                                elevation: 1,
                                                position:
                                                    PopupMenuPosition.under,
                                                itemBuilder:
                                                    (BuildContext context) => [
                                                  PopupMenuItem(
                                                      padding:
                                                          MySpacing.xy(16, 8),
                                                      height: 10,
                                                      child: Row(children: [
                                                        const Icon(
                                                          LucideIcons.edit,
                                                          size: 16,
                                                        ),
                                                        MySpacing.width(8),
                                                        MyText.bodySmall("Edit")
                                                      ])),
                                                  PopupMenuItem(
                                                      padding:
                                                          MySpacing.xy(16, 8),
                                                      height: 10,
                                                      child: Row(children: [
                                                        const Icon(
                                                            LucideIcons.trash,
                                                            size: 16),
                                                        MySpacing.width(8),
                                                        MyText.bodySmall(
                                                            "Delete")
                                                      ])),
                                                  PopupMenuItem(
                                                      padding:
                                                          MySpacing.xy(16, 8),
                                                      height: 10,
                                                      child: Row(children: [
                                                        const Icon(
                                                            LucideIcons.mail,
                                                            size: 16),
                                                        MySpacing.width(8),
                                                        MyText.bodySmall(
                                                            "Invite")
                                                      ])),
                                                  PopupMenuItem(
                                                      padding:
                                                          MySpacing.xy(16, 8),
                                                      height: 10,
                                                      child: Row(children: [
                                                        const Icon(
                                                            LucideIcons.logOut,
                                                            size: 16),
                                                        MySpacing.width(8),
                                                        MyText.bodySmall(
                                                            "Leave")
                                                      ])),
                                                ],
                                                child: const Icon(
                                                  LucideIcons.moreVertical,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        MySpacing.height(16),
                                        MyContainer(
                                          paddingAll: 0,
                                          borderRadiusAll: 12,
                                          color: contentTheme.primary
                                              .withAlpha(28),
                                          child: Padding(
                                            padding: MySpacing.xy(8, 2),
                                            child: MyText.bodyMedium(
                                              "Complete",
                                              fontSize: 12,
                                              fontWeight: 600,
                                              color: contentTheme.primary,
                                            ),
                                          ),
                                        ),
                                        MySpacing.height(16),
                                        MyText.titleMedium(
                                          "Project Reviews :",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(16),
                                        MyText.bodyMedium(
                                          controller.dummyTexts[1],
                                          muted: true,
                                          maxLines: 3,
                                        ),
                                        MySpacing.height(16),
                                        MyText.bodyMedium(
                                          controller.dummyTexts[2],
                                          muted: true,
                                          maxLines: 3,
                                        ),
                                        MySpacing.height(16),
                                        MyText.titleMedium(
                                          "Tags",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(16),
                                        Wrap(
                                          runSpacing: 20,
                                          children: [
                                            buildTagsContainer("HTML"),
                                            MySpacing.width(8),
                                            buildTagsContainer("CSS"),
                                            MySpacing.width(8),
                                            buildTagsContainer("BOOTSTRAP"),
                                            MySpacing.width(8),
                                            buildTagsContainer("JQUERY"),
                                            MySpacing.width(8),
                                            buildTagsContainer("Dart"),
                                            MySpacing.width(8),
                                            buildTagsContainer("Flutter"),
                                          ],
                                        ),
                                        MySpacing.height(20),
                                        Wrap(
                                          runSpacing: 20,
                                          spacing: 40,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText.titleMedium(
                                                    "Start Data"),
                                                MySpacing.height(8),
                                                MyText.bodyMedium(
                                                  "17 March 2019 1:00 PM",
                                                  muted: true,
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText.titleMedium("End Data"),
                                                MySpacing.height(8),
                                                MyText.bodyMedium(
                                                  "22 December 2019 1:00 PM",
                                                  muted: true,
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText.titleMedium("Budget"),
                                                MySpacing.height(8),
                                                MyText.bodyMedium(
                                                  "\$15,800",
                                                  muted: true,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        MySpacing.height(16),
                                        MyText.titleMedium(
                                          "Team Members",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(16),
                                        Row(
                                          children: controller.images
                                              .mapIndexed(
                                                (index, element) =>
                                                    MyContainer.roundBordered(
                                                  marginAll: 4,
                                                  paddingAll: 2,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.asset(
                                                      element,
                                                      height: 32,
                                                      width: 32,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                MyFlexItem(
                                  child: MyCard(
                                    shadow: MyShadow(elevation: 0.5),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: MyText.titleLarge(
                                                "Comments (258)",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            MyContainer.none(
                                              paddingAll: 8,
                                              borderRadiusAll: 5,
                                              child: PopupMenuButton(
                                                offset: const Offset(0, 10),
                                                elevation: 1,
                                                position:
                                                    PopupMenuPosition.under,
                                                itemBuilder:
                                                    (BuildContext context) => [
                                                  PopupMenuItem(
                                                      padding:
                                                          MySpacing.xy(16, 8),
                                                      height: 10,
                                                      child: MyText.bodySmall(
                                                          "Latest")),
                                                  PopupMenuItem(
                                                      padding:
                                                          MySpacing.xy(16, 8),
                                                      height: 10,
                                                      child: MyText.bodySmall(
                                                          "Popular")),
                                                ],
                                                child: const Icon(
                                                  LucideIcons.moreVertical,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        MySpacing.height(16),
                                        MyContainer.bordered(
                                          paddingAll: 0,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 3,
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        style:
                                                            BorderStyle.none),
                                                  ),
                                                  hintText:
                                                      "Write somethings...",
                                                  hintStyle:
                                                      MyTextStyle.bodySmall(
                                                          xMuted: true),
                                                  contentPadding:
                                                      MySpacing.all(16),
                                                  isCollapsed: true,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                ),
                                              ),
                                              MyContainer.none(
                                                padding: MySpacing.xy(16, 12),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              LucideIcons
                                                                  .contact,
                                                              color:
                                                                  contentTheme
                                                                      .primary,
                                                              size: 16,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              LucideIcons
                                                                  .mapPin,
                                                              color:
                                                                  contentTheme
                                                                      .primary,
                                                              size: 16,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              LucideIcons
                                                                  .camera,
                                                              color:
                                                                  contentTheme
                                                                      .primary,
                                                              size: 16,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              LucideIcons.smile,
                                                              color:
                                                                  contentTheme
                                                                      .primary,
                                                              size: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    MyButton(
                                                      onPressed: () {},
                                                      elevation: 0,
                                                      padding:
                                                          MySpacing.xy(16, 12),
                                                      backgroundColor:
                                                          contentTheme.primary,
                                                      borderRadiusAll: AppStyle
                                                          .buttonRadius.medium,
                                                      child: MyText.bodySmall(
                                                        'Post',
                                                        color: contentTheme
                                                            .onPrimary,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        MySpacing.height(16),
                                        Column(
                                          children: [
                                            MyContainer.none(
                                              padding:
                                                  MySpacing.xy(flexSpacing, 12),
                                              child: Row(
                                                children: [
                                                  MyContainer.rounded(
                                                    height: 36,
                                                    width: 36,
                                                    paddingAll: 0,
                                                    child: Image.asset(
                                                      Images.avatars[0],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  MySpacing.width(12),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      MyText.titleMedium(
                                                        "Jeremy Tomlinson",
                                                        fontWeight: 700,
                                                        fontSize: 12,
                                                      ),
                                                      MyText.titleMedium(
                                                        "${Utils.getTimeStringFromDateTime(
                                                          DateTime.now(),
                                                          showSecond: false,
                                                        )} Minutes Ago",
                                                        fontWeight: 700,
                                                        fontSize: 10,
                                                        muted: true,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            MyContainer(
                                              alignment: Alignment.center,
                                              child: MyText.bodySmall(
                                                controller.dummyTexts[0],
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 20,
                                                muted: true,
                                              ),
                                            ),
                                            MyContainer(
                                              padding: MySpacing.xy(36, 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  MyContainer.rounded(
                                                    height: 36,
                                                    width: 36,
                                                    paddingAll: 0,
                                                    child: Image.asset(
                                                      Images.avatars[0],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  MySpacing.width(16),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            MyText.bodyMedium(
                                                              "Kevina Levered ",
                                                              fontWeight: 600,
                                                            ),
                                                            Expanded(
                                                              child: MyText
                                                                  .bodySmall(
                                                                "about 2 minutes ago",
                                                                fontSize: 10,
                                                                muted: true,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        MyText.bodyMedium(
                                                          "Nice work, makes me think of The Money Pit.",
                                                          fontWeight: 600,
                                                          fontSize: 12,
                                                          muted: true,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        MySpacing.height(16),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                                LucideIcons
                                                                    .reply,
                                                                size: 16),
                                                            MySpacing.width(8),
                                                            MyText.bodySmall(
                                                              "Reply",
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
                                      ],
                                    ),
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
                                  sizes: "lg-12",
                                  child: MyCard(
                                    shadow: MyShadow(elevation: 0.5),
                                    child: SfCartesianChart(
                                        primaryXAxis: CategoryAxis(),
                                        axes: <ChartAxis>[
                                          NumericAxis(
                                              numberFormat:
                                                  NumberFormat.compact(),
                                              majorGridLines:
                                                  const MajorGridLines(
                                                      width: 0),
                                              opposedPosition: true,
                                              name: 'yAxis1',
                                              interval: 1000,
                                              minimum: 0,
                                              maximum: 7000)
                                        ],
                                        series: <ChartSeries<ChartData,
                                            String>>[
                                          ColumnSeries<ChartData, String>(
                                              color: contentTheme.primary,
                                              animationDuration: 2000,
                                              dataSource: controller.chartData,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) =>
                                                      data.yValue1,
                                              name: 'Unit Sold'),
                                          LineSeries<ChartData, String>(
                                              animationDuration: 4500,
                                              animationDelay: 2000,
                                              dataSource: controller.chartData,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) =>
                                                      data.yValue2,
                                              yAxisName: 'yAxis1',
                                              markerSettings:
                                                  const MarkerSettings(
                                                      isVisible: true),
                                              name: 'Total Transaction')
                                        ]),
                                  ),
                                ),
                                MyFlexItem(
                                  child: MyCard(
                                    shadow: MyShadow(elevation: 0.5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.titleMedium(
                                          "File",
                                        ),
                                        MySpacing.height(16),
                                        MyContainer.bordered(
                                            child: buildFile(
                                                "WebKit-file-1", 1363148)),
                                        MySpacing.height(16),
                                        MyContainer.bordered(
                                            child: buildFile(
                                                "WebKit-file-2", 10485760)),
                                        MySpacing.height(16),
                                        MyContainer.bordered(
                                            child: buildFile(
                                                "WebKit-file-3", 1610612736)),
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildFile(String text, int bytes) {
    return Row(
      children: [
        const MyContainer(
          paddingAll: 4,
          height: 32,
          width: 32,
          // color: contentTheme.warning,
          child: Icon(
            LucideIcons.folderArchive,
            size: 20,
          ),
        ),
        MySpacing.width(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodyMedium(
                text,
                fontSize: 16,
              ),
              MyText.bodyMedium(
                Utils.getStorageStringFromByte(bytes),
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(LucideIcons.download))
      ],
    );
  }

  Widget buildProjectState(
      Color color, IconData icons, double countUp, String projectStateName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyContainer.rounded(
          paddingAll: 28,
          color: color.withAlpha(28),
          child: Icon(
            icons,
            color: color,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Countup(
                begin: 0,
                end: countUp,
                duration: const Duration(seconds: 1),
                separator: ',',
                style: MyTextStyle.titleLarge(
                  fontSize: 24,
                ),
              ),
              MySpacing.height(12),
              MyText.bodyMedium(
                projectStateName,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildTagsContainer(String text) {
    return MyContainer(
      paddingAll: 0,
      color: contentTheme.primary.withAlpha(28),
      child: Padding(
        padding: MySpacing.xy(8, 2),
        child: MyText.bodyMedium(
          text,
          fontSize: 12,
          fontWeight: 600,
          color: contentTheme.primary,
        ),
      ),
    );
  }
}
