import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:webkit/controller/other/sfmap_controller.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class SfMapPage extends StatefulWidget {
  const SfMapPage({Key? key}) : super(key: key);

  @override
  State<SfMapPage> createState() => _SfMapPageState();
}

class _SfMapPageState extends State<SfMapPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late SfMapController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(SfMapController());
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
                      "SFMaps",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Maps'),
                        MyBreadcrumbItem(name: 'Sf Map', active: true),
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
                      sizes: "lg-7",
                      child: MyContainer(
                        child: Column(
                          children: [
                            MyText.titleMedium(
                              'Data Labels',
                              fontWeight: 600,
                            ),
                            MySpacing.height(flexSpacing),
                            SfMaps(
                              layers: [
                                MapShapeLayer(
                                  source: controller.dataSource,
                                  showDataLabels: true,
                                  dataLabelSettings: const MapDataLabelSettings(
                                    overflowMode: MapLabelOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer(
                        child: Column(
                          children: [
                            MyText.titleMedium(
                              "European Time Zones",
                              fontWeight: 600,
                            ),
                            MySpacing.height(flexSpacing),
                            SfMaps(
                              layers: <MapLayer>[
                                MapShapeLayer(
                                  loadingBuilder: (BuildContext context) {
                                    return const SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                      ),
                                    );
                                  },
                                  source: controller.mapSource,
                                  shapeTooltipBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MyText.bodyMedium(
                                        '${controller.timeZones[index].countryName} : ${controller.timeZones[index].gmtTime}',
                                        color: contentTheme.light,
                                      ),
                                    );
                                  },
                                  legend: const MapLegend.bar(
                                    MapElement.shape,
                                    position: MapLegendPosition.bottom,
                                    padding: EdgeInsets.only(top: 15),
                                    segmentSize: Size(60.0, 10.0),
                                  ),
                                  tooltipSettings: const MapTooltipSettings(
                                      color: Color.fromRGBO(45, 45, 45, 1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer(
                        child: Column(
                          children: [
                            MyText.titleMedium(
                              "World Population Density (per sq. km.)",
                              fontWeight: 600,
                            ),
                            MySpacing.height(flexSpacing),
                            SfMaps(
                              layers: <MapLayer>[
                                MapShapeLayer(
                                  loadingBuilder: (BuildContext context) {
                                    return const SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                      ),
                                    );
                                  },
                                  source: controller.mapSource1,
                                  shapeTooltipBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${controller.worldPopulationDensity[index].countryName} : ${controller.numberFormat.format(controller.worldPopulationDensity[index].density)} per sq. km.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface)),
                                    );
                                  },
                                  strokeColor: Colors.white30,
                                  legend: const MapLegend.bar(MapElement.shape,
                                      position: MapLegendPosition.bottom,
                                      overflowMode: MapLegendOverflowMode.wrap,
                                      labelsPlacement:
                                          MapLegendLabelsPlacement.betweenItems,
                                      padding: EdgeInsets.only(top: 15),
                                      spacing: 1.0,
                                      segmentSize: Size(55.0, 9.0)),
                                  tooltipSettings: MapTooltipSettings(
                                      color: theme.colorScheme.brightness ==
                                              Brightness.light
                                          ? const Color.fromRGBO(0, 32, 128, 1)
                                          : const Color.fromRGBO(
                                              226, 233, 255, 1),
                                      strokeColor:
                                          theme.colorScheme.brightness ==
                                                  Brightness.light
                                              ? Colors.white
                                              : Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer(
                        child: Column(
                          children: [
                            MyText.titleMedium(
                              'World Clock',
                              fontWeight: 600,
                            ),
                            MySpacing.height(flexSpacing),
                            SizedBox(
                                height: 500,
                                child: SfMaps(
                                  layers: <MapLayer>[
                                    MapShapeLayer(
                                      loadingBuilder: (BuildContext context) {
                                        return const SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                          ),
                                        );
                                      },
                                      source: controller.mapSource2,
                                      initialMarkersCount: 7,
                                      markerBuilder: (_, int index) {
                                        return MapMarker(
                                          longitude: controller
                                              .worldClockData[index].longitude,
                                          latitude: controller
                                              .worldClockData[index].latitude,
                                          alignment: Alignment.topCenter,
                                          offset: const Offset(0, -4),
                                          size: const Size(150, 150),
                                          child: ClockWidget(
                                              countryName: controller
                                                  .worldClockData[index]
                                                  .countryName,
                                              date: controller
                                                  .worldClockData[index].date),
                                        );
                                      },
                                      strokeWidth: 0,
                                      color: theme.colorScheme.brightness ==
                                              Brightness.light
                                          ? const Color.fromRGBO(
                                              71, 70, 75, 0.2)
                                          : const Color.fromRGBO(71, 70, 75, 1),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
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
