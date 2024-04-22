import 'package:flutter/material.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:appflowy_board/appflowy_board.dart';
import 'package:webkit/images.dart';

class KanBanController extends MyController {
  final AppFlowyBoardController boardData = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );
  late AppFlowyBoardScrollController boardController;

  @override
  void onInit() {
    super.onInit();
    final group1 = AppFlowyGroupData(
      id: "To Do",
      items: [
        TextItem("High", Colors.red.shade400, "18 jul 2021",
            "ios App home page", "Meat combo", Images.avatars[0], "ios", 12),
        TextItem("Medium", Colors.brown, "18 jul 2021", "Top Nav Layout Design",
            "Donica", Images.avatars[1], "Hyper", 32),
        TextItem("Low", Colors.green.shade400, "15 jul 2021",
            "Invite user to a project", "Kevina", Images.avatars[2], "CRM", 10),
      ],
      name: 'To Do',
    );
    final group2 = AppFlowyGroupData(
      id: "In Progress",
      items: [
        TextItem("Medium", Colors.brown, "15 jun 2020", "Write A release note",
            "Jamey", Images.avatars[3], "Hyper", 20),
        TextItem("Low", Colors.green.shade400, "15 jun 2020",
            "Enable analytics tracking", "Ivor", Images.avatars[4], "CRM", 24),
      ],
      name: 'In Progress',
    );

    final group3 = AppFlowyGroupData(
      id: "Done",
      items: [
        TextItem("High", Colors.red.shade400, "5 Aug 2018",
            "KanBan Board Design", "Linoel", Images.avatars[5], "CRM", 78),
        TextItem("Medium", Colors.brown, "9 Aug 2018",
            "Code HTML emial Template", "Skye", Images.avatars[6], "CRM", 40),
        TextItem("Medium", Colors.brown, "10 Aug 2018", "Brand Logo Design",
            "Luce", Images.avatars[7], "Design", 65),
        TextItem("High", Colors.red.shade400, "16 Aug 2018",
            "Improve animation loader", "Adina", Images.avatars[8], "CRM", 11),
      ],
      name: 'Review',
    );

    final group4 = AppFlowyGroupData(
      id: "Wait",
      items: [
        TextItem("Low", Colors.green.shade400, "16 Jul 2021",
            "DashBoard Design", "Jeno", Images.avatars[9], "Hyper", 200),
      ],
      name: 'Done',
    );

    boardData.addGroup(group1);
    boardData.addGroup(group2);
    boardData.addGroup(group3);
    boardData.addGroup(group4);
  }
}

class TextItem extends AppFlowyGroupItem {
  final String kanbanLevel;
  final Color color;
  final String date, title, name, image, jobTypeName;
  final double comment;

  TextItem(this.kanbanLevel, this.color, this.date, this.title, this.name,
      this.image, this.jobTypeName, this.comment);

  @override
  // TODO: implement id
  String get id => title;
}
