import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:webkit/controller/my_controller.dart';

class FlChartController extends MyController {
  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      while (sinPoints.length > limitCount) {
        sinPoints.removeAt(0);
        cosPoints.removeAt(0);
      }

      sinPoints.add(FlSpot(xValue, math.sin(xValue)));
      cosPoints.add(FlSpot(xValue, math.cos(xValue)));
      update();
      xValue += step;
    });

    /// Bar Chart 1

    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  /// Chart 1

  LineChartData get sampleData => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: 0,
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.blue.withAlpha(40), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.greenAccent,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.pink.withOpacity(0),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.cyan,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );

  /// Chart 2
  List<Color> gradientColors = [Colors.cyan, Colors.blue];

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            // color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  /// Chart 3
  final limitCount = 100;
  final sinPoints = <FlSpot>[];
  final cosPoints = <FlSpot>[];

  double xValue = 0;
  double step = 0.05;

  late Timer timer;

  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(
        show: false,
      ),
      gradient: LinearGradient(
        colors: [Colors.blue.withOpacity(0), Colors.blue],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      isCurved: false,
    );
  }

  LineChartBarData cosLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(
        show: false,
      ),
      gradient: LinearGradient(
        colors: [Colors.pink.withOpacity(0), Colors.pink],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      isCurved: false,
    );
  }

  /// Chart 4
  final cutOffYValue = 5.0;

  /// Bar Chart 1

  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.purple,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: Colors.redAccent,
          width: width,
        ),
      ],
    );
  }

  /// Bar Chart 2

  BarChartData get barChartData => BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderBarChartData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      );

  FlBorderData get borderBarChartData => FlBorderData(
        show: false,
      );

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.blue.shade300,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mn';
        break;
      case 1:
        text = 'Te';
        break;
      case 2:
        text = 'Wd';
        break;
      case 3:
        text = 'Tu';
        break;
      case 4:
        text = 'Fr';
        break;
      case 5:
        text = 'St';
        break;
      case 6:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 15,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 13,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: 16,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.blue.shade300,
          Colors.cyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  /// Bar Chart 3

  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: Colors.purple,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: Colors.blue,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: Colors.cyan,
          width: 5,
        ),
      ],
    );
  }

  /// Pie Chart 1

  int touchedIndex1 = -1;

  /// Pie Chart 2

  int touchedIndex2 = -1;

  /// Pie Chart 3

  int touchedIndex3 = 0;

  /// Scatter Chat 1

  final maxX = 50.0;
  final maxY = 50.0;
  final radius = 8.0;

  bool showFlutter = true;

  List<ScatterSpot> flutterLogoData() {
    return [
      /// section 1
      ScatterSpot(20, 14.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(22, 16.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(24, 18.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),

      ScatterSpot(22, 12.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(24, 14.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(26, 16.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),

      ScatterSpot(24, 10.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(26, 12.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(28, 14.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),

      ScatterSpot(26, 8.5, color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(28, 10.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(30, 12.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),

      ScatterSpot(28, 6.5, color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(30, 8.5, color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(32, 10.5,
          color: Colors.blue.withOpacity(0.5), radius: radius),

      ScatterSpot(30, 4.5, color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(32, 6.5, color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(34, 8.5, color: Colors.blue.withOpacity(0.5), radius: radius),

      ScatterSpot(34, 4.5, color: Colors.blue.withOpacity(0.5), radius: radius),
      ScatterSpot(36, 6.5, color: Colors.blue.withOpacity(0.5), radius: radius),

      ScatterSpot(38, 4.5, color: Colors.blue.withOpacity(0.5), radius: radius),

      /// section 2
      ScatterSpot(20, 14.5, color: Colors.blue, radius: radius),
      ScatterSpot(22, 12.5, color: Colors.blue, radius: radius),
      ScatterSpot(24, 10.5, color: Colors.blue, radius: radius),

      ScatterSpot(22, 16.5, color: Colors.blue, radius: radius),
      ScatterSpot(24, 14.5, color: Colors.blue, radius: radius),
      ScatterSpot(26, 12.5, color: Colors.blue, radius: radius),

      ScatterSpot(24, 18.5, color: Colors.blue, radius: radius),
      ScatterSpot(26, 16.5, color: Colors.blue, radius: radius),
      ScatterSpot(28, 14.5, color: Colors.blue, radius: radius),

      ScatterSpot(26, 20.5, color: Colors.blue, radius: radius),
      ScatterSpot(28, 18.5, color: Colors.blue, radius: radius),
      ScatterSpot(30, 16.5, color: Colors.blue, radius: radius),

      ScatterSpot(28, 22.5, color: Colors.blue, radius: radius),
      ScatterSpot(30, 20.5, color: Colors.blue, radius: radius),
      ScatterSpot(32, 18.5, color: Colors.blue, radius: radius),

      ScatterSpot(30, 24.5, color: Colors.blue, radius: radius),
      ScatterSpot(32, 22.5, color: Colors.blue, radius: radius),
      ScatterSpot(34, 20.5, color: Colors.blue, radius: radius),

      ScatterSpot(34, 24.5, color: Colors.blue, radius: radius),
      ScatterSpot(36, 22.5, color: Colors.blue, radius: radius),

      ScatterSpot(38, 24.5, color: Colors.blue, radius: radius),

      /// section 3
      ScatterSpot(10, 25, color: Colors.blue, radius: radius),
      ScatterSpot(12, 23, color: Colors.blue, radius: radius),
      ScatterSpot(14, 21, color: Colors.blue, radius: radius),

      ScatterSpot(12, 27, color: Colors.blue, radius: radius),
      ScatterSpot(14, 25, color: Colors.blue, radius: radius),
      ScatterSpot(16, 23, color: Colors.blue, radius: radius),

      ScatterSpot(14, 29, color: Colors.blue, radius: radius),
      ScatterSpot(16, 27, color: Colors.blue, radius: radius),
      ScatterSpot(18, 25, color: Colors.blue, radius: radius),

      ScatterSpot(16, 31, color: Colors.blue, radius: radius),
      ScatterSpot(18, 29, color: Colors.blue, radius: radius),
      ScatterSpot(20, 27, color: Colors.blue, radius: radius),

      ScatterSpot(18, 33, color: Colors.blue, radius: radius),
      ScatterSpot(20, 31, color: Colors.blue, radius: radius),
      ScatterSpot(22, 29, color: Colors.blue, radius: radius),

      ScatterSpot(20, 35, color: Colors.blue, radius: radius),
      ScatterSpot(22, 33, color: Colors.blue, radius: radius),
      ScatterSpot(24, 31, color: Colors.blue, radius: radius),

      ScatterSpot(22, 37, color: Colors.blue, radius: radius),
      ScatterSpot(24, 35, color: Colors.blue, radius: radius),
      ScatterSpot(26, 33, color: Colors.blue, radius: radius),

      ScatterSpot(24, 39, color: Colors.blue, radius: radius),
      ScatterSpot(26, 37, color: Colors.blue, radius: radius),
      ScatterSpot(28, 35, color: Colors.blue, radius: radius),

      ScatterSpot(26, 41, color: Colors.blue, radius: radius),
      ScatterSpot(28, 39, color: Colors.blue, radius: radius),
      ScatterSpot(30, 37, color: Colors.blue, radius: radius),

      ScatterSpot(28, 43, color: Colors.blue, radius: radius),
      ScatterSpot(30, 41, color: Colors.blue, radius: radius),
      ScatterSpot(32, 39, color: Colors.blue, radius: radius),

      ScatterSpot(30, 45, color: Colors.blue, radius: radius),
      ScatterSpot(32, 43, color: Colors.blue, radius: radius),
      ScatterSpot(34, 41, color: Colors.blue, radius: radius),

      ScatterSpot(34, 45, color: Colors.blue, radius: radius),
      ScatterSpot(36, 43, color: Colors.blue, radius: radius),

      ScatterSpot(38, 45, color: Colors.blue, radius: radius),
    ];
  }

  List<ScatterSpot> randomData() {
    const blue1Count = 21;
    const blue2Count = 57;
    return List.generate(blue1Count + blue2Count, (i) {
      Color color;
      if (i < blue1Count) {
        color = Colors.blue.withOpacity(0.5);
      } else {
        color = Colors.blue;
      }

      return ScatterSpot(
        (Random().nextDouble() * (maxX - 8)) + 4,
        (Random().nextDouble() * (maxY - 8)) + 4,
        color: color,
        radius: (Random().nextDouble() * 16) + 4,
      );
    });
  }

  void onShowFlutter() {
    showFlutter = !showFlutter;
    update();
  }

  /// Scatter Chart 2

  int touchedIndex = -1;

  Color greyColor = Colors.grey;

  List<int> selectedSpots = [];

  /// Radar Chart

  int selectedDataSetIndex = -1;
  double angleValue = 0;
  bool relativeAngleMode = true;

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: Colors.red,
        values: [
          300,
          50,
          250,
        ],
      ),
      RawDataSet(
        title: 'Art & Tech',
        color: Colors.cyan,
        values: [
          250,
          100,
          200,
        ],
      ),
      RawDataSet(
        title: 'Entertainment',
        color: Colors.white,
        values: [
          200,
          150,
          50,
        ],
      ),
      RawDataSet(
        title: 'Off-road Vehicle',
        color: Colors.yellow,
        values: [
          150,
          200,
          150,
        ],
      ),
      RawDataSet(
        title: 'Boxing',
        color: Colors.green,
        values: [
          100,
          250,
          100,
        ],
      ),
    ];
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
