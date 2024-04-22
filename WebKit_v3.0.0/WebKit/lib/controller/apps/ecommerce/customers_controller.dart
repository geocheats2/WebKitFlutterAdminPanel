import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/models/customer.dart';

import '../../../views/apps/ecommerce/customers.dart';

class CustomersController extends MyController {
  List<Customer> customers = [];
  DataTableSource? data;

  CustomersController();

  int currentPage = 1;

  @override
  void onInit() {
    super.onInit();

    Customer.dummyList.then((value) {
      customers = value;
      data = MyData(customers);
      update();
    });
  }

  void goToDashboard() {
    Get.toNamed('/dashboard');
  }
}
