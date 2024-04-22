import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_text_utils.dart';

class ChartSampleData {
  ChartSampleData({
    this.x,
    this.y,
    this.text,
  });

  final dynamic x;
  final num? y;

  final String? text;
}

class ReviewsController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  int initialRating = -1;

  String selectedTimeDesign = "Year";

  final List<ChartSampleData> doughnutChartData = <ChartSampleData>[
    ChartSampleData(x: 'Chlorine', y: 55, text: '55%'),
    ChartSampleData(x: 'Sodium', y: 31, text: '31%'),
    ChartSampleData(x: 'Magnesium', y: 7.7, text: '7.7%'),
    ChartSampleData(x: 'Sulfur', y: 3.7, text: '3.7%'),
    ChartSampleData(x: 'Calcium', y: 1.2, text: '1.2%'),
    ChartSampleData(x: 'Others', y: 1.4, text: '1.4%'),
  ];
  final List<ChartSampleData> chartData1 = <ChartSampleData>[
    ChartSampleData(x: 2010, y: 50),
    ChartSampleData(x: 2011, y: 15),
    ChartSampleData(x: 2012, y: 39),
    ChartSampleData(x: 2013, y: 29),
    ChartSampleData(x: 2014, y: 60)
  ];
  final List<ChartSampleData> chartData2 = <ChartSampleData>[
    ChartSampleData(x: 2010, y: 10),
    ChartSampleData(x: 2011, y: 26),
    ChartSampleData(x: 2012, y: 12),
    ChartSampleData(x: 2013, y: 17),
    ChartSampleData(x: 2014, y: 50)
  ];
  final List<ChartSampleData> chartData3 = <ChartSampleData>[
    ChartSampleData(x: 2010, y: 30),
    ChartSampleData(x: 2011, y: 36),
    ChartSampleData(x: 2012, y: 22),
    ChartSampleData(x: 2013, y: 37),
    ChartSampleData(x: 2014, y: 11)
  ];
  final List<ChartSampleData> chartData4 = <ChartSampleData>[
    ChartSampleData(x: 2010, y: 40),
    ChartSampleData(x: 2011, y: 46),
    ChartSampleData(x: 2012, y: 33),
    ChartSampleData(x: 2013, y: 7),
    ChartSampleData(x: 2014, y: 33)
  ];
  final TooltipBehavior tooltipBehavior = TooltipBehavior(
    enable: true,
    textAlignment: ChartAlignment.center,
    header: '',
    canShowMarker: false,
    format:
        'point.x\nLiteracy rate : point.x%\nGDP growth rate : point.y\nPopulation : point.sizeB',
  );

  void onSelectedTimeDesign(String time) {
    selectedTimeDesign = time;
    update();
  }
}
