import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/widgets/my_text_utils.dart';
import 'package:webkit/views/other/basic_table.dart';

class Data {
  final int id, qty;
  final String name;
  final String code;
  final double amount;

  Data(this.id, this.qty, this.name, this.code, this.amount);

  static factory([int seeds = 30]) {
    return List.generate(
        seeds,
        (index) => Data(
            index + 1,
            Random().nextInt(100),
            MyTextUtils.getDummyText(2, withStop: false),
            MyTextUtils.getDummyText(1, withStop: false).toLowerCase(),
            (Random().nextDouble() * 100).toStringAsPrecision(2).toDouble()));
  }
}

class BasicTableController extends MyController {
  List<Data> datas = Data.factory();
  DataTableSource? data;

  BasicTableController();

  void onSelect(int index) {}

  @override
  void onInit() {
    super.onInit();
    data = MyData(datas);
  }

  String getTag() {
    return "basic_table_controller";
  }
}
