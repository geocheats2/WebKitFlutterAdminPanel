import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webkit/helpers/services/json_decoder.dart';
import 'package:webkit/models/identifier_model.dart';

class Product extends IdentifierModel {
  final String name, description, image, category, sku;
  final double price, rating;
  final int stock, ordersCount, ratingCount;
  final DateTime createdAt;

  Product(
      super.id,
      this.name,
      this.description,
      this.image,
      this.category,
      this.sku,
      this.price,
      this.rating,
      this.stock,
      this.ordersCount,
      this.ratingCount,
      this.createdAt);

  static Product fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String description = decoder.getString('description');
    String image = decoder.getString('image');
    String category = decoder.getString('category');
    String sku = decoder.getString('sku');
    double price = decoder.getDouble('price');
    double rating = decoder.getDouble('rating');
    int stock = decoder.getInt('stock');
    int ordersCount = decoder.getInt('order_counts');
    int ratingCount = decoder.getInt('rating_count');
    DateTime createdAt = decoder.getDateTime('created_at');

    return Product(decoder.getId, name, description, image, category, sku,
        price, rating, stock, ordersCount, ratingCount, createdAt);
  }

  static List<Product> listFromJSON(List<dynamic> list) {
    return list.map((e) => Product.fromJSON(e)).toList();
  }

  //Dummy

  static List<Product>? _dummyList;

  static Future<List<Product>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 30);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/datas/products_data.json');
  }
}
