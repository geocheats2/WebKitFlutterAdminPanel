import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:webkit/controller/apps/file_manager/file_uploader_controller.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/utils/utils.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_dotted_line.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_list_extension.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/layout.dart';

class FileUploader extends StatefulWidget {
  const FileUploader({Key? key}) : super(key: key);

  @override
  State<FileUploader> createState() => _FileUploaderState();
}

class _FileUploaderState extends State<FileUploader>
    with SingleTickerProviderStateMixin, UIMixin {
  late FileUploaderController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FileUploaderController());
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
                      "File Upload",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "File"),
                        MyBreadcrumbItem(name: "File Upload", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText.bodyMedium(
                              "Please upload any file to see a previews",
                              fontSize: 16,
                              fontWeight: 600,
                            ),
                            MySpacing.height(16),
                            InkWell(
                              onTap: controller.pickFile,
                              child: MyDottedLine(
                                strokeWidth: 0.2,
                                color: contentTheme.onBackground,
                                corner: const MyDottedLineCorner(
                                  leftBottomCorner: 2,
                                  leftTopCorner: 2,
                                  rightBottomCorner: 2,
                                  rightTopCorner: 2,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: MySpacing.all(12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Images.fileManager[1],
                                          height: 200,
                                        ),
                                        MyContainer(
                                          width: 340,
                                          alignment: Alignment.center,
                                          paddingAll: 0,
                                          child: MyText.titleMedium(
                                            "Drop files here or click to upload.",
                                            fontWeight: 600,
                                            muted: true,
                                            fontSize: 18,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (controller.files.isNotEmpty) ...[
                              MySpacing.height(16),
                              Wrap(
                                runSpacing: 16,
                                spacing: 16,
                                children: controller.files
                                    .mapIndexed((index, file) => MyContainer(
                                          color: contentTheme.primary
                                              .withAlpha(80),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons
                                                    .insert_drive_file_outlined,
                                                size: 20,
                                              ),
                                              MySpacing.width(8),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  MyText.bodyMedium(
                                                    file.name,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: 600,
                                                  ),
                                                  MyText.bodySmall(Utils
                                                      .getStorageStringFromByte(
                                                          file.bytes?.length ??
                                                              0)),
                                                ],
                                              ),
                                              MySpacing.width(20),
                                              IconButton(
                                                onPressed: () =>
                                                    controller.removeFile(file),
                                                icon: const Icon(
                                                  Icons.close_outlined,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
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
}
