import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/other/fl_chart_controller.dart';
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

class FlChartScreen extends StatefulWidget {
  const FlChartScreen({super.key});

  @override
  State<FlChartScreen> createState() => _FlChartScreenState();
}

class _FlChartScreenState extends State<FlChartScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late FlChartController controller;

  @override
  void initState() {
    controller = Get.put(FlChartController());
    super.initState();
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
                      "Fl Charts",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ui'),
                        MyBreadcrumbItem(name: 'Fl charts', active: true),
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
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium("Line Chart 1", fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: LineChart(controller.sampleData,
                                  duration: Duration(milliseconds: 600)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Line CHart 2', fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: LineChart(controller.mainData(),
                                  duration: Duration(milliseconds: 600)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: controller.cosPoints.isNotEmpty
                          ? MyContainer.bordered(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: MyText.bodyMedium('Line Chart 3',
                                          fontWeight: 600)),
                                  MySpacing.height(8),
                                  MyText.bodyMedium(
                                    'x: ${controller.xValue.toStringAsFixed(1)}',
                                    fontWeight: 600,
                                  ),
                                  MyText.bodyMedium(
                                    'sin: ${controller.sinPoints.last.y.toStringAsFixed(1)}',
                                    fontWeight: 600,
                                    color: Colors.blue,
                                  ),
                                  MyText.bodyMedium(
                                    'cos: ${controller.cosPoints.last.y.toStringAsFixed(1)}',
                                    fontWeight: 600,
                                    color: Colors.pink,
                                  ),
                                  SizedBox(
                                    height: 237,
                                    child: LineChart(
                                      LineChartData(
                                        minY: -1,
                                        maxY: 1,
                                        minX: controller.sinPoints.first.x,
                                        maxX: controller.sinPoints.last.x,
                                        lineTouchData:
                                            const LineTouchData(enabled: false),
                                        clipData: const FlClipData.all(),
                                        gridData: const FlGridData(
                                          show: true,
                                          drawVerticalLine: false,
                                        ),
                                        borderData: FlBorderData(show: false),
                                        lineBarsData: [
                                          controller
                                              .sinLine(controller.sinPoints),
                                          controller
                                              .cosLine(controller.cosPoints),
                                        ],
                                        titlesData: const FlTitlesData(
                                          show: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Line Chart 4', fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: LineChart(
                                LineChartData(
                                  lineTouchData:
                                      const LineTouchData(enabled: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: const [
                                        FlSpot(0, 4),
                                        FlSpot(1, 3.5),
                                        FlSpot(2, 4.5),
                                        FlSpot(3, 1),
                                        FlSpot(4, 4),
                                        FlSpot(5, 6),
                                        FlSpot(6, 6.5),
                                        FlSpot(7, 6),
                                        FlSpot(8, 4),
                                        FlSpot(9, 6),
                                        FlSpot(10, 6),
                                        FlSpot(11, 7),
                                      ],
                                      isCurved: true,
                                      barWidth: 8,
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: Colors.pink.withOpacity(1),
                                        cutOffY: controller.cutOffYValue,
                                        applyCutOffY: true,
                                      ),
                                      aboveBarData: BarAreaData(
                                        show: true,
                                        color: Colors.purple.withOpacity(0.7),
                                        cutOffY: controller.cutOffYValue,
                                        applyCutOffY: true,
                                      ),
                                      dotData: const FlDotData(
                                        show: false,
                                      ),
                                    ),
                                  ],
                                  minY: 0,
                                  titlesData: FlTitlesData(
                                    show: true,
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      axisNameWidget: MyText.bodyMedium(
                                        '2019',
                                        fontWeight: 600,
                                      ),
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 18,
                                        interval: 1,
                                        getTitlesWidget: bottomTitleWidgets,
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      axisNameSize: 20,
                                      axisNameWidget: MyText.bodyMedium(
                                        'Value',
                                      ),
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 1,
                                        reservedSize: 40,
                                        getTitlesWidget: leftTitleWidgets,
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                    show: true,
                                    border: Border.all(
                                        // color: Colors.borderColor,
                                        ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 1,
                                    checkToShowHorizontalLine: (double value) {
                                      return value == 1 ||
                                          value == 6 ||
                                          value == 4 ||
                                          value == 5;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium("Bar Chart 1", fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: BarChart(
                                BarChartData(
                                  maxY: 20,
                                  barTouchData: BarTouchData(
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey,
                                      getTooltipItem: (a, b, c, d) => null,
                                    ),
                                    touchCallback:
                                        (FlTouchEvent event, response) {
                                      if (response == null ||
                                          response.spot == null) {
                                        controller.touchedGroupIndex = -1;
                                        controller.showingBarGroups =
                                            List.of(controller.rawBarGroups);

                                        return;
                                      }

                                      controller.touchedGroupIndex =
                                          response.spot!.touchedBarGroupIndex;

                                      if (!event.isInterestedForInteractions) {
                                        controller.touchedGroupIndex = -1;
                                        controller.showingBarGroups =
                                            List.of(controller.rawBarGroups);
                                        return;
                                      }
                                      controller.showingBarGroups =
                                          List.of(controller.rawBarGroups);
                                      if (controller.touchedGroupIndex != -1) {
                                        var sum = 0.0;
                                        for (final rod in controller
                                            .showingBarGroups[
                                                controller.touchedGroupIndex]
                                            .barRods) {
                                          sum += rod.toY;
                                        }
                                        final avg = sum /
                                            controller
                                                .showingBarGroups[controller
                                                    .touchedGroupIndex]
                                                .barRods
                                                .length;

                                        controller.showingBarGroups[
                                                controller.touchedGroupIndex] =
                                            controller.showingBarGroups[
                                                    controller
                                                        .touchedGroupIndex]
                                                .copyWith(
                                          barRods: controller
                                              .showingBarGroups[
                                                  controller.touchedGroupIndex]
                                              .barRods
                                              .map((rod) {
                                            return rod.copyWith(
                                              toY: avg,
                                              // color: widget.avgColor,
                                            );
                                          }).toList(),
                                        );
                                      }
                                    },
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: bottomTitles,
                                        reservedSize: 42,
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 28,
                                        interval: 1,
                                        getTitlesWidget: leftTitles,
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  barGroups: controller.showingBarGroups,
                                  gridData: const FlGridData(show: false),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Bar Chart 2', fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: BarChart(controller.barChartData),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Bar Chart 3', fontWeight: 600),
                            MySpacing.height(8),
                            // LegendsListWidget(
                            //   legends: [
                            //     Legend('Pilates', pilateColor),
                            //     Legend('Quick workouts', quickWorkoutColor),
                            //     Legend('Cycling', cyclingColor),
                            //   ],
                            // ),
                            SizedBox(
                              height: 300,
                              child: BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceBetween,
                                  titlesData: FlTitlesData(
                                    leftTitles: const AxisTitles(),
                                    rightTitles: const AxisTitles(),
                                    topTitles: const AxisTitles(),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: bottomBarTitles,
                                        reservedSize: 20,
                                      ),
                                    ),
                                  ),
                                  barTouchData: BarTouchData(enabled: false),
                                  borderData: FlBorderData(show: false),
                                  gridData: const FlGridData(show: false),
                                  barGroups: [
                                    controller.generateGroupData(0, 2, 3, 2),
                                    controller.generateGroupData(1, 2, 5, 1.7),
                                    controller.generateGroupData(
                                        2, 1.3, 3.1, 2.8),
                                    controller.generateGroupData(
                                        3, 3.1, 4, 3.1),
                                    controller.generateGroupData(
                                        4, 0.8, 3.3, 3.4),
                                    controller.generateGroupData(
                                        5, 2, 5.6, 1.8),
                                    controller.generateGroupData(
                                        6, 1.3, 3.2, 2),
                                    controller.generateGroupData(
                                        7, 2.3, 3.2, 3),
                                    controller.generateGroupData(
                                        8, 2, 4.8, 2.5),
                                    controller.generateGroupData(
                                        9, 1.2, 3.2, 2.5),
                                    controller.generateGroupData(10, 1, 4.8, 3),
                                    controller.generateGroupData(
                                        11, 2, 4.4, 2.8),
                                  ],
                                  maxY: 11 + (controller.betweenSpace * 3),
                                  extraLinesData: ExtraLinesData(
                                    horizontalLines: [
                                      HorizontalLine(
                                        y: 3.3,
                                        color: Colors.purple,
                                        strokeWidth: 1,
                                        dashArray: [20, 4],
                                      ),
                                      HorizontalLine(
                                        y: 8,
                                        color: Colors.blue,
                                        strokeWidth: 1,
                                        dashArray: [20, 4],
                                      ),
                                      HorizontalLine(
                                        y: 11,
                                        color: Colors.cyan,
                                        strokeWidth: 1,
                                        dashArray: [20, 4],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Pie Chart 1', fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        controller.touchedIndex1 = -1;
                                        return;
                                      }
                                      controller.touchedIndex1 =
                                          pieTouchResponse.touchedSection!
                                              .touchedSectionIndex;
                                    },
                                  ),
                                  startDegreeOffset: 180,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSections1(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Pie Chart 2', fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        controller.touchedIndex2 = -1;
                                        return;
                                      }
                                      controller.touchedIndex2 =
                                          pieTouchResponse.touchedSection!
                                              .touchedSectionIndex;
                                    },
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: showingSections2(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Pie Chart 3', fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        controller.touchedIndex3 = -1;
                                        return;
                                      }
                                      controller.touchedIndex3 =
                                          pieTouchResponse.touchedSection!
                                              .touchedSectionIndex;
                                    },
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 0,
                                  sections: showingSections3(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6 md-12",
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Scatter Chart 1',
                                fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 500,
                              child: InkWell(
                                onTap: () {
                                  controller.onShowFlutter();
                                },
                                child: ScatterChart(
                                  ScatterChartData(
                                    scatterSpots: controller.showFlutter
                                        ? controller.flutterLogoData()
                                        : controller.randomData(),
                                    minX: 0,
                                    maxX: controller.maxX,
                                    minY: 0,
                                    maxY: controller.maxY,
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    gridData: const FlGridData(
                                      show: false,
                                    ),
                                    titlesData: const FlTitlesData(
                                      show: false,
                                    ),
                                    scatterTouchData: ScatterTouchData(
                                      enabled: false,
                                    ),
                                  ),
                                  swapAnimationDuration:
                                      const Duration(milliseconds: 600),
                                  swapAnimationCurve: Curves.fastOutSlowIn,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-6 md-12',
                      child: MyContainer.bordered(
                        child: Column(
                          children: [
                            MyText.bodyMedium('Scatter Chart 2',
                                fontWeight: 600),
                            MySpacing.height(8),
                            SizedBox(
                              height: 500,
                              child: ScatterChart(
                                ScatterChartData(
                                  scatterSpots: [
                                    ScatterSpot(
                                      4,
                                      4,
                                      color:
                                          controller.selectedSpots.contains(0)
                                              ? Colors.green
                                              : Colors.blueGrey,
                                    ),
                                    ScatterSpot(
                                      2,
                                      5,
                                      color:
                                          controller.selectedSpots.contains(1)
                                              ? Colors.yellow
                                              : Colors.blueGrey,
                                      radius: 12,
                                    ),
                                    ScatterSpot(
                                      4,
                                      5,
                                      color:
                                          controller.selectedSpots.contains(2)
                                              ? Colors.pink
                                              : Colors.blueGrey,
                                      radius: 8,
                                    ),
                                    ScatterSpot(
                                      8,
                                      6,
                                      color:
                                          controller.selectedSpots.contains(3)
                                              ? Colors.orange
                                              : Colors.blueGrey,
                                      radius: 20,
                                    ),
                                    ScatterSpot(
                                      5,
                                      7,
                                      color:
                                          controller.selectedSpots.contains(4)
                                              ? Colors.purple
                                              : Colors.blueGrey,
                                      radius: 14,
                                    ),
                                    ScatterSpot(
                                      7,
                                      2,
                                      color:
                                          controller.selectedSpots.contains(5)
                                              ? Colors.blue
                                              : Colors.blueGrey,
                                      radius: 18,
                                    ),
                                    ScatterSpot(
                                      3,
                                      2,
                                      color:
                                          controller.selectedSpots.contains(6)
                                              ? Colors.red
                                              : Colors.blueGrey,
                                      radius: 36,
                                    ),
                                    ScatterSpot(
                                      2,
                                      8,
                                      color:
                                          controller.selectedSpots.contains(7)
                                              ? Colors.cyan
                                              : Colors.blueGrey,
                                      radius: 22,
                                    ),
                                  ],
                                  minX: 0,
                                  maxX: 10,
                                  minY: 0,
                                  maxY: 10,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    checkToShowHorizontalLine: (value) => true,
                                    getDrawingHorizontalLine: (value) =>
                                        const FlLine(
                                      color: Colors.black12,
                                      // color: Colors.gridLinesColor,
                                    ),
                                    drawVerticalLine: true,
                                    checkToShowVerticalLine: (value) => true,
                                    getDrawingVerticalLine: (value) =>
                                        const FlLine(color: Colors.black12
                                            // color: Colors.gridLinesColor,
                                            ),
                                  ),
                                  titlesData: const FlTitlesData(
                                    show: false,
                                  ),
                                  showingTooltipIndicators:
                                      controller.selectedSpots,
                                  scatterTouchData: ScatterTouchData(
                                    enabled: true,
                                    handleBuiltInTouches: false,
                                    mouseCursorResolver:
                                        (FlTouchEvent touchEvent,
                                            ScatterTouchResponse? response) {
                                      return response == null ||
                                              response.touchedSpot == null
                                          ? MouseCursor.defer
                                          : SystemMouseCursors.click;
                                    },
                                    touchTooltipData: ScatterTouchTooltipData(
                                      tooltipBgColor: Colors.black,
                                      getTooltipItems:
                                          (ScatterSpot touchedBarSpot) {
                                        return ScatterTooltipItem(
                                          'X: ',
                                          textStyle: TextStyle(
                                            height: 1.2,
                                            color: Colors.grey[100],
                                            fontStyle: FontStyle.italic,
                                          ),
                                          bottomMargin: 10,
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${touchedBarSpot.x.toInt()} \n',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Y: ',
                                              style: TextStyle(
                                                height: 1.2,
                                                color: Colors.grey[100],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            TextSpan(
                                              text: touchedBarSpot.y
                                                  .toInt()
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    touchCallback: (FlTouchEvent event,
                                        ScatterTouchResponse? touchResponse) {
                                      if (touchResponse == null ||
                                          touchResponse.touchedSpot == null) {
                                        return;
                                      }
                                      if (event is FlTapUpEvent) {
                                        final sectionIndex = touchResponse
                                            .touchedSpot!.spotIndex;

                                        if (controller.selectedSpots
                                            .contains(sectionIndex)) {
                                          controller.selectedSpots
                                              .remove(sectionIndex);
                                        } else {
                                          controller.selectedSpots
                                              .add(sectionIndex);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-6 md-12',
                      child: MyContainer.bordered(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: MyText.bodyMedium('Radar Chart',
                                    fontWeight: 600)),
                            MySpacing.height(8),
                            GestureDetector(
                              onTap: () {
                                controller.selectedDataSetIndex = -1;
                              },
                              child: Text(
                                'Categories'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300,
                                  // color: AppColors.mainTextColor1,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: controller
                                  .rawDataSets()
                                  .asMap()
                                  .map((index, value) {
                                    final isSelected = index ==
                                        controller.selectedDataSetIndex;
                                    return MapEntry(
                                      index,
                                      GestureDetector(
                                        onTap: () {
                                          controller.selectedDataSetIndex =
                                              index;
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          height: 26,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.grey
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(46),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                            horizontal: 6,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                curve: Curves.easeInToLinear,
                                                padding: EdgeInsets.all(
                                                    isSelected ? 8 : 6),
                                                decoration: BoxDecoration(
                                                  color: value.color,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              AnimatedDefaultTextStyle(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeInToLinear,
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? value.color
                                                      : Colors.grey,
                                                ),
                                                child: Text(value.title),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                  .values
                                  .toList(),
                            ),
                            MySpacing.height(8),
                            SizedBox(
                              height: 300,
                              child: RadarChart(
                                RadarChartData(
                                  radarTouchData: RadarTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, response) {
                                      if (!event.isInterestedForInteractions) {
                                        controller.selectedDataSetIndex = -1;

                                        return;
                                      }

                                      controller.selectedDataSetIndex = response
                                              ?.touchedSpot
                                              ?.touchedDataSetIndex ??
                                          -1;
                                    },
                                  ),
                                  dataSets: controller.showingDataSets(),
                                  radarBackgroundColor: Colors.transparent,
                                  borderData: FlBorderData(show: false),
                                  radarBorderData: const BorderSide(
                                      color: Colors.transparent),
                                  titlePositionPercentageOffset: 0.2,
                                  titleTextStyle: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  getTitle: (index, angle) {
                                    final usedAngle =
                                        controller.relativeAngleMode
                                            ? angle + controller.angleValue
                                            : controller.angleValue;
                                    switch (index) {
                                      case 0:
                                        return RadarChartTitle(
                                          text: 'Mobile or Tablet',
                                          angle: usedAngle,
                                        );
                                      case 2:
                                        return RadarChartTitle(
                                          text: 'Desktop',
                                          angle: usedAngle,
                                        );
                                      case 1:
                                        return RadarChartTitle(
                                            text: 'TV', angle: usedAngle);
                                      default:
                                        return const RadarChartTitle(text: '');
                                    }
                                  },
                                  tickCount: 1,
                                  ticksTextStyle: const TextStyle(
                                      color: Colors.transparent, fontSize: 10),
                                  tickBorderData: const BorderSide(
                                      color: Colors.transparent),
                                  gridBorderData: BorderSide(
                                    // color: widget.gridColor,
                                    width: 2,
                                  ),
                                ),
                                swapAnimationDuration:
                                    const Duration(milliseconds: 400),
                              ),
                            )
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

  List<PieChartSectionData> showingSections3() {
    return List.generate(4, (i) {
      final isTouched = i == controller.touchedIndex3;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icon/fitness-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icon/librarian-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icon/ophthalmology-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/icon/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: Colors.black,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }

  List<PieChartSectionData> showingSections2() {
    return List.generate(4, (i) {
      final isTouched = i == controller.touchedIndex2;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: Colors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: Colors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: Colors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              // color: Colors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showingSections1() {
    return List.generate(4, (i) {
      final isTouched = i == controller.touchedIndex1;
      const color0 = Colors.blue;
      const color1 = Colors.yellow;
      const color2 = Colors.pink;
      const color3 = Colors.green;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: color0,
            value: 25,
            title: '',
            radius: 80,
            titlePositionPercentageOffset: 0.55,
            borderSide: isTouched
                ? const BorderSide(color: Colors.white, width: 6)
                : BorderSide(color: Colors.white.withOpacity(0)),
          );
        case 1:
          return PieChartSectionData(
            color: color1,
            value: 25,
            title: '',
            radius: 65,
            titlePositionPercentageOffset: 0.55,
            borderSide: isTouched
                ? const BorderSide(color: Colors.white, width: 6)
                : BorderSide(color: Colors.white.withOpacity(0)),
          );
        case 2:
          return PieChartSectionData(
            color: color2,
            value: 25,
            title: '',
            radius: 60,
            titlePositionPercentageOffset: 0.6,
            borderSide: isTouched
                ? const BorderSide(color: Colors.white, width: 6)
                : BorderSide(color: Colors.white.withOpacity(0)),
          );
        case 3:
          return PieChartSectionData(
            color: color3,
            value: 25,
            title: '',
            radius: 70,
            titlePositionPercentageOffset: 0.55,
            borderSide: isTouched
                ? const BorderSide(color: Colors.white, width: 6)
                : BorderSide(color: Colors.white.withOpacity(0)),
          );
        default:
          throw Error();
      }
    });
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: MyText.bodyMedium(
        text,
        fontSize: 12,
        fontWeight: 600,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text('\$ ${value + 0.5}', style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  Widget bottomBarTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;
      case 7:
        text = 'AUG';
        break;
      case 8:
        text = 'SEP';
        break;
      case 9:
        text = 'OCT';
        break;
      case 10:
        text = 'NOV';
        break;
      case 11:
        text = 'DEC';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });

  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
