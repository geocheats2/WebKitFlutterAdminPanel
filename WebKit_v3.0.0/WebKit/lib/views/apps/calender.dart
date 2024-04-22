import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:webkit/controller/apps/calender/calender_controller.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender>
    with SingleTickerProviderStateMixin, UIMixin {
  late CalenderController controller; 

  @override
  void initState() {
    super.initState();
    controller = Get.put(CalenderController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Calender",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Apps"),
                        MyBreadcrumbItem(name: "Calender", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyCard(
                  shadow: MyShadow(elevation: 0.5),
                  height: 700,
                  child: SfCalendar(
                    view: CalendarView.month,
                    allowedViews: const [
                      CalendarView.day,
                      CalendarView.week,
                      CalendarView.month,
                    ],
                    dataSource: controller.events,
                    allowDragAndDrop: true,
                    onDragEnd: controller.dragEnd,
                    monthViewSettings: const MonthViewSettings(
                      showAgenda: true,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
