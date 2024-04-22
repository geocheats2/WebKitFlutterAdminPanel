import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/identifier_model.dart';

class Nft extends IdentifierModel {
  final String nftTitle, nftSubTitle, image;
  final int nftDollarPrice, nftPrice, price;
  final double nftProcessBar;

  Nft(
    super.id,
    this.nftTitle,
    this.nftSubTitle,
    this.image,
    this.nftDollarPrice,
    this.nftPrice,
    this.price,
    this.nftProcessBar,
  );

  static Nft fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String nftTitle = decoder.getString('nft_title');
    String nftSubTitle = decoder.getString('nft_subTitle');
    String image = Images.randomImage(Images.avatars);
    int nftDollarPrice = decoder.getInt('nft_dollar_price');
    int nftPrice = decoder.getInt('nft_price');
    int price = decoder.getInt('price');
    double nftProcessBar = decoder.getDouble('nft_processBar');

    return Nft(
      decoder.getId,
      nftTitle,
      nftSubTitle,
      image,
      nftDollarPrice,
      nftPrice,
      price,
      nftProcessBar,
    );
  }

  static List<Nft> listFromJSON(List<dynamic> list) {
    return list.map((e) => Nft.fromJSON(e)).toList();
  }

  static List<Nft>? _dummyList;

  static Future<List<Nft>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/nft_data.json');
  }
}
