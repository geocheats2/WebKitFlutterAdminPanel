import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_dotted_line.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/models/discover.dart';
import 'package:webkit/views/layouts/layout.dart';

import '../../controller/ui/discover_jobs_controller.dart';

class DiscoverJobs extends StatefulWidget {
  const DiscoverJobs({Key? key}) : super(key: key);

  @override
  State<DiscoverJobs> createState() => _DiscoverJobsState();
}

class _DiscoverJobsState extends State<DiscoverJobs>
    with SingleTickerProviderStateMixin, UIMixin {
  late DiscoverJobsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DiscoverJobsController());
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
                      "Discover",
                      fontWeight: 600,
                      fontSize: 18,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "UI"),
                        MyBreadcrumbItem(name: "Discover", active: true),
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
                      sizes: "xxl-3 xl-3 md-5 sm-12",
                      child: Column(
                        children: [
                          MyContainer(
                            paddingAll: 0,
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              title: MyText.titleMedium(
                                'Type of Employment',
                              ),
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.jobType.length,
                                  itemBuilder: (context, index) {
                                    return CheckboxListTile(
                                      contentPadding: MySpacing.zero,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title:
                                          Text(controller.jobType[index].name),
                                      value:
                                          controller.jobType[index].isChecked,
                                      onChanged: (bool? value) {
                                        controller.jobType[index].isChecked =
                                            value!;
                                        setState(() {});
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          MyContainer(
                            paddingAll: 0,
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              title: MyText.titleMedium(
                                'Seniority Level',
                              ),
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.seniorityLevel.length,
                                  itemBuilder: (context, index) {
                                    return CheckboxListTile(
                                      contentPadding: MySpacing.zero,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(controller
                                          .seniorityLevel[index].name),
                                      value: controller
                                          .seniorityLevel[index].isChecked,
                                      onChanged: (bool? value) {
                                        controller.seniorityLevel[index]
                                            .isChecked = value!;
                                        setState(() {});
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xxl-4 xl-4 md-7 sm12",
                      child: SizedBox(
                        height: 785,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.discover.length,
                          separatorBuilder: (context, index) {
                            return DiscoveryWidget(
                              discover: controller.discover[index],
                            );
                          },
                          itemBuilder: (context, index) {
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xxl-5 xl-5",
                      child: MyContainer(
                        paddingAll: 0,
                        child: Column(
                          children: [
                            MyContainer(
                              paddingAll: 0,
                              height: 300,
                              child: Stack(
                                children: [
                                  MyContainer(
                                      paddingAll: 0,
                                      borderRadiusAll: 0,
                                      height: 150,
                                      width: double.infinity,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        Images.portraitImages[1],
                                        fit: BoxFit.fitWidth,
                                      )),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: MySpacing.only(left: 20, top: 8),
                                      child: MyContainer(
                                        paddingAll: 4,
                                        child: MyContainer(
                                          paddingAll: 0,
                                          height: 100,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.asset(
                                            Images.avatars[1],
                                            fit: BoxFit.cover,
                                            height: 100,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: MySpacing.only(
                                        left: 16,
                                        right: 16,
                                        bottom: 50,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: MyText.bodyMedium(
                                                  "Amanda Smith",
                                                  textAlign: TextAlign.start,
                                                  fontWeight: 600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              MyContainer.bordered(
                                                paddingAll: 0,
                                                child: IconButton(
                                                  onPressed: () {
                                                    controller.onChangeLike();
                                                  },
                                                  icon: Icon(
                                                    controller.showLike
                                                        ? Icons
                                                            .favorite_outlined
                                                        : Icons
                                                            .favorite_outline,
                                                  ),
                                                ),
                                              ),
                                              MySpacing.width(16),
                                              const MyContainer.bordered(
                                                paddingAll: 8,
                                                child: Icon(
                                                  LucideIcons.share2,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Wrap(
                              spacing: 20,
                              runSpacing: 16,
                              children: [
                                buildDottedContainer(
                                  "Experiance",
                                  "Minimum 1 Year",
                                ),
                                buildDottedContainer(
                                  "Work Level",
                                  "Senior Level",
                                ),
                                buildDottedContainer(
                                  "Employee Type",
                                  "Full Time Job",
                                ),
                                buildDottedContainer(
                                  "Offer Salary",
                                  "\$2150.0/ Month",
                                ),
                              ],
                            ),
                            const Divider(
                              height: 40,
                            ),
                            Padding(
                              padding: MySpacing.only(left: 12, right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleMedium(
                                    "OverView",
                                    fontWeight: 600,
                                  ),
                                  MySpacing.height(16),
                                  MyText.bodyMedium(
                                    controller.dummyTexts[0],
                                    maxLines: 5,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 40,
                            ),
                            Padding(
                              padding: MySpacing.only(left: 12, right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.titleMedium(
                                    "Job Description",
                                    fontWeight: 600,
                                  ),
                                  MySpacing.height(16),
                                  builderJobDescription(
                                      "3+ years working as a product designer."),
                                  MySpacing.height(16),
                                  builderJobDescription(
                                      "A portfolio that highlights your approach to problem solving, as well as your skills in UI."),
                                  MySpacing.height(16),
                                  builderJobDescription(
                                      "Experience conducting research and building out smooth flows for different types of users"),
                                  MySpacing.height(16),
                                  builderJobDescription(
                                      "Excellent communication skills with a well-defined design process."),
                                  MySpacing.height(16),
                                  builderJobDescription(
                                      "Familiarity with design tools like Sketch and Figma."),
                                  MySpacing.height(16),
                                  builderJobDescription(
                                      "Up-level our overall design and bring consistency to end-user facing properties."),
                                  MySpacing.height(16),
                                ],
                              ),
                            )
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

  Widget buildDottedContainer(String title, String subTitle) {
    return MyDottedLine(
      child: Padding(
        padding: MySpacing.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.bodyMedium(title),
            MyText.titleMedium(subTitle),
          ],
        ),
      ),
    );
  }

  Widget builderJobDescription(String description) {
    return Row(
      children: [
        MyContainer.roundBordered(
          paddingAll: 4,
          color: contentTheme.primary,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        ),
        MySpacing.width(16),
        Expanded(
          child: MyText.bodyMedium(
            description,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class DiscoveryWidget extends StatefulWidget {
  final Discover discover;

  const DiscoveryWidget({Key? key, required this.discover}) : super(key: key);

  @override
  State<DiscoveryWidget> createState() => _DiscoveryWidgetState();
}

class _DiscoveryWidgetState extends State<DiscoveryWidget> with UIMixin {
  late Discover discover;
  bool showLike = false;

  @override
  void initState() {
    super.initState();
    discover = widget.discover;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyContainer(
          child: Column(
            children: [
              Row(children: [
                MyContainer(
                  height: 60,
                  width: 60,
                  paddingAll: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    discover.image,
                    fit: BoxFit.cover,
                  ),
                ),
                MySpacing.width(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyLarge(discover.name),
                      MyText.bodyMedium(discover.address, muted: true),
                    ],
                  ),
                ),
                MyContainer(
                    height: 40,
                    width: 40,
                    paddingAll: 0,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            showLike = !showLike;
                          });
                        },
                        icon: Icon(
                            showLike
                                ? Icons.favorite_outlined
                                : Icons.favorite_outline,
                            size: 24)))
              ]),
              MySpacing.height(16),
              Row(
                children: [
                  MyButton(
                    onPressed: () {},
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    borderColor: contentTheme.primary,
                    backgroundColor: contentTheme.primary.withOpacity(0.12),
                    splashColor: contentTheme.primary.withOpacity(0.2),
                    borderRadiusAll: AppStyle.buttonRadius.medium,
                    child: MyText.bodySmall(
                      'Full Time',
                      color: contentTheme.primary,
                    ),
                  ),
                  MySpacing.width(16),
                  MyButton(
                    onPressed: () {},
                    elevation: 0,
                    padding: MySpacing.xy(12, 8),
                    borderColor: contentTheme.primary,
                    backgroundColor: contentTheme.primary.withOpacity(0.12),
                    splashColor: contentTheme.primary.withOpacity(0.2),
                    borderRadiusAll: AppStyle.buttonRadius.medium,
                    child: MyText.bodySmall(
                      'Senior Level',
                      color: contentTheme.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
