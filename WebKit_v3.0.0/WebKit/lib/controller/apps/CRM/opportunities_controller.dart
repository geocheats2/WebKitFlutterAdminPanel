import 'dart:ui';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/models/opportunities.dart';

class ChartData1 {
  ChartData1(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}

class ChartData2 {
  ChartData2(this.x, this.y1, this.y2);

  final double x;
  final double y1;
  final double y2;
}

class OpportunitiesController extends MyController {
  List<Opportunities> opportunities = [];
  String selectSize = "All";

  final List<ChartData1> chartData1 = [
    ChartData1('David', 25),
    ChartData1('Steve', 38),
    ChartData1('Jack', 34),
    ChartData1('Others', 52)
  ];
  final List<ChartData2> chartData2 = [
    ChartData2(2012, 12, 10),
    ChartData2(2013, 14, 11),
    ChartData2(2014, 16, 10),
    ChartData2(2015, 20, 25),
    ChartData2(2016, 22, 10),
    ChartData2(2017, 24, 12),
    ChartData2(2018, 26, 16),
  ];
  final TooltipBehavior chartData = TooltipBehavior(
    enable: true,
  );

  @override
  void onInit() {
    super.onInit();
    Opportunities.dummyList.then((value) {
      opportunities = value.sublist(0, 30);
      update();
    });
  }

  void onSelectedSize(String size) {
    selectSize = size;
    update();
  }
}
