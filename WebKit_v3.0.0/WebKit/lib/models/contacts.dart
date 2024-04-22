import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/identifier_model.dart';

class Contacts extends IdentifierModel {
  final String name, phoneNumber, email, company, image;
  final DateTime createdAt;

  Contacts(super.id, this.name, this.phoneNumber, this.email, this.company,
      this.createdAt, this.image);

  static Contacts fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String phoneNumber = decoder.getString('phone_number');
    String email = decoder.getString('email');
    String company = decoder.getString('company');
    DateTime createdAt = decoder.getDateTime('created_at');
    String image = Images.randomImage(Images.avatars);

    return Contacts(
      decoder.getId,
      name,
      phoneNumber,
      email,
      company,
      createdAt,
      image,
    );
  }

  static List<Contacts> listFromJSON(List<dynamic> list) {
    return list.map((e) => Contacts.fromJSON(e)).toList();
  }

  static List<Contacts>? _dummyList;

  static Future<List<Contacts>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 30);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/contacts_data.json');
  }
}
