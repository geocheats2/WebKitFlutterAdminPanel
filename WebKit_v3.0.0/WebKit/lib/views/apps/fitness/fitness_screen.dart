import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:webkit/controller/apps/fitness/fitness_controller.dart';
import 'package:webkit/helpers/theme/app_theme.dart';

import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';

import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/layout.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({super.key});

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late FitnessController controller;

  @override
  void initState() {
    controller = Get.put(FitnessController());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller.isWeb = MediaQuery.of(context).size.width > 767;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          final bool enableMultiView = controller.isClosed &&
              (controller.selectionMode == DateRangePickerSelectionMode.range ||
                  controller.selectionMode ==
                      DateRangePickerSelectionMode.multiRange ||
                  controller.selectionMode ==
                      DateRangePickerSelectionMode.extendableRange);

          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Fitness",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Apps"),
                        MyBreadcrumbItem(name: "Fitness", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: 'lg-9',
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            child: SizedBox(
                              height: 120,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: [
                                  buildWorkoutCategory(
                                    contentTheme.danger,
                                    Icons.favorite,
                                    '100',
                                    'Heart Rate',
                                  ),
                                  MySpacing.width(20),
                                  buildWorkoutCategory(
                                    contentTheme.info,
                                    Icons.local_fire_department_rounded,
                                    '60',
                                    'Calories Burn',
                                  ),
                                  MySpacing.width(20),
                                  buildWorkoutCategory(
                                    contentTheme.success,
                                    Icons.directions_run_rounded,
                                    '3.5 KM',
                                    'Running',
                                  ),
                                  MySpacing.width(20),
                                  buildWorkoutCategory(
                                    contentTheme.primary,
                                    Icons.timelapse_rounded,
                                    '8 Hours',
                                    'Sleeping',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            sizes: 'lg-8',
                            child: MyContainer(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText.bodyMedium(
                                        "Activity",
                                        fontWeight: 600,
                                      ),
                                      PopupMenuButton(
                                        onSelected:
                                            controller.onSelectedActivity,
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            "Year",
                                            "Month",
                                            "Week",
                                            "Day",
                                            "Hours"
                                          ].map((behavior) {
                                            return PopupMenuItem(
                                              value: behavior,
                                              height: 32,
                                              child: MyText.bodySmall(
                                                behavior.toString(),
                                                color: theme
                                                    .colorScheme.onBackground,
                                                fontWeight: 600,
                                              ),
                                            );
                                          }).toList();
                                        },
                                        color: theme.cardTheme.color,
                                        child: MyContainer(
                                          padding: MySpacing.xy(12, 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              MyText.labelMedium(
                                                controller.selectedActivity
                                                    .toString(),
                                                color: theme
                                                    .colorScheme.onBackground,
                                              ),
                                              Icon(
                                                LucideIcons.chevronDown,
                                                size: 22,
                                                color: theme
                                                    .colorScheme.onBackground,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SfCartesianChart(
                                    plotAreaBorderWidth: 0,
                                    primaryXAxis: CategoryAxis(
                                      majorGridLines:
                                          const MajorGridLines(width: 0),
                                    ),
                                    primaryYAxis: NumericAxis(
                                        // majorGridLines:
                                        // const MajorGridLines(width: 0),
                                        ),
                                    series: <ChartSeries>[
                                      SplineSeries<ChartSampleData, String>(
                                        color: const Color(0xff727cf5),
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                          borderWidth: 100,
                                          showZeroValue: true,
                                        ),
                                        dataSource: controller.activityChart,
                                        xValueMapper:
                                            (ChartSampleData data, _) => data.x,
                                        yValueMapper:
                                            (ChartSampleData data, _) => data.y,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                              sizes: 'lg-4',
                              child: MyContainer(
                                child: SizedBox(
                                    height: 338,
                                    child: _buildAngleRadialBarChart()),
                              )),
                          MyFlexItem(
                            child: MyContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText.bodyMedium("Recommended Food",
                                          textAlign: TextAlign.end,
                                          fontWeight: 600),
                                      PopupMenuButton(
                                        onSelected: controller.onSelectedFood,
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            "Year",
                                            "Month",
                                            "Week",
                                            "Day",
                                            "Hours"
                                          ].map((behavior) {
                                            return PopupMenuItem(
                                              value: behavior,
                                              height: 32,
                                              child: MyText.bodySmall(
                                                behavior.toString(),
                                                color: theme
                                                    .colorScheme.onBackground,
                                                fontWeight: 600,
                                              ),
                                            );
                                          }).toList();
                                        },
                                        color: theme.cardTheme.color,
                                        child: MyContainer(
                                          padding: MySpacing.xy(12, 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              MyText.labelMedium(
                                                controller.selectedFood
                                                    .toString(),
                                                color: theme
                                                    .colorScheme.onBackground,
                                              ),
                                              Icon(
                                                LucideIcons.chevronDown,
                                                size: 22,
                                                color: theme
                                                    .colorScheme.onBackground,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 130,
                                    child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        buildRecommendedFood(
                                            Images.veggies,
                                            'Fresh Veggies',
                                            '7 Days',
                                            'Only dinner time'),
                                        MySpacing.width(16),
                                        buildRecommendedFood(
                                            Images.fruits,
                                            'Fresh Fruits',
                                            '12 Days',
                                            'Only Lunch time'),
                                        MySpacing.width(16),
                                        buildRecommendedFood(
                                            Images.fruitsJuice,
                                            'Fresh Fruits Juice',
                                            '7 Days',
                                            'Only BreakFast time'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          MyFlexItem(
                            child: MyFlex(
                              contentPadding: false,
                              children: [
                                MyFlexItem(
                                  sizes: 'lg-3 md-6',
                                  child: MyContainer(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: MyText.bodyMedium(
                                                "Popular Trainer",
                                                fontWeight: 600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                MyText.bodyMedium(
                                                  'ViewAll',
                                                  fontWeight: 600,
                                                ),
                                                MySpacing.width(4),
                                                Icon(LucideIcons.chevronRight)
                                              ],
                                            ),
                                          ],
                                        ),
                                        MySpacing.height(12),
                                        SizedBox(
                                          height: 192,
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            children: [
                                              buildTrainer(Images.avatars[0],
                                                  'Jack Amanda', 'Gym Expert'),
                                              MySpacing.width(12),
                                              buildTrainer(Images.avatars[2],
                                                  'Olive Yew', 'Yoga Expert'),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                MyFlexItem(
                                  sizes: 'lg-9 md-6',
                                  child: MyContainer(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            MyText.bodyMedium(
                                              'Output',
                                              fontWeight: 600,
                                            ),
                                            PopupMenuButton(
                                              onSelected:
                                                  controller.onSelectedOutPut,
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return [
                                                  "Year",
                                                  "Month",
                                                  "Week",
                                                  "Day",
                                                  "Hours"
                                                ].map((behavior) {
                                                  return PopupMenuItem(
                                                    value: behavior,
                                                    height: 32,
                                                    child: MyText.bodySmall(
                                                      behavior.toString(),
                                                      color: theme.colorScheme
                                                          .onBackground,
                                                      fontWeight: 600,
                                                    ),
                                                  );
                                                }).toList();
                                              },
                                              color: theme.cardTheme.color,
                                              child: MyContainer(
                                                padding: MySpacing.xy(12, 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    MyText.labelMedium(
                                                      controller.selectedOutPut
                                                          .toString(),
                                                      color: theme.colorScheme
                                                          .onBackground,
                                                    ),
                                                    Icon(
                                                      LucideIcons.chevronDown,
                                                      size: 22,
                                                      color: theme.colorScheme
                                                          .onBackground,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        MySpacing.height(12),
                                        buildOutPut(
                                            contentTheme.primary,
                                            LucideIcons.rocket,
                                            'Boost energy',
                                            '.125 gm',
                                            '😊 WOW'),
                                        MySpacing.height(16),
                                        buildOutPut(
                                            contentTheme.success,
                                            LucideIcons.dumbbell,
                                            'Weight Loos',
                                            '3 Kg',
                                            '😇 Great')
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: 'lg-3 ',
                      child: MyContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildProfileDetail(),
                            MySpacing.height(12),
                            Padding(
                              padding: MySpacing.x(8),
                              child: getGettingStartedDatePicker(
                                  controller.controller,
                                  controller.selectionMode,
                                  controller.showTrailingAndLeadingDates,
                                  controller.enablePastDates,
                                  controller.enableSwipingSelection,
                                  controller.enableViewNavigation,
                                  controller.showActionButtons,
                                  DateTime.now()
                                      .subtract(const Duration(days: 200)),
                                  DateTime.now().add(const Duration(days: 200)),
                                  enableMultiView,
                                  controller.showWeekNumber,
                                  context),
                            ),
                            MyText.bodyMedium('Schedule', fontWeight: 600),
                            MySpacing.height(8),
                            buildScheduled(
                              'Fitness',
                              'Training Yoga Class',
                              '12 Apr',
                            ),
                            MySpacing.height(16),
                            buildScheduled(
                              'Cardio',
                              'Training Swimming',
                              '20 Apr',
                            ),
                          ],
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

  Widget buildOutPut(
      Color color, IconData icon, String title, String weight, String emoji) {
    return MyContainer(
      color: color.withAlpha(40),
      child: Row(
        children: [
          MyContainer(
            paddingAll: 0,
            height: 50,
            width: 50,
            color: color,
            child: Center(
              child: Icon(
                icon,
                color: contentTheme.onPrimary,
              ),
            ),
          ),
          MySpacing.width(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  title,
                  fontWeight: 600,
                ),
                MyText.bodyMedium(
                  weight,
                  fontWeight: 600,
                  color: color,
                ),
              ],
            ),
          ),
          MyText.bodyMedium(emoji),
        ],
      ),
    );
  }

  Widget buildScheduled(String name, String title, String time) {
    return MyContainer.bordered(
      borderRadiusAll: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium(name, fontWeight: 600, muted: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                title,
                fontWeight: 600,
              ),
              MyText.bodyMedium(time, fontWeight: 600, muted: true),
            ],
          )
        ],
      ),
    );
  }

  SfDateRangePicker getGettingStartedDatePicker(
      DateRangePickerController controller,
      DateRangePickerSelectionMode mode,
      bool showLeading,
      bool enablePastDates,
      bool enableSwipingSelection,
      bool enableViewNavigation,
      bool showActionButtons,
      DateTime minDate,
      DateTime maxDate,
      bool enableMultiView,
      bool showWeekNumber,
      BuildContext context) {
    return SfDateRangePicker(
      enablePastDates: enablePastDates,
      minDate: minDate,
      maxDate: maxDate,
      enableMultiView: enableMultiView,
      allowViewNavigation: enableViewNavigation,
      selectionMode: mode,
      controller: controller,
      monthViewSettings: DateRangePickerMonthViewSettings(
          enableSwipeSelection: enableSwipingSelection,
          showTrailingAndLeadingDates: showLeading,
          weekNumberStyle: DateRangePickerWeekNumberStyle(
              textStyle: MyTextStyle.bodyMedium()),
          showWeekNumber: showWeekNumber),
    );
  }

  Widget buildProfileDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyMedium(
          'Profile',
          fontWeight: 600,
        ),
        MySpacing.height(12),
        Center(
          child: MyContainer.roundBordered(
            paddingAll: 2,
            child: MyContainer.rounded(
              paddingAll: 0,
              height: 100,
              child: Image.asset(Images.avatars[2]),
            ),
          ),
        ),
        Center(
          child: MyText.bodyMedium(
            'Mike Rowe',
            fontWeight: 600,
          ),
        ),
        Center(
          child: MyText.bodyMedium(
            '@mikerowe',
            fontWeight: 600,
            muted: true,
          ),
        ),
        MySpacing.height(12),
        MyContainer.bordered(
          borderRadiusAll: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildProfileOverView('55 Kg', 'Weight'),
              buildProfileOverView('180 cm', 'Height'),
              buildProfileOverView('25', 'Age'),
            ],
          ),
        ),
        MySpacing.height(12),
        MyText.bodyMedium("Calendar", fontWeight: 600),
      ],
    );
  }

  Widget buildProfileOverView(String title, String subTitle) {
    return Column(
      children: [
        MyText.bodyMedium(title, fontWeight: 600),
        MyText.bodyMedium(subTitle, fontWeight: 600, muted: true),
      ],
    );
  }

  Widget buildTrainer(String image, String title, String subTitle) {
    return MyContainer.bordered(
      paddingAll: 0,
      width: 120,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 130,
            fit: BoxFit.cover,
          ),
          MySpacing.height(8),
          Padding(
            padding: MySpacing.x(12),
            child: MyText.bodyMedium(
              title,
              fontWeight: 600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: MySpacing.x(12),
            child: MyText.bodyMedium(
              subTitle,
              fontWeight: 600,
              muted: true,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget buildRecommendedFood(
      String image, String title, String days, String time) {
    return SizedBox(
      height: 130,
      width: 300,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: MyContainer.bordered(
              width: 275,
              child: Padding(
                padding: MySpacing.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyText.bodyMedium(
                      title,
                      fontWeight: 600,
                      fontSize: 16,
                    ),
                    MyText.bodyMedium(
                      days,
                      color: contentTheme.primary,
                      fontWeight: 600,
                    ),
                    MyText.bodyMedium(
                      time,
                      fontWeight: 600,
                      muted: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: MySpacing.only(right: 100),
            child: MyContainer(
              height: 70,
              width: 55,
              paddingAll: 0,
              borderRadiusAll: 8,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SfCircularChart _buildAngleRadialBarChart() {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Today Activity',
          textStyle: MyTextStyle.bodySmall(fontWeight: 600)),
      legend: Legend(
          isVisible: true,
          iconHeight: 20,
          iconWidth: 20,
          position: LegendPosition.right,
          overflowMode: LegendItemOverflowMode.none),
      series: controller.getRadialBarSeries(),
    );
  }

  Widget buildWorkoutCategory(
      Color color, IconData icon, String title, String subTitle) {
    return SizedBox(
      height: 120,
      width: 250,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: MyContainer(
                height: 100,
                paddingAll: 0,
                borderRadiusAll: 8,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 300,
                child: Stack(
                  children: [
                    Positioned(
                      top: 26,
                      width: 425,
                      child: Icon(
                        icon,
                        size: 120,
                        color: Colors.grey.withAlpha(40),
                      ),
                    ),
                    Padding(
                      padding: MySpacing.only(left: 12, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyText.bodyLarge(
                            title,
                            fontWeight: 600,
                          ),
                          MyText.bodyMedium(
                            subTitle,
                            fontWeight: 600,
                            muted: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: MySpacing.x(16),
            child: MyContainer(
              paddingAll: 0,
              height: 50,
              width: 50,
              color: color,
              child: Icon(
                icon,
                color: contentTheme.onDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
