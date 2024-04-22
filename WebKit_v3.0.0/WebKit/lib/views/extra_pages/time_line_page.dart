import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:webkit/controller/extra_pages/time_line_controller.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage>
    with SingleTickerProviderStateMixin, UIMixin {
  late TimeLineController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(TimeLineController());
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
                      "Time Line",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Extra Pages"),
                        MyBreadcrumbItem(name: "Time Line", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: Column(
                  children: [
                    SizedBox(
                      height: 800,
                      child: Timeline.tileBuilder(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: TimelineTileBuilder.fromStyle(
                          indicatorStyle: IndicatorStyle.outlined,
                          itemCount: controller.discover.length,
                          contentsAlign: ContentsAlign.alternating,
                          contentsBuilder: (context, index) {
                            return MyContainer(
                              child: Wrap(
                                alignment: index % 2 == 1
                                    ? WrapAlignment.end
                                    : WrapAlignment.start,
                                spacing: 16,
                                // mainAxisAlignment: index%2==1? MainAxisAlignment.end:MainAxisAlignment.start,
                                children: [
                                  if (index % 2 == 0)
                                    MyContainer.rounded(
                                      paddingAll: 0,
                                      height: 50,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        controller.discover[index].image,
                                      ),
                                    ),
                                  Column(
                                    crossAxisAlignment: index % 2 == 1
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: [
                                      MyText.titleMedium(
                                        controller.discover[index].name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      MyText.bodyMedium(
                                        controller.discover[index].address,
                                        muted: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  if (index % 2 == 1)
                                    MyContainer.rounded(
                                      paddingAll: 0,
                                      height: 50,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        controller.discover[index].image,
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
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
