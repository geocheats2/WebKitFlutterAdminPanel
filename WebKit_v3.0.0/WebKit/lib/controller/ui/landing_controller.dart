import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/widgets/my_text_utils.dart';

class LandingController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));
  int animatedCarouselSize = 3;
  int selectedAnimatedCarousel = 0;

  Timer? timerAnimation;
  var defaultIndex = 0, backgroundIndex = 0;

  final PageController animatedPageController = PageController(initialPage: 0);
  final TickerProvider tickerProvider;

  late TabController defaultTabController = TabController(
    length: 6,
    vsync: tickerProvider,
    initialIndex: defaultIndex,
  );

  LandingController(this.tickerProvider);

  @override
  void onInit() {
    super.onInit();
    timerAnimation = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (selectedAnimatedCarousel < animatedCarouselSize - 1) {
        selectedAnimatedCarousel++;
      } else {
        selectedAnimatedCarousel = 0;
      }

      animatedPageController.animateToPage(
        selectedAnimatedCarousel,
        duration: const Duration(milliseconds: 600),
        curve: Curves.ease,
      );
      update();
    });
  }

  void onChangeAnimatedCarousel(int value) {
    selectedAnimatedCarousel = value;
    update();
  }
}
