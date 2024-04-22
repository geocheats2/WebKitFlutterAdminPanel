import 'package:flutter/material.dart';
import 'package:webkit/controller/my_controller.dart';
import 'package:webkit/models/chat.dart';

class ChatController extends MyController {
  List<Chat> chat = [];

  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    chat.add(
      Chat(-1, "", "", DateTime.now(), messageController.text, "", true),
    );
    messageController.clear();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Chat.dummyList.then((value) {
      chat = value.sublist(0, 10);
      update();
    });
  }
}
