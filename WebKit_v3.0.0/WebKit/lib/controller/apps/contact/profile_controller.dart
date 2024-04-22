import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_text_utils.dart';
import 'package:webkit/models/chat.dart';

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}

class ProfileController extends MyController {
  List<Chat> chat = [];

  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  @override
  void onInit() {
    super.onInit();
    Chat.dummyList.then((value) {
      chat = value.sublist(0, 10);
      update();
    });
  }

  final List<ChartData> chartData = <ChartData>[
    ChartData(2010, 10.53),
    ChartData(2011, 9.5),
    ChartData(2012, 10),
    ChartData(2013, 2.4),
    ChartData(2014, 5.8),
    ChartData(2015, 1.9),
    ChartData(2016, 15.5),
    ChartData(2017, 3.6),
    ChartData(2018, 8.43),
    ChartData(2019, 5.68),
    ChartData(2020, 7.15),
    ChartData(2021, 15.26),
    ChartData(2022, 10.89),
  ];
  final TooltipBehavior tool = TooltipBehavior(
    enable: true,
    format: 'point.x : point.y',
  );
}
