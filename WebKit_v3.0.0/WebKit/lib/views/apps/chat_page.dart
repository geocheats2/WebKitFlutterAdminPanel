import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/apps/chat_controller.dart';
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
import 'package:webkit/helpers/widgets/my_dotted_line.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/images.dart';
import 'package:webkit/views/layouts/layout.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late ChatController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ChatController());
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
                      "Chat",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Apps'),
                        MyBreadcrumbItem(name: 'Chat', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: Column(
                  children: [
                    MyFlex(
                      children: [
                        MyFlexItem(
                          sizes: "xxl-3 xl-3 ",
                          child: MyCard(
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    MyContainer.rounded(
                                      paddingAll: 0,
                                      height: 44,
                                      width: 44,
                                      child: Image.asset(
                                        Images.avatars[3],
                                      ),
                                    ),
                                    MySpacing.width(12),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText.labelLarge(
                                            "Den",
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              MyContainer.rounded(
                                                paddingAll: 4,
                                                color: contentTheme.success,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                              ),
                                              MySpacing.width(4),
                                              MyText.bodyMedium(
                                                "Online",
                                                fontSize: 12,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    MySpacing.width(16),
                                    MySpacing.height(22),
                                    MyContainer.none(
                                      paddingAll: 8,
                                      borderRadiusAll: 5,
                                      child: PopupMenuButton(
                                        offset: const Offset(-165, 10),
                                        position: PopupMenuPosition.under,
                                        itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    LucideIcons.users,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall("New Group")
                                                ],
                                              )),
                                          PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    LucideIcons.contact,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall("Contacts")
                                                ],
                                              )),
                                          PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    LucideIcons.bookmark,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall(
                                                      "Save Message")
                                                ],
                                              )),
                                          PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    LucideIcons.userPlus,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall(
                                                      "Invite Friends")
                                                ],
                                              )),
                                          PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    LucideIcons.helpCircle,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall("Help")
                                                ],
                                              )),
                                          PopupMenuItem(
                                              padding: MySpacing.xy(16, 8),
                                              height: 10,
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    LucideIcons.settings,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall("Setting")
                                                ],
                                              ))
                                        ],
                                        child: const Icon(
                                          LucideIcons.moreVertical,
                                          size: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                MySpacing.height(16),
                                TextField(
                                  onTap: () {},
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    filled: true,
                                    prefixIcon: const Icon(
                                      LucideIcons.search,
                                      size: 20,
                                    ),
                                    hintText: "People, Groups & Messages...",
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: MySpacing.all(16),
                                  ),
                                ),
                                MySpacing.height(20),
                                MyText.titleMedium(
                                  "CONTACT",
                                  color: contentTheme.title,
                                  muted: true,
                                  fontWeight: 600,
                                ),
                                MySpacing.height(20),
                                SizedBox(
                                  height: 510,
                                  child: ListView.separated(
                                    primary: true,
                                    shrinkWrap: true,
                                    itemCount: controller.chat.length,
                                    itemBuilder: (context, index) {
                                      return MyButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        borderRadiusAll: 8,
                                        backgroundColor: theme
                                            .colorScheme.background
                                            .withAlpha(5),
                                        splashColor: theme
                                            .colorScheme.onBackground
                                            .withAlpha(10),
                                        child: SizedBox(
                                          height: 60,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MyContainer.rounded(
                                                height: 40,
                                                width: 40,
                                                paddingAll: 0,
                                                child: Image.asset(
                                                  Images.avatars[index %
                                                      Images.avatars.length],
                                                  height: 40,
                                                  width: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              MySpacing.width(12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    MyText.labelLarge(
                                                      controller.chat[index]
                                                          .firstName,
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      child: MyText.bodySmall(
                                                        controller.chat[index]
                                                            .message,
                                                        muted: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight: 400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  MyText.bodySmall(
                                                    '${Utils.getTimeStringFromDateTime(
                                                      controller
                                                          .chat[index].sendAt,
                                                      showSecond: false,
                                                    )}',
                                                    muted: true,
                                                    fontWeight: 600,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return MySpacing.height(12);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xxl-6 xl-6 ",
                          child: MyCard(
                            shadow: MyShadow(elevation: 0.5),
                            child: Column(
                              children: [
                                messages(),
                                MySpacing.height(8),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: MyContainer(
                                    color: contentTheme.primary.withAlpha(20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                controller.messageController,
                                            autocorrect: false,
                                            style: MyTextStyle.bodySmall(),
                                            decoration: InputDecoration(
                                              hintText: "Type message here",
                                              hintStyle: MyTextStyle.bodySmall(
                                                  xMuted: true),
                                              border: outlineInputBorder,
                                              enabledBorder: outlineInputBorder,
                                              focusedBorder: focusedInputBorder,
                                              contentPadding:
                                                  MySpacing.xy(16, 16),
                                              isCollapsed: true,
                                            ),
                                          ),
                                        ),
                                        MySpacing.width(16),
                                        InkWell(
                                          onTap: () {
                                            controller.sendMessage();
                                          },
                                          child: const Icon(
                                            LucideIcons.send,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xxl-3 xl-3",
                          child: MyFlex(
                            contentPadding: false,
                            children: [
                              MyFlexItem(
                                child: MyCard(
                                  shadow: MyShadow(elevation: 0.5),
                                  borderRadiusAll: 4,
                                  paddingAll: 0,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(4),
                                              topLeft: Radius.circular(4)),
                                          gradient: LinearGradient(colors: [
                                            Color(0xff8360c3),
                                            Color(0xff6a82fb),
                                            Color(0xff00b4db),
                                          ], tileMode: TileMode.clamp),
                                        ),
                                      ),
                                      Padding(
                                        padding: MySpacing.xy(16, 44),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            MyContainer.rounded(
                                              paddingAll: 4,
                                              child: MyContainer.rounded(
                                                paddingAll: 0,
                                                height: 100,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                child: Image.asset(
                                                  Images.avatars[1],
                                                  fit: BoxFit.cover,
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                            MySpacing.height(8),
                                            MyText.bodyLarge(
                                              "Amanda Smith",
                                              fontSize: 20,
                                              fontWeight: 600,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            MySpacing.height(8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(LucideIcons.mapPin,
                                                    size: 20),
                                                MySpacing.width(8),
                                                MyText.bodyMedium(
                                                    "Los Angeles United States"),
                                              ],
                                            ),
                                            MySpacing.height(16),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                MyText.bodyMedium("@amanda"),
                                                MySpacing.width(8),
                                                const MyContainer.roundBordered(
                                                  color: Colors.grey,
                                                  paddingAll: 1,
                                                ),
                                                MySpacing.width(8),
                                                MyText.bodyMedium(
                                                  "Designer at google",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                            MySpacing.height(16),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                MyButton(
                                                  onPressed: () {},
                                                  elevation: 0,
                                                  padding: MySpacing.xy(20, 16),
                                                  backgroundColor:
                                                      contentTheme.primary,
                                                  borderRadiusAll: AppStyle
                                                      .buttonRadius.medium,
                                                  child: MyText.bodySmall(
                                                    'Message',
                                                    color:
                                                        contentTheme.onPrimary,
                                                  ),
                                                ),
                                                MySpacing.width(16),
                                                MyButton(
                                                  onPressed: () {},
                                                  elevation: 0,
                                                  padding: MySpacing.xy(12, 16),
                                                  backgroundColor:
                                                      contentTheme.primary,
                                                  borderRadiusAll: AppStyle
                                                      .buttonRadius.medium,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(LucideIcons.share2,
                                                          color: contentTheme
                                                              .light,
                                                          size: 16),
                                                      MySpacing.width(8),
                                                      MyText.bodySmall(
                                                        'Share Profile',
                                                        color: contentTheme
                                                            .onPrimary,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              MyFlexItem(
                                  child: MyCard(
                                shadow: MyShadow(elevation: 0.5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.titleMedium("Attached File"),
                                    MySpacing.height(12),
                                    buildAttachedFile("image(1).png", 10485760),
                                    MySpacing.height(12),
                                    buildAttachedFile("apk.Zip", 2306867),
                                    MySpacing.height(12),
                                    buildAttachedFile("text.ppt", 1572864),
                                    MySpacing.height(12),
                                    buildAttachedFile("Images.jpg", 1048576),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 500,
                    //   child: MyContainer.bordered(
                    //     child: ListView.builder(
                    //       itemCount: controller.sendChat.length,
                    //       shrinkWrap: true,
                    //       itemBuilder: (context, index) {
                    //         return Container(
                    //           decoration: const BoxDecoration(
                    //             color: Colors.greenAccent,
                    //             borderRadius: BorderRadius.only(
                    //               topLeft: Radius.circular(12),
                    //               topRight: Radius.circular(12),
                    //               bottomLeft: Radius.circular(
                    //                 12,
                    //               ),
                    //             ),
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8),
                    //             child: Text(controller.sendChat[index].msg!),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildAttachedFile(String fileName, dynamic mb) {
    return MyDottedLine(
      height: 50,
      dottedLength: 1,
      color: Colors.grey.shade400,
      child: Padding(
        padding: MySpacing.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyContainer(
              paddingAll: 4,
              height: 32,
              width: 32,
              // color: contentTheme.warning,
              child: Icon(
                LucideIcons.folderArchive,
                size: 20,
              ),
            ),
            MySpacing.width(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(
                    fileName,
                    fontWeight: 600,
                    muted: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  MyText.bodyMedium(
                    Utils.getStorageStringFromByte(mb),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: MySpacing.zero,
              onPressed: () {},
              icon: const Icon(
                LucideIcons.download,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileDetail(IconData icons, String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icons,
              size: 16,
            ),
            MySpacing.width(8),
            MyText.bodyMedium(
              title,
              fontWeight: 600,
            )
          ],
        ),
        MyText.bodyMedium(
          subTitle,
          fontWeight: 600,
        )
      ],
    );
  }

  Widget messages() {
    return SizedBox(
      height: 600,
      child: ListView.separated(
        padding: MySpacing.x(12),
        shrinkWrap: true,
        itemCount: controller.chat.length,
        itemBuilder: (BuildContext context, int index) {
          if (controller.chat[index].fromMe == false) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    MyContainer.rounded(
                      height: 32,
                      width: 32,
                      paddingAll: 0,
                      child: Image.asset(
                        Images.avatars[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                    MySpacing.height(4),
                    MyText.bodySmall(
                      '${Utils.getTimeStringFromDateTime(
                        controller.chat[index].sendAt,
                        showSecond: false,
                      )}',
                      muted: true,
                      fontWeight: 600,
                      fontSize: 8,
                    )
                  ],
                ),
                MySpacing.width(12),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    MyContainer.none(
                      paddingAll: 8,
                      margin: MySpacing.only(
                          top: 10,
                          right: MediaQuery.of(context).size.width * 0.20),
                      alignment: Alignment.bottomRight,
                      borderRadiusAll: 4,
                      color: contentTheme.secondary.withAlpha(30),
                      child: MyText.titleMedium(
                        controller.chat[index].receiveMessage,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        color: contentTheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      MyContainer(
                        paddingAll: 8,
                        margin: MySpacing.only(
                          top: 10,
                          left: MediaQuery.of(context).size.width * 0.20,
                        ),
                        color: theme.colorScheme.primary.withAlpha(30),
                        child: MyText.bodyMedium(
                          controller.chat[index].sendMessage,
                          fontSize: 12,
                          fontWeight: 600,
                          color: contentTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                MySpacing.width(12),
                Column(
                  children: [
                    MyContainer.rounded(
                      height: 32,
                      width: 32,
                      paddingAll: 0,
                      child: Image.asset(
                        Images.avatars[8],
                        fit: BoxFit.cover,
                      ),
                    ),
                    MySpacing.height(4),
                    MyText.bodySmall(
                      '${Utils.getTimeStringFromDateTime(
                        controller.chat[index].sendAt,
                        showSecond: false,
                      )}',
                      fontSize: 8,
                      muted: true,
                      fontWeight: 600,
                    ),
                  ],
                ),
              ],
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 12,
          );
        },
      ),
    );
  }
}
