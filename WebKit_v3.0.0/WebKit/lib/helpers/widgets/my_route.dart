import 'package:flutter/material.dart';
import 'package:webkit/helpers/widgets/my_middleware.dart';

class MyRoute {
  String name;
  WidgetBuilder builder;
  List<MyMiddleware>? middlewares;

  MyRoute({required this.name, required this.builder, this.middlewares});
}
