import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/apps/ecommerce/add_product_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct>
    with SingleTickerProviderStateMixin, UIMixin {
  late AddProductController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AddProductController());
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
                      "add_product".tr().capitalizeWords,
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ecommerce'.tr()),
                        MyBreadcrumbItem(
                          name: 'add_product'.tr().capitalizeWords,
                          active: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing * 3),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-8",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    LucideIcons.server,
                                    size: 16,
                                  ),
                                  MySpacing.width(12),
                                  MyText.titleMedium(
                                    "general".tr(),
                                    fontWeight: 600,
                                  ),
                                ],
                              ),
                              MySpacing.height(flexSpacing),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyFlex(
                                    contentPadding: false,
                                    children: [
                                      MyFlexItem(
                                        sizes: "lg-6",
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "product_name"
                                                  .tr()
                                                  .capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation(
                                                      'product_name'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController(
                                                      'product_name'),
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "eg: Tomatoes",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                contentPadding:
                                                    MySpacing.all(16),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyFlexItem(
                                          sizes: "lg-6",
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyText.labelMedium(
                                                "shop_name"
                                                    .tr()
                                                    .capitalizeWords,
                                              ),
                                              MySpacing.height(8),
                                              TextFormField(
                                                validator: controller
                                                    .basicValidator
                                                    .getValidation('shop_name'),
                                                controller: controller
                                                    .basicValidator
                                                    .getController('shop_name'),
                                                keyboardType:
                                                    TextInputType.name,
                                                decoration: InputDecoration(
                                                  hintText: "eg: Fruits",
                                                  hintStyle:
                                                      MyTextStyle.bodySmall(
                                                          xMuted: true),
                                                  border: outlineInputBorder,
                                                  enabledBorder:
                                                      outlineInputBorder,
                                                  focusedBorder:
                                                      focusedInputBorder,
                                                  contentPadding:
                                                      MySpacing.all(16),
                                                  isCollapsed: true,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  MySpacing.height(25),
                                  MyText.labelMedium(
                                    "description".tr(),
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    validator: controller.basicValidator
                                        .getValidation('description'),
                                    controller: controller.basicValidator
                                        .getController('description'),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText:
                                          "It's contains blah blah things",
                                      hintStyle:
                                          MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                  ),
                                  MySpacing.height(25),
                                  MyFlex(contentPadding: false, children: [
                                    MyFlexItem(
                                        sizes: 'lg-6 md-12',
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "category".tr(),
                                            ),
                                            MySpacing.height(8),
                                            PopupMenuButton(
                                              onSelected:
                                                  controller.onSelectedQty,
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return [
                                                  "Fashion",
                                                  "Grocery",
                                                  "Vegetables",
                                                  "Fruits",
                                                  "Electronics",
                                                  "Kids"
                                                ].map((behavior) {
                                                  return PopupMenuItem(
                                                    value: behavior,
                                                    height: 32,
                                                    child: MyText.bodySmall(
                                                      behavior.toString(),
                                                      color: theme.colorScheme
                                                          .onBackground,
                                                      fontWeight: 600,
                                                    ),
                                                  );
                                                }).toList();
                                              },
                                              color: theme.cardTheme.color,
                                              child: MyContainer.bordered(
                                                padding: MySpacing.xy(12, 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    MyText.labelMedium(
                                                      controller
                                                          .selectedQuantity
                                                          .toString(),
                                                      color: theme.colorScheme
                                                          .onBackground,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .expand_more_outlined,
                                                      size: 22,
                                                      color: theme.colorScheme
                                                          .onBackground,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                    MyFlexItem(
                                        sizes: 'lg-6 md-12',
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "price".tr(),
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              validator: controller
                                                  .basicValidator
                                                  .getValidation('price'),
                                              controller: controller
                                                  .basicValidator
                                                  .getController('price'),
                                              keyboardType:
                                                  TextInputType.multiline,
                                              decoration: InputDecoration(
                                                hintText: "99.99",
                                                hintStyle:
                                                    MyTextStyle.bodySmall(
                                                        xMuted: true),
                                                border: outlineInputBorder,
                                                enabledBorder:
                                                    outlineInputBorder,
                                                focusedBorder:
                                                    focusedInputBorder,
                                                prefixIcon: MyContainer.none(
                                                  margin: MySpacing.right(12),
                                                  alignment: Alignment.center,
                                                  color: contentTheme.primary
                                                      .withAlpha(40),
                                                  child: Icon(
                                                    LucideIcons
                                                        .circleDollarSign,
                                                    color: contentTheme.primary,
                                                  ),
                                                ),
                                                prefixIconConstraints:
                                                    const BoxConstraints(
                                                        maxHeight: 39,
                                                        minWidth: 50,
                                                        maxWidth: 50),
                                                contentPadding:
                                                    MySpacing.all(12),
                                                isCollapsed: true,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ]),
                                  MySpacing.height(25),
                                  MyText.labelMedium(
                                    "status".tr(),
                                  ),
                                  MySpacing.height(4),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Wrap(
                                            spacing: 16,
                                            children: Status.values
                                                .map(
                                                  (gender) => InkWell(
                                                    onTap: () => controller
                                                        .onChangeGender(gender),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Radio<Status>(
                                                          value: gender,
                                                          activeColor:
                                                              contentTheme
                                                                  .primary,
                                                          groupValue: controller
                                                              .selectedGender,
                                                          onChanged: controller
                                                              .onChangeGender,
                                                          visualDensity:
                                                              getCompactDensity,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                        ),
                                                        MySpacing.width(8),
                                                        MyText.labelMedium(
                                                          gender
                                                              .name.capitalize!,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList()),
                                      )
                                    ],
                                  ),
                                  MySpacing.height(25),
                                  MyText.labelMedium(
                                    "tags".tr(),
                                  ),
                                  MySpacing.height(8),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: TextFormField(
                                      maxLines: 3,
                                      validator: controller.basicValidator
                                          .getValidation('tags'),
                                      controller: controller.basicValidator
                                          .getController('tags'),
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Fruits, Vegetables, Grocery, Healthy, etc",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ),
                                  MySpacing.height(20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MyButton.text(
                                        onPressed: () {},
                                        padding: MySpacing.xy(20, 16),
                                        splashColor: contentTheme.secondary
                                            .withOpacity(0.1),
                                        child: MyText.bodySmall(
                                          'cancel'.tr(),
                                        ),
                                      ),
                                      MySpacing.width(12),
                                      MyButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        padding: MySpacing.xy(20, 16),
                                        backgroundColor: contentTheme.primary,
                                        borderRadiusAll:
                                            AppStyle.buttonRadius.medium,
                                        child: MyText.bodySmall(
                                          'save'.tr(),
                                          color: contentTheme.onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
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
