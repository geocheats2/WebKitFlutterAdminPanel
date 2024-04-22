import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/identifier_model.dart';

class Opportunities extends IdentifierModel {
  final String name, location, category, email, phoneNumber, image;

  Opportunities(super.id, this.name, this.location, this.category, this.email,
      this.phoneNumber, this.image);

  static Opportunities fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String location = decoder.getString('location');
    String category = decoder.getString('category');
    String email = decoder.getString('email');
    String phoneNumber = decoder.getString('phone_number');
    String image = Images.randomImage(Images.social);

    return Opportunities(
        decoder.getId, name, location, category, email, phoneNumber, image);
  }

  static List<Opportunities> listFromJSON(List<dynamic> list) {
    return list.map((e) => Opportunities.fromJSON(e)).toList();
  }

  static List<Opportunities>? _dummyList;

  static Future<List<Opportunities>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 30);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/opportunities_data.json');
  }
}
