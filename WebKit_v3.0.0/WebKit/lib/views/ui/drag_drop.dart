import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webkit/controller/ui/drag_drop_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/utils/utils.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_list_extension.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class DragDropPage extends StatefulWidget {
  const DragDropPage({Key? key}) : super(key: key);

  @override
  State<DragDropPage> createState() => _DragDropPageState();
}

class _DragDropPageState extends State<DragDropPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late DragDropController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DragDropController());
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
                      "${"drag".tr()} & ${"drop".tr()}",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ui'.tr()),
                        MyBreadcrumbItem(
                          name: "${"drag".tr()} & ${"drop".tr()}",
                          active: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-7 md-12",
                      child: ReorderableListView(
                        proxyDecorator: (child, index, animation) {
                          return Material(
                            child: child,
                          );
                        },
                        buildDefaultDragHandles: false,
                        shrinkWrap: true,
                        onReorder: controller.onReorder,
                        children: controller.dragDrop
                            .mapIndexed(
                              (index, element) => MyContainer.bordered(
                                paddingAll: 40,
                                key: Key('$index'),
                                child: ReorderableDragStartListener(
                                  index: index,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.grabbing,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyText.bodyMedium(controller
                                            .dragDrop[index].number
                                            .toString()),
                                        MyText.bodyMedium(
                                          Utils.getDateStringFromDateTime(
                                              controller
                                                  .dragDrop[index].sendAt),
                                        ),
                                        MyText.bodyMedium(
                                          controller.dragDrop[index].name,
                                        ),
                                        MyText.bodyMedium(
                                            controller
                                                .dragDrop[index].phoneNumber,
                                            textAlign: TextAlign.start),
                                        MyText.bodyMedium(
                                          "${controller.dragDrop[index].balance}",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
