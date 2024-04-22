import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/extensions/extensions.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/models/identifier_model.dart';

class ShoppingProduct extends IdentifierModel {
  String name, image, description;
  double price, rating;
  int review, quantity;
  Color color;
  bool favorite;

  ShoppingProduct(
      super.id,
      this.name,
      this.image,
      this.description,
      this.rating,
      this.price,
      this.review,
      this.quantity,
      this.color,
      this.favorite);
  static ShoppingProduct fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String image = decoder.getString('image');
    String description = decoder.getString('description');
    double price = decoder.getDouble('price');
    double rating = decoder.getDouble('rating');
    int review = decoder.getInt('review');
    int quantity = decoder.getInt('quantity');
    Color color = decoder.jsonObject['color'].toString().toColor;
    bool favorite = decoder.getBool('favorite');

    return ShoppingProduct(
      decoder.getId,
      name,
      image,
      description,
      rating,
      price,
      review,
      quantity,
      color,
      favorite,
    );
  }

  static List<ShoppingProduct> listFromJSON(List<dynamic> list) {
    return list.map((e) => ShoppingProduct.fromJSON(e)).toList();
  }

  static List<ShoppingProduct>? _dummyList;

  static Future<List<ShoppingProduct>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 10);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/shopping_product.json');
  }
}
