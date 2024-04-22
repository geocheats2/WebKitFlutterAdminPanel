import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/ui/reviews_controller.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ReviewsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ReviewsController());
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
                      "Reviews",
                      fontWeight: 600,
                      fontSize: 18,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "UI"),
                        MyBreadcrumbItem(name: "Reviews", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyFlex(
                      contentPadding: false,
                      children: [
                        MyFlexItem(
                          sizes: "xxl-3",
                          child: MyContainer(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodyMedium(
                                  "Total Reviews",
                                  fontWeight: 600,
                                ),
                                MyText.bodyMedium(
                                  "254",
                                  fontSize: 24,
                                  fontWeight: 600,
                                ),
                              ],
                            ),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xxl-3",
                          child: MyContainer(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodyMedium(
                                  "Most Popular tag",
                                  fontWeight: 600,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.bodyMedium(
                                      "Quality",
                                      fontSize: 28,
                                      fontWeight: 600,
                                    ),
                                    MyText.bodyMedium(
                                      "200 Reviews-4.5 average",
                                      fontWeight: 600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xxl-6",
                          child: MyContainer(
                            paddingAll: 4,
                            height: 200,
                            child: SfCircularChart(
                              legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.left),
                              series: <DoughnutSeries<ChartSampleData, String>>[
                                DoughnutSeries<ChartSampleData, String>(
                                    radius: '80%',
                                    explode: true,
                                    explodeOffset: '10%',
                                    dataSource: controller.doughnutChartData,
                                    xValueMapper: (ChartSampleData data, _) =>
                                        data.x as String,
                                    yValueMapper: (ChartSampleData data, _) =>
                                        data.y,
                                    dataLabelMapper:
                                        (ChartSampleData data, _) => data.text,
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: true))
                              ],
                              tooltipBehavior: TooltipBehavior(enable: true),
                            ),
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(16),
                    MyText.titleMedium(
                      "Review Growth",
                      fontWeight: 600,
                    ),
                    MySpacing.height(16),
                    MyContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MyText.bodyMedium(
                                    "2.1K",
                                    fontWeight: 600,
                                    fontSize: 24,
                                  ),
                                  MySpacing.width(8),
                                  MyText.bodyMedium(
                                    "Reviews",
                                    muted: true,
                                  )
                                ],
                              ),
                              PopupMenuButton(
                                onSelected: controller.onSelectedTimeDesign,
                                itemBuilder: (BuildContext context) {
                                  return [
                                    "Year",
                                    "Month",
                                    "Week",
                                    "Day",
                                    "hours",
                                  ].map((behavior) {
                                    return PopupMenuItem(
                                      value: behavior,
                                      height: 32,
                                      child: MyText.bodySmall(
                                        behavior.toString(),
                                        color: theme.colorScheme.onBackground,
                                        fontWeight: 600,
                                      ),
                                    );
                                  }).toList();
                                },
                                color: theme.cardTheme.color,
                                child: MyContainer.bordered(
                                  padding: MySpacing.xy(12, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      MyText.labelMedium(
                                        controller.selectedTimeDesign
                                            .toString(),
                                        color: theme.colorScheme.onBackground,
                                      ),
                                      Icon(
                                        LucideIcons.chevronDown,
                                        size: 22,
                                        color: theme.colorScheme.onBackground,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MySpacing.height(16),
                          MyText.bodyMedium(
                            "+500 (+88.55%)",
                            fontWeight: 600,
                            xMuted: true,
                          ),
                          MySpacing.height(16),
                          SfCartesianChart(
                            legend: Legend(
                                isVisible: true,
                                overflowMode: LegendItemOverflowMode.wrap,
                                position: LegendPosition.top),
                            tooltipBehavior: controller.tooltipBehavior,
                            series: <ChartSeries>[
                              SplineSeries<ChartSampleData, int>(
                                dataSource: controller.chartData1,
                                // Type of spline
                                splineType: SplineType.cardinal,
                                cardinalSplineTension: 0.9,
                                xValueMapper: (ChartSampleData data, _) =>
                                    data.x,
                                yValueMapper: (ChartSampleData data, _) =>
                                    data.y,
                              ),
                              SplineSeries<ChartSampleData, int>(
                                dataSource: controller.chartData2,
                                // Type of spline
                                splineType: SplineType.cardinal,
                                cardinalSplineTension: 0.9,
                                xValueMapper: (ChartSampleData data, _) =>
                                    data.x,
                                yValueMapper: (ChartSampleData data, _) =>
                                    data.y,
                              ),
                              SplineSeries<ChartSampleData, int>(
                                dataSource: controller.chartData3,
                                // Type of spline
                                splineType: SplineType.cardinal,
                                cardinalSplineTension: 0.9,
                                xValueMapper: (ChartSampleData data, _) =>
                                    data.x,
                                yValueMapper: (ChartSampleData data, _) =>
                                    data.y,
                              ),
                              SplineSeries<ChartSampleData, int>(
                                dataSource: controller.chartData4,
                                // Type of spline
                                splineType: SplineType.cardinal,
                                cardinalSplineTension: 0.9,
                                xValueMapper: (ChartSampleData data, _) =>
                                    data.x,
                                yValueMapper: (ChartSampleData data, _) =>
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
          );
        },
      ),
    );
  }
}
