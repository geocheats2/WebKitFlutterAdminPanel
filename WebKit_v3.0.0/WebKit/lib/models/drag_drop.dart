import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/models/identifier_model.dart';

class DragDrop extends IdentifierModel {
  final String name, phoneNumber;
  final int number, balance;
  final DateTime sendAt;

  DragDrop(super.id, this.name, this.phoneNumber, this.number, this.balance,
      this.sendAt);

  static DragDrop fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String phoneNumber = decoder.getString('phone_number');
    int number = decoder.getInt('number');
    int balance = decoder.getInt('balance');
    DateTime sendAt = decoder.getDateTime('send_at');

    return DragDrop(decoder.getId, name, phoneNumber, number, balance, sendAt);
  }

  static List<DragDrop> listFromJSON(List<dynamic> list) {
    return list.map((e) => DragDrop.fromJSON(e)).toList();
  }

  static List<DragDrop>? _dummyList;

  static Future<List<DragDrop>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/drag_drop_data.json');
  }
}
