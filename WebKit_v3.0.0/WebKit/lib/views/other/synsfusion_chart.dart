import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/other/syncfusion_charts_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class SyncFusionChart extends StatefulWidget {
  const SyncFusionChart({Key? key}) : super(key: key);

  @override
  State<SyncFusionChart> createState() => _SyncFusionChartState();
}

class _SyncFusionChartState extends State<SyncFusionChart>
    with SingleTickerProviderStateMixin, UIMixin {
  late SyncfusionChartsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(SyncfusionChartsController());
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
                      "syncfusion_charts".tr().capitalizeWords,
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ui'.tr()),
                        MyBreadcrumbItem(name: 'charts'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.horizontal(flexSpacing),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer(
                        child: Column(
                          children: [
                            MyText.titleMedium("Animation delay"),
                            MySpacing.height(flexSpacing),
                            SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              tooltipBehavior: controller.chart,
                              axes: <ChartAxis>[
                                NumericAxis(
                                    numberFormat: NumberFormat.compact(),
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                    opposedPosition: true,
                                    name: 'yAxis1',
                                    interval: 1000,
                                    minimum: 0,
                                    maximum: 7000)
                              ],
                              series: <ChartSeries<ChartSampleData, String>>[
                                ColumnSeries<ChartSampleData, String>(
                                    color: contentTheme.primary,
                                    animationDuration: 2000,
                                    dataSource: controller.chartData,
                                    xValueMapper: (ChartSampleData data, _) =>
                                        data.x,
                                    yValueMapper: (ChartSampleData data, _) =>
                                        data.y,
                                    name: 'Unit Sold'),
                                LineSeries<ChartSampleData, String>(
                                    animationDuration: 4500,
                                    animationDelay: 2000,
                                    dataSource: controller.chartData,
                                    xValueMapper: (ChartSampleData data, _) =>
                                        data.x,
                                    yValueMapper: (ChartSampleData data, _) =>
                                        data.yValue,
                                    yAxisName: 'yAxis1',
                                    markerSettings:
                                        const MarkerSettings(isVisible: true),
                                    name: 'Total Transaction')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer(
                        child: Column(
                          children: [
                            MyText.titleMedium("Gradient based on values"),
                            MySpacing.height(flexSpacing),
                            SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              tooltipBehavior: controller.gradient,
                              series: <ChartSeries<ChartSampleData, String>>[
                                AreaSeries<ChartSampleData, String>(
                                  dataSource: controller.gradientChartData,
                                  onCreateShader: (ShaderDetails details) {
                                    return ui.Gradient.linear(
                                        details.rect.bottomLeft,
                                        details.rect.bottomRight, <Color>[
                                      const Color.fromRGBO(116, 182, 194, 1),
                                      const Color.fromRGBO(75, 189, 138, 1),
                                      const Color.fromRGBO(75, 189, 138, 1),
                                      const Color.fromRGBO(255, 186, 83, 1),
                                      const Color.fromRGBO(255, 186, 83, 1),
                                      const Color.fromRGBO(194, 110, 21, 1),
                                      const Color.fromRGBO(194, 110, 21, 1),
                                      const Color.fromRGBO(116, 182, 194, 1),
                                    ], <double>[
                                      0.1,
                                      0.1,
                                      0.4,
                                      0.4,
                                      0.7,
                                      0.7,
                                      0.9,
                                      0.9
                                    ]);
                                  },
                                  xValueMapper: (ChartSampleData data, _) =>
                                      data.x,
                                  yValueMapper: (ChartSampleData data, _) =>
                                      data.y,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer(
                        child: Column(
                          children: [
                            MyText.titleMedium("Bubble Chart"),
                            MySpacing.height(flexSpacing),
                            SfCartesianChart(
                                plotAreaBorderWidth: 0,
                                primaryXAxis: NumericAxis(
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                    minimum: 60,
                                    maximum: 100),
                                tooltipBehavior: controller.tooltipBehavior,
                                series: <BubbleSeries<ChartSampleData, num>>[
                                  BubbleSeries<ChartSampleData, num>(
                                    opacity: 0.7,
                                    color: contentTheme.primary,
                                    dataSource: controller.bubbleChartData,
                                    xValueMapper: (ChartSampleData sales, _) =>
                                        sales.xValue as num,
                                    yValueMapper: (ChartSampleData sales, _) =>
                                        sales.y,
                                    sizeValueMapper:
                                        (ChartSampleData sales, _) =>
                                            sales.size,
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: "lg-6",
                            child: MyContainer(
                              child: Column(
                                children: [
                                  MyText.titleMedium("Vertical Line Chart"),
                                  MySpacing.height(flexSpacing),
                                  SfCartesianChart(
                                    isTransposed: true,
                                    tooltipBehavior: controller.vertical,
                                    primaryXAxis: CategoryAxis(),
                                    series: <ChartSeries>[
                                      SplineSeries<ChartSampleData, String>(
                                        color: contentTheme.primary,
                                        dataSource:
                                            controller.verticalSpLineChart,
                                        xValueMapper:
                                            (ChartSampleData data, _) => data.x,
                                        yValueMapper:
                                            (ChartSampleData data, _) => data.y,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: "lg-6",
                            child: MyContainer(
                              child: Column(
                                children: [
                                  MyText.titleMedium("Dashed Line Chart"),
                                  MySpacing.height(flexSpacing),
                                  SfCartesianChart(
                                    tooltipBehavior: controller.dashedSpLine,
                                    series: <ChartSeries>[
                                      SplineSeries<ChartSampleData, int>(
                                        color: contentTheme.primary,
                                        dataSource:
                                            controller.dashedSpLineChart,
                                        dashArray: const <double>[5, 5],
                                        xValueMapper:
                                            (ChartSampleData data, _) => data.x,
                                        yValueMapper:
                                            (ChartSampleData data, _) => data.y,
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
                        sizes: "lg-7",
                        child: MyContainer(
                            child: Column(
                          children: [
                            MyText.titleMedium("Range Chart"),
                            MySpacing.height(flexSpacing),
                            SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                tooltipBehavior: controller.rangeSlider,
                                series: <ChartSeries>[
                                  RangeColumnSeries<ChartSampleData, String>(
                                    color: contentTheme.primary,
                                    dataSource: controller.rangeColumnChart,
                                    xValueMapper: (ChartSampleData data, _) =>
                                        data.x,
                                    lowValueMapper: (ChartSampleData data, _) =>
                                        data.low,
                                    highValueMapper:
                                        (ChartSampleData data, _) => data.high,
                                  )
                                ]),
                          ],
                        ))),
                    MyFlexItem(
                        sizes: "lg-7",
                        child: MyContainer(
                          child: Column(
                            children: [
                              MyText.titleMedium("Doughnut Chart"),
                              MySpacing.height(flexSpacing),
                              SfCircularChart(
                                legend: Legend(
                                    isVisible: true,
                                    overflowMode: LegendItemOverflowMode.wrap,
                                    position: LegendPosition.bottom),
                                series: <DoughnutSeries<ChartSampleData,
                                    String>>[
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
                                          (ChartSampleData data, _) =>
                                              data.text,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true))
                                ],
                                tooltipBehavior: TooltipBehavior(enable: true),
                              ),
                            ],
                          ),
                        )),
                    MyFlexItem(
                        sizes: "lg-7",
                        child: MyContainer(
                          child: Column(
                            children: [
                              MyText.titleMedium("Pie Chart"),
                              MySpacing.height(flexSpacing),
                              SfCircularChart(
                                legend: Legend(
                                    isVisible: true,
                                    position: LegendPosition.bottom),
                                series: <PieSeries<ChartSampleData, String>>[
                                  PieSeries<ChartSampleData, String>(
                                      explode: true,
                                      explodeIndex: 0,
                                      explodeOffset: '10%',
                                      dataSource: controller.pieChartData,
                                      xValueMapper: (ChartSampleData data, _) =>
                                          data.x as String,
                                      yValueMapper: (ChartSampleData data, _) =>
                                          data.y,
                                      dataLabelMapper:
                                          (ChartSampleData data, _) =>
                                              data.text,
                                      startAngle: 90,
                                      endAngle: 90,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true)),
                                ],
                              ),
                            ],
                          ),
                        )),
                    MyFlexItem(
                        sizes: "lg-7",
                        child: MyContainer(
                          child: Column(
                            children: [
                              MyText.titleMedium("Radial Chart"),
                              MySpacing.height(flexSpacing),
                              SfCircularChart(
                                key: GlobalKey(),
                                series: <RadialBarSeries<ChartSampleData,
                                    String>>[
                                  RadialBarSeries<ChartSampleData, String>(
                                      maximumValue: 15,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true,
                                              textStyle:
                                                  TextStyle(fontSize: 10.0)),
                                      dataSource: controller.radialChartData,
                                      cornerStyle: CornerStyle.bothCurve,
                                      gap: '10%',
                                      radius: '90%',
                                      xValueMapper: (ChartSampleData data, _) =>
                                          data.x as String,
                                      yValueMapper: (ChartSampleData data, _) =>
                                          data.y,
                                      pointRadiusMapper:
                                          (ChartSampleData data, _) =>
                                              data.text,
                                      pointColorMapper:
                                          (ChartSampleData data, _) =>
                                              data.pointColor,
                                      dataLabelMapper:
                                          (ChartSampleData data, _) =>
                                              data.x as String)
                                ],
                                tooltipBehavior:
                                    controller.radialTooltipBehavior,
                              ),
                            ],
                          ),
                        )),
                    MyFlexItem(
                        sizes: "lg-7",
                        child: MyContainer(
                          child: Column(
                            children: [
                              MyText.titleMedium("Radial Chart"),
                              MySpacing.height(flexSpacing),
                              SfPyramidChart(
                                title: ChartTitle(
                                    text: 'comparison_of_calories'.tr(),
                                    textStyle: MyTextStyle.bodySmall()),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: PyramidSeries<ChartSampleData, String>(
                                    dataSource: controller.pyramidChartData,
                                    height: '90%',
                                    explode: false,
                                    gapRatio: 0,
                                    pyramidMode: PyramidMode.linear,
                                    xValueMapper: (ChartSampleData data, _) =>
                                        data.x as String,
                                    yValueMapper: (ChartSampleData data, _) =>
                                        data.y,
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                    )),
                              ),
                            ],
                          ),
                        ))
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
