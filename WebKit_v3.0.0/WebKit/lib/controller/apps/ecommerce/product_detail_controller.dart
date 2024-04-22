import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_text_utils.dart';
import 'package:webkit/images.dart';

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}

class ProductDetailController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));
  String selectedImage = Images.squareImages[6];

  var itemCount = 1;
  var itemCountPlus = 69;

  List<String> images = [
    Images.squareImages[6],
    Images.squareImages[7],
    Images.squareImages[8],
    Images.squareImages[9],
  ];

  bool showLike = false;

  void onChangeImage(String image) {
    selectedImage = image;
    update();
  }

  void onChangeLike() {
    showLike = !showLike;
    update();
  }

  void priceIncrement() {
    itemCount++;
    update();
  }

  void priceDecrement() {
    itemCount--;
    update();
  }

  final List<ChartData> chartData = <ChartData>[
    ChartData(2010, 10),
    ChartData(2011, 15),
    ChartData(2012, 8),
    ChartData(2013, 30),
    ChartData(2014, 45),
    ChartData(2015, 13),
    ChartData(2016, 22),
    ChartData(2017, 10),
    ChartData(2018, 60),
  ];
}
