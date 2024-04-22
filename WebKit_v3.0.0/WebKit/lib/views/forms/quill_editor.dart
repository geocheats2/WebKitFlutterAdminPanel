import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:webkit/controller/forms/quill_editor_controller.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class QuillEditor extends StatefulWidget {
  const QuillEditor({Key? key}) : super(key: key);

  @override
  State<QuillEditor> createState() => _QuillEditorState();
}

class _QuillEditorState extends State<QuillEditor>
    with SingleTickerProviderStateMixin, UIMixin {
  late QuillHtmlEditorController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(QuillHtmlEditorController());
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
                      "Quill HTML Editor",
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Forms"),
                        MyBreadcrumbItem(
                            name: "Quill HTML Editor", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(200),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-8",
                      child: Column(
                        children: [
                          ToolBar(
                            padding: const EdgeInsets.all(8),
                            iconSize: 20,
                            controller: controller.quillHtmlEditor,
                            toolBarConfig: controller.customToolBarList,
                          ),
                          QuillHtmlEditor(
                            text:
                                "Hello This is a quill html editor example 😊",
                            hintText: 'Hint text goes here',
                            controller: controller.quillHtmlEditor,
                            isEnabled: true,
                            minHeight: 300,
                            hintTextAlign: TextAlign.start,
                            textStyle: MyTextStyle.getStyle(),
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            hintTextPadding: EdgeInsets.zero,
                            backgroundColor: contentTheme.background,
                            onFocusChanged: (hasFocus) =>
                                debugPrint('has focus $hasFocus'),
                            onTextChanged: (text) =>
                                debugPrint('widget text change $text'),
                            onEditorCreated: () =>
                                debugPrint('Editor has been loaded'),
                            onEditorResized: (height) =>
                                debugPrint('Editor resized $height'),
                            onSelectionChanged: (sel) => debugPrint(
                              '${sel.index},${sel.length}',
                            ),
                          ),
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
}
