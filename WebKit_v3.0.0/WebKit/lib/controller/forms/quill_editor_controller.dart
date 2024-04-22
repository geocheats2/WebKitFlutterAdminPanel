import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:webkit/controller/my_controller.dart';

class QuillHtmlEditorController extends MyController {
  final QuillEditorController quillHtmlEditor = QuillEditorController();

  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    ToolBarStyle.background,
    ToolBarStyle.addTable,
    ToolBarStyle.blockQuote,
    ToolBarStyle.clean,
    ToolBarStyle.clearHistory,
    ToolBarStyle.codeBlock,
    ToolBarStyle.directionLtr,
    ToolBarStyle.directionRtl,
    ToolBarStyle.editTable,
    ToolBarStyle.headerOne,
    ToolBarStyle.headerTwo,
    ToolBarStyle.image,
    ToolBarStyle.indentAdd,
    ToolBarStyle.indentMinus,
    ToolBarStyle.link,
    ToolBarStyle.listBullet,
    ToolBarStyle.listOrdered,
    ToolBarStyle.redo,
    ToolBarStyle.strike,
    ToolBarStyle.video
  ];
}
