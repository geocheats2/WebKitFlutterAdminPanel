// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/identifier_model.dart';

class NFTDashboardModel extends IdentifierModel {
  final String name, companyName, cartoonImage, image;
  final int number, item;
  final double ETH;

  NFTDashboardModel(super.id, this.name, this.companyName, this.number,
      this.item, this.ETH, this.cartoonImage, this.image);

  static NFTDashboardModel fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String companyName = decoder.getString('company_name');
    int number = decoder.getInt('number');
    int item = decoder.getInt('item');
    double ETH = decoder.getDouble('ETH');
    String cartoonImage = Images.randomImage(Images.cartoon);
    String image = Images.randomImage(Images.cartoonBackground);

    return NFTDashboardModel(decoder.getId, name, companyName, number, item,
        ETH, cartoonImage, image);
  }

  static List<NFTDashboardModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => NFTDashboardModel.fromJSON(e)).toList();
  }

  static List<NFTDashboardModel>? _dummyList;

  static Future<List<NFTDashboardModel>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 20);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/nft_dashboard_data.json');
  }
}
