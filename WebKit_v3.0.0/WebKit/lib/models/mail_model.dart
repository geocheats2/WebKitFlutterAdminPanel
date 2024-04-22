import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/models/identifier_model.dart';

class MailModel extends IdentifierModel {
  final String title, description;
  final DateTime createdAt;
  bool isToggle;

  MailModel(super.id, this.title, this.description, this.createdAt,this.isToggle);

  static MailModel fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String title = decoder.getString('title');
    String description = decoder.getString('description');
    DateTime createdAt = decoder.getDateTime('created_at');
    bool isToggle = decoder.getBool('is_toggle');

    return MailModel(decoder.getId, title, description, createdAt,isToggle);
  }

  static List<MailModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => MailModel.fromJSON(e)).toList();
  }

  static List<MailModel>? _dummyList;

  static Future<List<MailModel>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 20);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/mail_date.json');
  }
}
