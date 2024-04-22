import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/apps/mail_box_controller.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/utils/utils.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/models/mail_model.dart';
import 'package:webkit/views/layouts/layout.dart';

class MailBoxScreen extends StatefulWidget {
  const MailBoxScreen({super.key});

  @override
  State<MailBoxScreen> createState() => _MailBoxScreenState();
}

class _MailBoxScreenState extends State<MailBoxScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late MailBoxController controller;

  @override
  void initState() {
    controller = MailBoxController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'mail_box_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Mail Box",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Apps"),
                        MyBreadcrumbItem(name: "Mail Box", active: true),
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
                      sizes: 'lg-2',
                      child: MyCard(
                          borderRadiusAll: 8,
                          shadow: MyShadow(elevation: 0.5),
                          child: buildMailMenu()),
                    ),
                    MyFlexItem(
                      sizes: 'lg-10',
                      child: MyFlex(
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            child: MyCard(
                                shadow: MyShadow(elevation: 0.5),
                                borderRadiusAll: 8,
                                child: buildMailDetail()),
                          ),
                          MyFlexItem(
                              child: MyCard(
                                  borderRadiusAll: 8,
                                  height: 580,
                                  shadow: MyShadow(elevation: 0.5),
                                  child: controller.mail.isEmpty
                                      ? Center(
                                          child: MyText.titleMedium(
                                              "You have no new Mails",
                                              fontWeight: 600),
                                        )
                                      : ListView.separated(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          shrinkWrap: true,
                                          itemCount: controller.search.length,
                                          itemBuilder: (context, index) {
                                            MailModel mail =
                                                controller.search[index];
                                            return Row(
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                      unselectedWidgetColor:
                                                          Colors.transparent),
                                                  child: Transform.scale(
                                                    scale: .9,
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Checkbox(
                                                      value: mail.isToggle,
                                                      onChanged: (value) {
                                                        mail.isToggle =
                                                            !mail.isToggle;
                                                        controller
                                                            .singleSelectToggle();
                                                        setState(() {});
                                                      },
                                                      visualDensity:
                                                          getCompactDensity,
                                                    ),
                                                  ),
                                                ),
                                                MySpacing.width(12),
                                                Icon(LucideIcons.star,
                                                    size: 16),
                                                MySpacing.width(12),
                                                Icon(LucideIcons.stepForward,
                                                    size: 16),
                                                MySpacing.width(12),
                                                SizedBox(
                                                  width: 100,
                                                  child: MyText.bodyMedium(
                                                    mail.title,
                                                    fontWeight: 600,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                MySpacing.width(20),
                                                Expanded(
                                                  child: MyText.bodyMedium(
                                                      mail.description,
                                                      fontWeight: 600,
                                                      muted: true,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                MyText.bodySmall(
                                                    "${Utils.getTimeStringFromDateTime(mail.createdAt)}",
                                                    fontWeight: 600,
                                                    muted: true)
                                              ],
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return Divider(height: 28);
                                          },
                                        )))
                        ],
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

  Widget buildMailDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            runSpacing: 12,
            spacing: 12,
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.transparent),
                child: Transform.scale(
                  scale: .9,
                  alignment: Alignment.topCenter,
                  child: Checkbox(
                    value: controller.isChecked,
                    onChanged: (value) => controller.allSelectToggle(),
                    visualDensity: getCompactDensity,
                  ),
                ),
              ),
              InkWell(
                  onTap: () {}, child: Icon(LucideIcons.refreshCw, size: 18)),
              InkWell(
                  onTap: () {},
                  child: Icon(LucideIcons.archiveRestore, size: 18)),
              InkWell(onTap: () {}, child: Icon(LucideIcons.info, size: 18)),
              InkWell(
                  onTap: () => controller.removeData(),
                  child: Icon(LucideIcons.trash2, size: 18)),
              InkWell(onTap: () {}, child: Icon(LucideIcons.mail, size: 18)),
              InkWell(onTap: () {}, child: Icon(LucideIcons.tag, size: 18)),
              InkWell(onTap: () {}, child: Icon(LucideIcons.clock4, size: 18)),
            ],
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller.searchController,
            onChanged: controller.searchMail,
            decoration: InputDecoration(
                prefixIcon: Icon(LucideIcons.search, size: 16),
                hintText: "Search for...",
                hintStyle: MyTextStyle.bodyMedium(fontWeight: 600),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                disabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: MySpacing.all(8)),
          ),
        )
      ],
    );
  }

  Widget buildMailMenu() {
    Widget menuItem(IconData icon, String title) {
      return Row(
        children: [
          Icon(icon, size: 16),
          MySpacing.width(12),
          MyText.bodyMedium(title, fontWeight: 600, muted: true),
        ],
      );
    }

    Widget label(Color color, String title) {
      return Row(
        children: [
          MyContainer.roundBordered(
            paddingAll: 6,
            borderColor: color,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: MyContainer.rounded(
              paddingAll: 2,
              color: color,
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
          ),
          MySpacing.width(12),
          MyText.bodyMedium(title, fontWeight: 600, muted: true)
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyContainer(
          color: contentTheme.danger,
          paddingAll: 0,
          height: 40,
          borderRadiusAll: 8,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onTap: () => controller.isAlertBox(),
          child: Expanded(
            child: Center(
              child: MyText.bodyMedium(
                "Compose Email",
                fontWeight: 600,
                color: contentTheme.onDanger,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        MySpacing.height(20),
        menuItem(LucideIcons.inbox, 'Inbox'),
        MySpacing.height(16),
        menuItem(LucideIcons.star, 'Starred'),
        MySpacing.height(16),
        menuItem(LucideIcons.squareEqual, 'Draft'),
        MySpacing.height(16),
        menuItem(LucideIcons.stepForward, 'Important'),
        MySpacing.height(16),
        menuItem(LucideIcons.alertOctagon, 'Spam'),
        MySpacing.height(16),
        menuItem(LucideIcons.userCircle2, 'Contact'),
        MySpacing.height(16),
        menuItem(LucideIcons.trash2, 'Trash'),
        MySpacing.height(20),
        MyText.titleMedium("CATEGORY", fontWeight: 600),
        MySpacing.height(20),
        menuItem(LucideIcons.radioTower, 'Social'),
        MySpacing.height(16),
        menuItem(LucideIcons.squirrel, 'Updates'),
        MySpacing.height(16),
        menuItem(LucideIcons.fileText, 'Forms'),
        MySpacing.height(16),
        menuItem(LucideIcons.tag, 'Promotion'),
        MySpacing.height(20),
        MyText.titleMedium("LABEL", fontWeight: 600),
        MySpacing.height(20),
        label(contentTheme.danger, "Support"),
        MySpacing.height(16),
        label(contentTheme.purple, "Freelancer"),
        MySpacing.height(16),
        label(contentTheme.info, "Personal"),
      ],
    );
  }
}

class SingleSelection extends StatefulWidget {
  final MailModel mailModel;

  const SingleSelection({super.key, required this.mailModel});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
