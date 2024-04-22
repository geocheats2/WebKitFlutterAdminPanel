import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/models/drag_drop.dart';

class DragDropController extends MyController {
  List<DragDrop> dragDrop = [];

  DragDropController();

  @override
  void onInit() {
    super.onInit();
    DragDrop.dummyList.then((value) {
      dragDrop = value.sublist(0, 10);
      update();
    });
  }

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    DragDrop customer = dragDrop.removeAt(oldIndex);
    dragDrop.insert(newIndex, customer);
    update();
  }
}
