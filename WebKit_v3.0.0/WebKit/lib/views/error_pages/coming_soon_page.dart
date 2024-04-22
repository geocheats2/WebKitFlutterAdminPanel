import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/error_pages/coming_soon_controller.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';

class ComingSoonPage extends StatefulWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  State<ComingSoonPage> createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ComingSoonController controller;

  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 15);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    if (mounted) {
      final reduceSecondsBy = 1;
      setState(() {
        final seconds = myDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer!.cancel();
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(ComingSoonController());
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));  
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    debugPrint("$days : $hours : $minutes : $seconds");
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    const Icon(
                      LucideIcons.rocket,
                      size: 52,
                    ),
                    MySpacing.height(24),
                    MyText.titleLarge(
                      "Arriving Soon",
                      fontSize: 52,
                    ),
                    MySpacing.height(8),
                    MyText.titleMedium(
                      "Something Started forming, and will take shape soon.",
                    ),
                    MySpacing.height(24),
                    MyText.titleLarge(
                      '$days : $hours : $minutes : $seconds',
                      fontSize: 62,
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
