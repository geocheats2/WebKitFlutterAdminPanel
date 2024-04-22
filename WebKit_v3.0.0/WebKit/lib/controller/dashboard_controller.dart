import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/my_controller.dart';

import '../models/dashboard.dart';

class ChartSampleData {
  ChartSampleData({this.x,
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

class DashboardController extends MyController {
  List<DashBoard> dashboard = [];

  DashboardController();

  String selectedTimeOnPage = "Year";
  String selectedTimeByLocation = "Year";
  String selectedTimeDesign = "Year";
  String selectedTimeLatency = "Year";

  final List<ChartSampleData> revenueChart1 = <ChartSampleData>[
    ChartSampleData(x: 'Mon', y: 0),
    ChartSampleData(x: 'Tue', y: 30),
    ChartSampleData(x: 'Wed', y: 35),
    ChartSampleData(x: 'The', y: 30),
    ChartSampleData(x: 'Fri', y: 45),
    ChartSampleData(x: 'Sat', y: 40),
    ChartSampleData(x: 'Sun', y: 55)
  ];
  final List<ChartSampleData> revenueChart2 = <ChartSampleData>[
    ChartSampleData(x: 'Mon', y: 10),
    ChartSampleData(x: 'Tue', y: 50),
    ChartSampleData(x: 'Wed', y: 30),
    ChartSampleData(x: 'The', y: 20),
    ChartSampleData(x: 'Fri', y: 35),
    ChartSampleData(x: 'Sat', y: 30),
    ChartSampleData(x: 'Sun', y: 45)
  ];

  final TooltipBehavior revenue = TooltipBehavior(
    enable: true,
    tooltipPosition: TooltipPosition.pointer,
    format: 'point.x : point.y',
  );

  final List<ChartSampleData> chartData = [
    ChartSampleData(x: 'Jan', y: 10, yValue: 1000),
    ChartSampleData(x: 'Fab', y: 20, yValue: 2000),
    ChartSampleData(x: 'Mar', y: 15, yValue: 1500),
    ChartSampleData(x: 'Jun', y: 5, yValue: 500),
    ChartSampleData(x: 'Jul', y: 30, yValue: 3000),
    ChartSampleData(x: 'Aug', y: 20, yValue: 2000),
    ChartSampleData(x: 'Sep', y: 40, yValue: 4000),
    ChartSampleData(x: 'Oct', y: 60, yValue: 6000),
    ChartSampleData(x: 'Nov', y: 55, yValue: 5500),
    ChartSampleData(x: 'Dec', y: 38, yValue: 3000),
  ];
  final TooltipBehavior chart = TooltipBehavior(
    enable: true,
    format: 'point.x : point.yValue1 : point.yValue2',
  );


  final List<ChartSampleData> facebookChart = [
    ChartSampleData(x: 1, y: 35),
    ChartSampleData(x: 2, y: 23),
    ChartSampleData(x: 3, y: 34),
    ChartSampleData(x: 4, y: 25),
    ChartSampleData(x: 5, y: 40),
    ChartSampleData(x: 6, y: 35),
    ChartSampleData(x: 7, y: 30),
    ChartSampleData(x: 8, y: 25),
    ChartSampleData(x: 9, y: 30),
  ];
  final TooltipBehavior facebook = TooltipBehavior(
    enable: true,
    tooltipPosition: TooltipPosition.pointer,
    format: 'point.x : point.y',
  );

  final List<ChartSampleData> circleChart = [
    ChartSampleData(
        x: 'David', y: 25, pointColor: const Color.fromRGBO(9, 0, 136, 1)),
    ChartSampleData(
        x: 'Steve', y: 38, pointColor: const Color.fromRGBO(147, 0, 119, 1)),
    ChartSampleData(
        x: 'Jack', y: 34, pointColor: const Color.fromRGBO(228, 0, 124, 1)),
    ChartSampleData(
        x: 'Others', y: 52, pointColor: const Color.fromRGBO(255, 189, 57, 1))
  ];

  void onSelectedTime(String time) {
    selectedTimeOnPage = time;
    update();
  }

  void onSelectedTimeByLocation(String time) {
    selectedTimeByLocation = time;
    update();
  }

  void onSelectedTimeDesign(String time) {
    selectedTimeDesign = time;
    update();
  }

  void onSelectedTimeLatency(String time) {
    selectedTimeLatency = time;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    DashBoard.dummyList.then((value) {
      dashboard = value;
      update();
    });
  }

  void goToProducts() {
    Get.toNamed('/apps/ecommerce/products');
  }

  void goToCustomers() {
    Get.toNamed('/apps/ecommerce/customers');
  }
}
