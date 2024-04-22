import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:webkit/controller/layouts/auth_layout_controller.dart';
import 'package:webkit/helpers/theme/admin_theme.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_responsiv.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';

class AuthLayout extends StatelessWidget {
  final Widget? child;

  final AuthLayoutController controller = AuthLayoutController();

  AuthLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context, _, screenMT) {
      return GetBuilder(
          init: controller,
          builder: (controller) {
            return screenMT.isMobile
                ? mobileScreen(context)
                : largeScreen(context);
          });
    });
  }

  Widget mobileScreen(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Container(
        padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
        height: MediaQuery.of(context).size.height,
        color: theme.cardTheme.color,
        child: SingleChildScrollView(
          key: controller.scrollKey,
          child: child,
        ),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            const Center(
              child: Opacity(
                  opacity: 0.8,
                  child: BlurHash(hash: "LDLz?TMI00%N00I=M{%M00Rj~qRP")),
            ),
            Container(
              margin: MySpacing.top(100),
              width: MediaQuery.of(context).size.width,
              child: MyFlex(
                wrapAlignment: WrapAlignment.center,
                wrapCrossAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.center,
                spacing: 0,
                runSpacing: 0,
                children: [
                  MyFlexItem(
                    sizes: "xxl-8 lg-8 md-9 sm-10",
                    // sizes: "xxl-3 lg-4 md-6 sm-8",
                    child: MyContainer(
                      paddingAll: 0,
                      color: AdminTheme.theme.contentTheme.background
                          .withAlpha(230),
                      child: child ?? Container(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
