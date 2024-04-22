import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/apps/file_manager/file_manager_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/utils/utils.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_list_extension.dart';
import 'package:webkit/helpers/widgets/my_progress_bar.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/layout.dart';

class FileManager extends StatefulWidget {
  const FileManager({Key? key}) : super(key: key);

  @override
  State<FileManager> createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager>
    with SingleTickerProviderStateMixin, UIMixin {
  late FileManagerController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FileManagerController());
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
                      "File Manager",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "File"),
                        MyBreadcrumbItem(name: "File Manager", active: true),
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
                      sizes: "xxl-2 xl-3 lg-6 sm-12",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MyContainer.rounded(
                                  paddingAll: 0,
                                  height: 50,
                                  width: 50,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    Images.avatars[0],
                                    fit: BoxFit.cover,
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                MySpacing.width(12),
                                MyText.titleMedium(
                                  "Den G",
                                  fontWeight: 600,
                                ),
                              ],
                            ),
                            const Divider(
                              height: 50,
                            ),
                            MyButton(
                              onPressed: () {},
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: contentTheme.primary,
                              borderRadiusAll: AppStyle.buttonRadius.large,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LucideIcons.plus,
                                    color: contentTheme.onPrimary,
                                  ),
                                  MySpacing.width(8),
                                  MyText.bodySmall(
                                    'Create New',
                                    color: contentTheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                            MySpacing.height(24),
                            buildCreateNew("Home", LucideIcons.home),
                            MySpacing.height(16),
                            buildCreateNew("Document", LucideIcons.file),
                            MySpacing.height(16),
                            buildCreateNew("Download", LucideIcons.folderDown),
                            MySpacing.height(16),
                            buildCreateNew("Music", LucideIcons.music),
                            MySpacing.height(16),
                            buildCreateNew("Picture", LucideIcons.image),
                            MySpacing.height(16),
                            buildCreateNew("Video", LucideIcons.playSquare),
                            MySpacing.height(16),
                            buildCreateNew("Recent", LucideIcons.clock4),
                            MySpacing.height(16),
                            buildCreateNew("Delete File", LucideIcons.trash2),
                            MySpacing.height(40),
                            MyText.bodySmall(
                              "STORAGE",
                              fontWeight: 700,
                            ),
                            MySpacing.height(14),
                            MyProgressBar(
                              width: 200,
                              progress: 0.5,
                              height: 3,
                              radius: 4,
                              inactiveColor: theme.dividerColor,
                              activeColor: contentTheme.primary,
                            ),
                            MySpacing.height(14),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '1 GB ',
                                    style: MyTextStyle.bodyMedium(
                                      fontWeight: 700,
                                    ),
                                  ),
                                  TextSpan(
                                      text: '(50%) of  ',
                                      style: MyTextStyle.bodyMedium()),
                                  TextSpan(
                                    text: '2 GB',
                                    style: MyTextStyle.bodyMedium(
                                      fontWeight: 700,
                                    ),
                                  ),
                                  TextSpan(
                                      text: ' used',
                                      style: MyTextStyle.bodyMedium()),
                                ],
                              ),
                            ),
                            MySpacing.height(20),
                            Center(
                              child: MyButton(
                                onPressed: () {},
                                elevation: 0,
                                padding: MySpacing.xy(20, 16),
                                borderColor: contentTheme.primary,
                                backgroundColor:
                                    contentTheme.primary.withAlpha(28),
                                splashColor: contentTheme.primary.withAlpha(28),
                                borderRadiusAll: 20,
                                child: MyText.bodyMedium(
                                  'UPGRADE',
                                  color: contentTheme.primary,
                                  fontWeight: 600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "xxl-10 xl-9 lg-6 sm-12",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.titleMedium(
                              "Folders :",
                              fontSize: 20,
                            ),
                            MySpacing.height(12),
                            Wrap(
                              runSpacing: 20,
                              spacing: 20,
                              children: [
                                buildFileData(
                                    contentTheme.warning,
                                    LucideIcons.fileArchive,
                                    "File.zip",
                                    12582912),
                                buildFileData(contentTheme.info,
                                    LucideIcons.layoutGrid, "Apps", 4939212390),
                                buildFileData(
                                    contentTheme.secondary,
                                    LucideIcons.file,
                                    "Compile version",
                                    40802189312),
                                buildFileData(
                                    contentTheme.pink,
                                    LucideIcons.fileImage,
                                    "Picture",
                                    20401094656),
                                buildFileData(
                                    contentTheme.red,
                                    LucideIcons.fileText,
                                    "Licence.pdf",
                                    4718592),
                                buildFileData(
                                    contentTheme.primary,
                                    LucideIcons.fileType2,
                                    "Wedding-project.ppt",
                                    419430400),
                                buildFileData(
                                    contentTheme.success,
                                    LucideIcons.fileX,
                                    "Database.xlsx",
                                    17825792),
                                buildFileData(contentTheme.info,
                                    LucideIcons.folder, "Songs", 89900000000),
                              ],
                            ),
                            MySpacing.height(40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText.titleMedium(
                                  "Recent :",
                                  fontSize: 20,
                                ),
                                InkWell(
                                  onTap: controller.pickFile,
                                  child: MyContainer(
                                    padding: MySpacing.xy(12, 4),
                                    color: contentTheme.secondary.withAlpha(28),
                                    child: Row(
                                      children: [
                                        MyText.bodySmall("Upload File"),
                                        MySpacing.width(12),
                                        const Icon(
                                          LucideIcons.upload,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            MySpacing.height(12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: MyContainer.bordered(
                                paddingAll: 0,
                                borderRadiusAll: 4,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: DataTable(
                                  sortAscending: true,
                                  onSelectAll: (_) => {},
                                  headingRowColor: MaterialStatePropertyAll(
                                      contentTheme.secondary.withAlpha(30)),
                                  dataRowMaxHeight: 60,
                                  showBottomBorder: false,
                                  columns: [
                                    DataColumn(
                                      label: MyText.labelLarge(
                                        "Name",
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    DataColumn(
                                      label: MyText.labelLarge(
                                        "Last Modified",
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    DataColumn(
                                      label: MyText.labelLarge(
                                        "Size",
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    DataColumn(
                                      label: MyText.labelLarge(
                                        "Owner",
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    DataColumn(
                                      label: MyText.labelLarge(
                                        "Members",
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                    DataColumn(
                                      label: MyText.labelLarge(
                                        "Action",
                                        color: contentTheme.secondary,
                                      ),
                                    ),
                                  ],
                                  rows: [
                                    buildDataRows(
                                      "Flutter Design Files",
                                      DateTime.utc(2023, 1, 25),
                                      "Andrew",
                                      134217728,
                                      "Danielle Thompson",
                                      LucideIcons.folder,
                                      [
                                        Images.avatars[0],
                                        Images.avatars[1],
                                        Images.avatars[2],
                                        Images.avatars[3],
                                      ],
                                    ),
                                    buildDataRows(
                                      "Sketch File",
                                      DateTime.utc(2020, 2, 13),
                                      "Getappui",
                                      546308096,
                                      "Coder Themes",
                                      LucideIcons.folder,
                                      [
                                        Images.avatars[0],
                                        Images.avatars[2],
                                        Images.avatars[3],
                                      ],
                                    ),
                                    buildDataRows(
                                      "Flatten Requirement.pdf",
                                      DateTime.utc(2020, 2, 13),
                                      "Alejandro",
                                      7549747,
                                      "Gary Coley",
                                      LucideIcons.folder,
                                      [
                                        Images.avatars[5],
                                        Images.avatars[4],
                                        Images.avatars[1],
                                      ],
                                    ),
                                    buildDataRows(
                                      "Wireframes",
                                      DateTime.utc(2023, 1, 25),
                                      "Dunkle",
                                      56832819,
                                      "Jasper Rigg",
                                      LucideIcons.folder,
                                      [
                                        Images.avatars[0],
                                        Images.avatars[1],
                                        Images.avatars[2],
                                        Images.avatars[3],
                                      ],
                                    ),
                                    buildDataRows(
                                      "Documentation.docs",
                                      DateTime.utc(2020, 2, 13),
                                      "Justin",
                                      8703180,
                                      "Cooper Sharwood",
                                      LucideIcons.folder,
                                      [
                                        Images.avatars[4],
                                        Images.avatars[1],
                                      ],
                                    ),
                                  ],
                                ),
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

  buildFileData(Color color, icons, String fileName, dynamic bytes) {
    return MyContainer.bordered(
      padding: MySpacing.x(12),
      width: 300,
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyContainer(
            paddingAll: 8,
            color: color.withAlpha(28),
            child: Icon(icons, color: color),
          ),
          MySpacing.width(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodyMedium(fileName),
              MyText.bodyMedium(
                Utils.getStorageStringFromByte(bytes),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildCreateNew(String fileName, IconData icon) {
    return Padding(
      padding: MySpacing.x(8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          MySpacing.width(16),
          MyText.bodyMedium(
            fileName,
            fontWeight: 600,
          ),
        ],
      ),
    );
  }

  buildDataRows(
    String name,
    DateTime modifyAt,
    String author,
    int bytes,
    String owner,
    IconData? icon,
    List<String> images,
  ) {
    return DataRow(
      cells: [
        DataCell(
          SizedBox(
            width: 301,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                ),
                MySpacing.width(16),
                MyText.bodyMedium(
                  name,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: 161,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText.bodyMedium(
                  '${Utils.getDateStringFromDateTime(modifyAt, showMonthShort: true)}',
                ),
                MyText.bodySmall(
                  "by $author",
                  muted: true,
                ),
              ],
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: 161,
            child: MyText.bodyMedium(
              Utils.getStorageStringFromByte(bytes),
            ),
          ),
        ),
        DataCell(
          SizedBox(width: 151, child: MyText.bodyMedium(owner)),
        ),
        DataCell(
          SizedBox(
            width: 161,
            child: Stack(
                alignment: Alignment.centerRight,
                children: images
                    .mapIndexed((index, image) => Positioned(
                          left: (18 + (20 * index)).toDouble(),
                          child: MyContainer.rounded(
                            paddingAll: 2,
                            child: MyContainer.rounded(
                              bordered: true,
                              paddingAll: 0,
                              child: Image.asset(
                                image,
                                height: 28,
                                width: 28,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ))
                    .toList()),
          ),
        ),
        DataCell(MyContainer.none(
          paddingAll: 8,
          borderRadiusAll: 5,
          color: contentTheme.primary.withOpacity(0.05),
          child: PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.share2,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Share")
                    ],
                  )),
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.link,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Get Sharable Link")
                    ],
                  )),
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.pencil,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Rename")
                    ],
                  )),
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.download,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Download")
                    ],
                  )),
              PopupMenuItem(
                  padding: MySpacing.xy(16, 8),
                  height: 10,
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.trash,
                        size: 16,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall("Remove")
                    ],
                  ))
            ],
            child: const Icon(
              LucideIcons.moreHorizontal,
              size: 18,
            ),
          ),
        )),
      ],
    );
  }
}
