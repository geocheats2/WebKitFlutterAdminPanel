import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webkit/controller/error_pages/maintenance_controller.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_text.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage>
    with SingleTickerProviderStateMixin, UIMixin {
  late MaintenanceController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MaintenanceController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText.bodyMedium(
                  "Oops !",
                  fontSize: 52,
                ),
                MyText.bodyMedium(
                  "We are down for maintenance. Please check back later.",
                  fontSize: 24,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
