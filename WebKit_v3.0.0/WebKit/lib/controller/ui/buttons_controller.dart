import 'package:flutter/material.dart';
import 'package:webkit/controller/my_controller.dart';

class ButtonsController extends MyController {
  List<bool> selected = List.filled(3, false);

  ButtonsController(this.tickerProvider) {
    selected[0] = true;
  }

  var normalIndex = 0, roundedIndex = 0, groupAndSizedButtons = 0;

  final TickerProvider tickerProvider;

  late TabController normalTabController = TabController(
      length: 5, vsync: tickerProvider, initialIndex: normalIndex);
  late TabController roundedTabController = TabController(
      length: 5, vsync: tickerProvider, initialIndex: roundedIndex);
  late TabController groupAndSizedTabController = TabController(
      length: 2, vsync: tickerProvider, initialIndex: groupAndSizedButtons);

  // ButtonsController(this.tickerProvider);

  @override
  void onInit() {
    super.onInit();
    normalTabController.addListener(() {
      if (normalIndex != normalTabController.index) {
        normalIndex = normalTabController.index;
        update();
      }
    });
    roundedTabController.addListener(() {
      if (roundedIndex != roundedTabController.index) {
        roundedIndex = roundedTabController.index;
        update();
      }
    });
    groupAndSizedTabController.addListener(() {
      if (groupAndSizedButtons != groupAndSizedTabController.index) {
        groupAndSizedButtons = groupAndSizedTabController.index;
        update();
      }
    });
  }

  void onSelect(int index) {
    selected = List.filled(3, false);
    selected[index] = true;
    update();
  }

  String getTag() {
    return "buttons_controller";
  }
}
