import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_text_utils.dart';
import 'package:webkit/images.dart';

class ChartData {
  ChartData({this.x, this.yValue1, this.yValue2});

  final String? x;
  final double? yValue1;
  final double? yValue2;
}

class ProjectDetailController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  List<String> images = [
    Images.avatars[0],
    Images.avatars[1],
    Images.avatars[2],
    Images.avatars[3],
    Images.avatars[4],
  ];

  final List<ChartData> chartData = <ChartData>[
    ChartData(x: 'Mon', yValue1: 45, yValue2: 1000),
    ChartData(x: 'Tue', yValue1: 100, yValue2: 3000),
    ChartData(x: 'Wed', yValue1: 25, yValue2: 1000),
    ChartData(x: 'The', yValue1: 100, yValue2: 2000),
    ChartData(x: 'Fri', yValue1: 85, yValue2: 1000),
    ChartData(x: 'Sat', yValue1: 60, yValue2: 2000),
    ChartData(x: 'Sun', yValue1: 140, yValue2: 4000)
  ];
}
