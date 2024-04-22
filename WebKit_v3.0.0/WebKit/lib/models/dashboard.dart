import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/identifier_model.dart';

class DashBoard extends IdentifierModel {
  final double value, sum, processBar;
  final String metric, tag, title, email, image;

  DashBoard(super.id, this.value, this.sum, this.metric, this.tag,
      this.processBar, this.title, this.email, this.image);

  static DashBoard fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    double value = decoder.getDouble('value');
    double sum = decoder.getDouble('sum');
    String metric = decoder.getString('metric');
    String tag = decoder.getString('tag');
    double processBar = decoder.getDouble('processBar');
    String title = decoder.getString('title');
    String email = decoder.getString('email');
    String image = Images.randomImage(Images.avatars);

    return DashBoard(decoder.getId, value, sum, metric, tag, processBar, title,
        email, image);
  }

  static List<DashBoard> listFromJSON(List<dynamic> list) {
    return list.map((e) => DashBoard.fromJSON(e)).toList();
  }

  static List<DashBoard>? _dummyList;

  static Future<List<DashBoard>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 5);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/dashboard.json');
  }
}
