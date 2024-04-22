import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/extensions/extensions.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/models/identifier_model.dart';
import 'package:webkit/models/shopping_product_data.dart';

class ShoppingCart extends IdentifierModel {
  ShoppingProduct product;
  String selectedSize;
  int quantity;
  Color selectedColor;

  ShoppingCart(
    super.id,
    this.product,
    this.selectedSize,
    this.quantity,
    this.selectedColor,
  );
  static ShoppingCart fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    ShoppingProduct product = ShoppingProduct.fromJSON(json['product']);
    String selectedSize = decoder.getString('selectedSize');
    int quantity = decoder.getInt('quantity');
    Color selectedColor =
        decoder.jsonObject['selectedColor'].toString().toColor;

    return ShoppingCart(
      decoder.getId,
      product,
      selectedSize,
      quantity,
      selectedColor,
    );
  }

  static List<ShoppingCart> listFromJSON(List<dynamic> list) {
    return list.map((e) => ShoppingCart.fromJSON(e)).toList();
  }

  static List<ShoppingCart>? _dummyList;

  static Future<List<ShoppingCart>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 4);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/shopping_cart.json');
  }
}
