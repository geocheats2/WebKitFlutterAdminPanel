import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/my_controller.dart';

class ChartSampleData {
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  final dynamic x;
  final num? y;
  final dynamic xValue;
  final num? yValue;
  final num? secondSeriesYValue;
  final num? thirdSeriesYValue;
  final Color? pointColor;
  final num? size;
  final String? text;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  final num? volume;
}

class SyncfusionChartsController extends MyController {
  final List<ChartSampleData> dashedSpLineChart = [
    ChartSampleData(x: 2010, y: 35),
    ChartSampleData(x: 2011, y: 13),
    ChartSampleData(x: 2012, y: 34),
    ChartSampleData(x: 2013, y: 27),
    ChartSampleData(x: 2014, y: 15),
    ChartSampleData(x: 2015, y: 8),
    ChartSampleData(x: 2016, y: 30),
    ChartSampleData(x: 2017, y: 33),
    ChartSampleData(x: 2018, y: 40)
  ];
  final TooltipBehavior dashedSpLine =
      TooltipBehavior(enable: true, format: 'point.x : point.y');
  final List<ChartSampleData> rangeColumnChart = [
    ChartSampleData(x: 'Jan', high: 2, low: 4),
    ChartSampleData(x: 'Feb', high: 5, low: 8),
    ChartSampleData(x: 'Mar', high: 8, low: 12),
    ChartSampleData(x: 'Apr', high: 11, low: 16),
    ChartSampleData(x: 'May', high: 14, low: 20),
    ChartSampleData(x: 'Jun', high: 17, low: 24),
    ChartSampleData(x: 'Jul', high: 20, low: 28),
    ChartSampleData(x: 'Aug', high: 23, low: 32),
    ChartSampleData(x: 'Sep', high: 26, low: 36),
    ChartSampleData(x: 'Oct', high: 29, low: 40),
    ChartSampleData(x: 'Nov', high: 29, low: 44),
    ChartSampleData(x: 'Dec', high: 32, low: 48),
  ];
  final TooltipBehavior rangeSlider =
      TooltipBehavior(enable: true, format: 'point.x : point.high : point.low');
  final List<ChartSampleData> verticalSpLineChart = <ChartSampleData>[
    ChartSampleData(x: 'Jan', y: 21),
    ChartSampleData(x: 'Feb', y: 24),
    ChartSampleData(x: 'Mar', y: 35),
    ChartSampleData(x: 'Apr', y: 38),
    ChartSampleData(x: 'May', y: 54),
    ChartSampleData(x: 'Jun', y: 21),
    ChartSampleData(x: 'Jul', y: 24),
    ChartSampleData(x: 'Aug', y: 35),
    ChartSampleData(x: 'Sep', y: 38),
    ChartSampleData(x: 'Oct', y: 54),
    ChartSampleData(x: 'Nov', y: 38),
    ChartSampleData(x: 'Dec', y: 54)
  ];
  final TooltipBehavior vertical =
      TooltipBehavior(enable: true, format: 'point.x : point.y  ');

  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Jan', y: 45, yValue: 1000),
    ChartSampleData(x: 'Feb', y: 100, yValue: 3000),
    ChartSampleData(x: 'March', y: 25, yValue: 1000),
    ChartSampleData(x: 'April', y: 100, yValue: 4000),
    ChartSampleData(x: 'May', y: 85, yValue: 3000),
    ChartSampleData(x: 'June', y: 140, yValue: 5000),
    ChartSampleData(x: 'July', y: 70, yValue: 1000),
    ChartSampleData(x: 'Aug', y: 125, yValue: 3000),
    ChartSampleData(x: 'Sep', y: 180, yValue: 6500),
    ChartSampleData(x: 'Oct', y: 90, yValue: 3000),
    ChartSampleData(x: 'Nov', y: 50, yValue: 2000),
    ChartSampleData(x: 'Dec', y: 30, yValue: 1000)
  ];
  final TooltipBehavior chart = TooltipBehavior(
      enable: true, format: 'point.x : point.yValue1 : point.yValue2');
  final List<ChartSampleData> gradientChartData = <ChartSampleData>[
    ChartSampleData(x: 'Jan', y: 35.53),
    ChartSampleData(x: 'Feb', y: 46.06),
    ChartSampleData(x: 'Mar', y: 46.06),
    ChartSampleData(x: 'Apr', y: 50.86),
    ChartSampleData(x: 'May', y: 60.89),
    ChartSampleData(x: 'Jun', y: 70.27),
    ChartSampleData(x: 'Jul', y: 75.65),
    ChartSampleData(x: 'Aug', y: 74.70),
    ChartSampleData(x: 'Sep', y: 65.91),
    ChartSampleData(x: 'Oct', y: 54.28),
    ChartSampleData(x: 'Nov', y: 46.33),
    ChartSampleData(x: 'Dec', y: 35.71),
  ];
  final TooltipBehavior gradient =
      TooltipBehavior(enable: true, format: 'point.x : point.y ');
  final List<ChartSampleData> bubbleChartData = <ChartSampleData>[
    ChartSampleData(x: 'China', xValue: 92.2, y: 7.8, size: 1.347),
    ChartSampleData(x: 'India', xValue: 74, y: 6.5, size: 1.241),
    ChartSampleData(x: 'Indonesia', xValue: 90.4, y: 6.0, size: 0.238),
    ChartSampleData(x: 'US', xValue: 99.4, y: 2.2, size: 0.312),
    ChartSampleData(x: 'Germany', xValue: 99, y: 0.7, size: 0.0818),
    ChartSampleData(x: 'Egypt', xValue: 72, y: 2.0, size: 0.0826),
    ChartSampleData(x: 'Russia', xValue: 99.6, y: 3.4, size: 0.143),
    ChartSampleData(x: 'Japan', xValue: 99, y: 0.2, size: 0.128),
    ChartSampleData(x: 'Mexico', xValue: 86.1, y: 4.0, size: 0.115),
    ChartSampleData(x: 'Philippines', xValue: 92.6, y: 6.6, size: 0.096),
    ChartSampleData(x: 'Nigeria', xValue: 61.3, y: 1.45, size: 0.162),
    ChartSampleData(x: 'Hong Kong', xValue: 82.2, y: 3.97, size: 0.7),
    ChartSampleData(x: 'Netherland', xValue: 79.2, y: 3.9, size: 0.162),
    ChartSampleData(x: 'Jordan', xValue: 72.5, y: 4.5, size: 0.7),
    ChartSampleData(x: 'Australia', xValue: 81, y: 3.5, size: 0.21),
    ChartSampleData(x: 'Mongolia', xValue: 66.8, y: 3.9, size: 0.028),
    ChartSampleData(x: 'Taiwan', xValue: 78.4, y: 2.9, size: 0.231),
  ];
  final TooltipBehavior tooltipBehavior = TooltipBehavior(
    enable: true,
    textAlignment: ChartAlignment.center,
    header: '',
    canShowMarker: false,
    format:
        'point.x\nLiteracy rate : point.x%\nGDP growth rate : point.y\nPopulation : point.sizeB',
  );
  final List<ChartSampleData> doughnutChartData = <ChartSampleData>[
    ChartSampleData(x: 'Chlorine', y: 55, text: '55%'),
    ChartSampleData(x: 'Sodium', y: 31, text: '31%'),
    ChartSampleData(x: 'Magnesium', y: 7.7, text: '7.7%'),
    ChartSampleData(x: 'Sulfur', y: 3.7, text: '3.7%'),
    ChartSampleData(x: 'Calcium', y: 1.2, text: '1.2%'),
    ChartSampleData(x: 'Others', y: 1.4, text: '1.4%'),
  ];

  final List<ChartSampleData> pieChartData = <ChartSampleData>[
    ChartSampleData(x: 'David', y: 13, text: 'David \n 13%'),
    ChartSampleData(x: 'Steve', y: 24, text: 'Steve \n 24%'),
    ChartSampleData(x: 'Jack', y: 25, text: 'Jack \n 25%'),
    ChartSampleData(x: 'neo', y: 30, text: 'neo \n 12%'),
    ChartSampleData(x: 'Others', y: 38, text: 'Others \n 38%'),
  ];

  final List<ChartSampleData> radialChartData = <ChartSampleData>[
    ChartSampleData(
        x: 'John',
        y: 10,
        text: '100%',
        pointColor: const Color.fromRGBO(248, 177, 149, 1.0)),
    ChartSampleData(
        x: 'Almaida',
        y: 11,
        text: '100%',
        pointColor: const Color.fromRGBO(246, 114, 128, 1.0)),
    ChartSampleData(
        x: 'Don',
        y: 12,
        text: '100%',
        pointColor: const Color.fromRGBO(61, 205, 171, 1.0)),
    ChartSampleData(
        x: 'Tom',
        y: 13,
        text: '100%',
        pointColor: const Color.fromRGBO(1, 174, 190, 1.0)),
    ChartSampleData(
        x: 'Jon',
        y: 14,
        text: '100%',
        pointColor: const Color.fromRGBO(23, 300, 120, 1.0)),
  ];
  final TooltipBehavior radialTooltipBehavior =
      TooltipBehavior(enable: true, format: 'point.x : point.ym');

  final List<ChartSampleData> pyramidChartData = <ChartSampleData>[
    ChartSampleData(x: 'Walnuts', y: 654),
    ChartSampleData(x: 'Almonds', y: 575),
    ChartSampleData(x: 'Soybeans', y: 446),
    ChartSampleData(x: 'Black beans', y: 341),
    ChartSampleData(x: 'Mushrooms', y: 296),
    ChartSampleData(x: 'Avacado', y: 160),
  ];
}
