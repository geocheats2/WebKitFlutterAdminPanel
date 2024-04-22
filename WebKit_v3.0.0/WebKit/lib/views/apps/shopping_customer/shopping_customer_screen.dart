import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/apps/shopping_customer/shopping_customer_controller.dart';
import 'package:webkit/helpers/extensions/extensions.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_dashed_divider.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/models/shopping_cart_data.dart';
import 'package:webkit/models/shopping_product_data.dart';
import 'package:webkit/views/layouts/layout.dart';

class ShoppingCustomerScreen extends StatefulWidget {
  const ShoppingCustomerScreen({super.key});

  @override
  State<ShoppingCustomerScreen> createState() => _ShoppingCustomerScreenState();
}

class _ShoppingCustomerScreenState extends State<ShoppingCustomerScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ShoppingController controller;

  @override
  void initState() {
    controller = Get.put(ShoppingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<ShoppingController>(
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
                      "Shopping",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Apps"),
                        MyBreadcrumbItem(name: "Shopping", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyFlex(
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: 'lg-4',
                      child: MyContainer(
                          height: 824,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              TextFormField(
                                maxLines: 1,
                                style: MyTextStyle.bodyMedium(),
                                decoration: InputDecoration(
                                    hintText: "search",
                                    hintStyle:
                                        MyTextStyle.bodySmall(xMuted: true),
                                    border: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    focusedBorder: focusedInputBorder,
                                    prefixIcon: const Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          FeatherIcons.search,
                                          size: 14,
                                        )),
                                    prefixIconConstraints: const BoxConstraints(
                                        minWidth: 36,
                                        maxWidth: 36,
                                        minHeight: 32,
                                        maxHeight: 32),
                                    contentPadding: MySpacing.xy(16, 16),
                                    isCollapsed: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never),
                              ),
                              MySpacing.height(12),
                              buildHomeDetail(),
                            ],
                          )),
                    ),
                    MyFlexItem(
                      sizes: 'lg-4',
                      child: buildCart(),
                    ),
                    //Shopping Cart--------------------
                    MyFlexItem(
                      sizes: 'lg-4',
                      child: MyContainer(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.titleMedium(
                              'Cart',
                              fontWeight: 600,
                            ),
                            MySpacing.height(12),
                            ListView(
                              shrinkWrap: true,
                              children: [
                                buildCartList(),
                                MySpacing.height(32),
                                billingWidget(),
                              ],
                            ),
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

  Widget buildCart() {
    return MyContainer(
      child: ListView(
        shrinkWrap: true,
        children: [
          MyText.titleMedium(
            'Product View',
            fontWeight: 600,
          ),
          MySpacing.height(12),
          MyContainer(
            paddingAll: 0,
            borderRadiusAll: 4,
            height: 250,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              controller.shoppingProduct!.image,
              fit: BoxFit.cover,
            ),
          ),
          MySpacing.height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.titleMedium(
                    controller.shoppingProduct!.name,
                    textAlign: TextAlign.start,
                    fontWeight: 700,
                  ),
                  MyText.titleMedium(
                    "\$${controller.shoppingProduct!.price}",
                    fontWeight: 600,
                  ),
                ],
              ),
              Column(
                children: [
                  MyContainer(
                    borderRadiusAll: 4,
                    padding: MySpacing.xy(10, 8),
                    color: theme.colorScheme.primary,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.star,
                            color: theme.colorScheme.onPrimary,
                            size: 14,
                          ),
                          MySpacing.width(6),
                          MyText.labelLarge(
                            controller.shoppingProduct!.rating.toString(),
                            fontWeight: 600,
                            color: theme.colorScheme.onSecondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          MySpacing.height(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.bodySmall(
                controller.dummyTexts[1],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              MySpacing.height(20),
              Row(
                children: [
                  MyText.bodyMedium(
                    'Size : ',
                    fontSize: 16,
                    fontWeight: 600,
                  ),
                  MySpacing.width(12),
                  buildSelectSize(),
                ],
              ),
              MySpacing.height(20),
              Row(
                children: [
                  Stack(
                    children: [
                      MyContainer(
                        color: theme.colorScheme.primaryContainer,
                        paddingAll: 8,
                        child: Icon(
                          LucideIcons.shoppingBag,
                          color: theme.colorScheme.primary,
                          size: 24,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        child: MyContainer.rounded(
                          color: theme.colorScheme.primary,
                          paddingAll: 4,
                          child: MyText.bodySmall(
                            "1",
                            color: theme.colorScheme.onPrimary,
                            fontSize: 8,
                            fontWeight: 700,
                          ),
                        ),
                      )
                    ],
                  ),
                  MySpacing.width(20),
                  Expanded(
                    child: MyButton.block(
                      splashColor: theme.colorScheme.onPrimary.withAlpha(40),
                      backgroundColor: theme.colorScheme.primary,
                      elevation: 0,
                      borderRadiusAll: 4,
                      onPressed: () {},
                      child: MyText.bodyLarge(
                        'Add to Cart',
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              MySpacing.height(20),
              Row(
                children: [
                  MyText.bodyLarge(
                    'Related',
                    letterSpacing: 0,
                    fontWeight: 600,
                  ),
                ],
              ),
              MySpacing.height(12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: buildProductList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProductList() {
    List<Widget> list = [];

    for (ShoppingProduct product in controller.shopping) {
      list.add(MyContainer(
        borderRadiusAll: 8,
        paddingAll: 8,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyContainer(
              paddingAll: 0,
              borderRadiusAll: 4,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(product.image),
                    height: 140,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.favorite_outline,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(8),
            MyText.labelLarge(
              product.name,
              overflow: TextOverflow.ellipsis,
              fontWeight: 600,
            ),
            MySpacing.height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.labelLarge(
                  '\$${product.price}',
                  fontWeight: 700,
                ),
                MyContainer.bordered(
                  paddingAll: 2,
                  borderRadiusAll: 4,
                  child: Icon(
                    LucideIcons.plus,
                    size: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
      list.add(MySpacing.width(20));
    }

    return Row(
      children: list,
    );
  }

  Widget buildSelectSize() {
    return Wrap(
      spacing: 12,
      children: [
        MyContainer.roundBordered(
          paddingAll: 8,
          width: 36,
          height: 36,
          onTap: () {
            controller.onSelectSize(1);
          },
          border: Border.all(
              color: controller.selectSize == 1
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground),
          color: controller.selectSize == 1 ? theme.colorScheme.primary : null,
          child: Center(
            child: MyText.bodySmall(
              "S",
              fontWeight: 600,
              color: controller.selectSize == 1
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onBackground,
            ),
          ),
        ),
        MyContainer.roundBordered(
          paddingAll: 8,
          width: 36,
          height: 36,
          onTap: () {
            controller.onSelectSize(2);
          },
          border: Border.all(
              color: controller.selectSize == 2
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground),
          color: controller.selectSize == 2 ? theme.colorScheme.primary : null,
          child: Center(
            child: MyText.bodySmall(
              "M",
              fontWeight: 600,
              color: controller.selectSize == 2
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onBackground,
            ),
          ),
        ),
        MyContainer.roundBordered(
          paddingAll: 8,
          width: 36,
          height: 36,
          onTap: () {
            controller.onSelectSize(3);
          },
          border: Border.all(
              color: controller.selectSize == 3
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground),
          color: controller.selectSize == 3 ? theme.colorScheme.primary : null,
          child: Center(
            child: MyText.bodySmall(
              "L",
              fontWeight: 600,
              color: controller.selectSize == 3
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onBackground,
            ),
          ),
        ),
        MyContainer.roundBordered(
          paddingAll: 8,
          width: 36,
          height: 36,
          onTap: () {
            controller.onSelectSize(4);
          },
          border: Border.all(
              color: controller.selectSize == 4
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground),
          color: controller.selectSize == 4 ? theme.colorScheme.primary : null,
          child: Center(
            child: MyText.bodySmall(
              "XL",
              fontWeight: 600,
              color: controller.selectSize == 4
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCartList() {
    List<Widget> list = [];

    for (ShoppingCart cart in controller.shoppingCart) {
      bool increaseAble = controller.increaseAble(cart);
      bool decreaseAble = controller.decreaseAble(cart);
      list.add(MyCard(
        shadow: MyShadow(elevation: 0.5),
        margin: MySpacing.bottom(12),
        borderRadiusAll: 4,
        paddingAll: 12,
        child: Row(
          children: [
            MyContainer(
              paddingAll: 0,
              borderRadiusAll: 4,
              height: 80,
              width: 80,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(cart.product.image),
              ),
            ),
            MySpacing.width(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.titleMedium(
                    cart.product.name,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: 700,
                  ),
                  MySpacing.height(8),
                  MyText.bodyMedium(
                    '\$${cart.product.price}',
                    fontWeight: 700,
                  ),
                  MySpacing.height(8),
                  Row(
                    children: [
                      MyText.bodySmall(
                        'Size : ${cart.selectedSize}',
                        fontWeight: 600,
                      ),
                      MySpacing.width(8),
                      MyText.bodySmall('Color : '),
                      MyContainer(
                          paddingAll: 8,
                          borderRadiusAll: 2,
                          color: cart.selectedColor,
                          child: Container()),
                    ],
                  ),
                ],
              ),
            ),
            MySpacing.width(20),
            Column(
              children: [
                MyContainer(
                  onTap: () {
                    controller.increment(cart);
                  },
                  bordered: increaseAble,
                  paddingAll: 4,
                  borderRadiusAll: 2,
                  border: Border.all(color: theme.colorScheme.primary),
                  color: increaseAble
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onBackground.withAlpha(200),
                  child: Icon(
                    LucideIcons.plus,
                    size: 12,
                    color: increaseAble
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onPrimary,
                  ),
                ),
                MySpacing.height(8),
                MyText.bodyMedium(
                  cart.quantity.toString(),
                  fontWeight: 700,
                ),
                MySpacing.height(8),
                MyContainer(
                  onTap: () {
                    controller.decrement(cart);
                  },
                  paddingAll: 4,
                  borderRadiusAll: 2,
                  bordered: decreaseAble,
                  border: Border.all(
                      color: theme.colorScheme.primary.withAlpha(120)),
                  color: decreaseAble
                      ? theme.colorScheme.primary.withAlpha(28)
                      : theme.colorScheme.onBackground.withAlpha(200),
                  child: Icon(
                    LucideIcons.minus,
                    size: 12,
                    color: decreaseAble
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget billingWidget() {
    return MyContainer(
      borderRadiusAll: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium(
            'Billing Information',
            muted: true,
            fontWeight: 700,
          ),
          MySpacing.height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                'Order Total',
                fontWeight: 600,
              ),
              MyText.bodyMedium(
                '\$${controller.order.precise}',
                fontWeight: 700,
              ),
            ],
          ),
          MySpacing.height(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                'Tax',
                fontWeight: 600,
              ),
              MyText.bodyMedium(
                '\$${controller.tax.precise}',
                fontWeight: 700,
              ),
            ],
          ),
          MySpacing.height(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                'Offer',
                fontWeight: 600,
              ),
              MyText.bodyMedium(
                '- \$${controller.offer.precise}',
                fontWeight: 700,
              ),
            ],
          ),
          MySpacing.height(12),
          Row(
            children: [
              Expanded(
                child: MyDashedDivider(
                  dashSpace: 4,
                  dashWidth: 8,
                  color: theme.colorScheme.onBackground.withAlpha(180),
                  height: 1.2,
                ),
              )
            ],
          ),
          MySpacing.height(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodyMedium(
                'Grand Total',
                fontWeight: 700,
              ),
              MyText.bodyMedium(
                '\$${controller.total.precise}',
                fontWeight: 800,
              ),
            ],
          ),
          MySpacing.height(20),
          MyButton.block(
              onPressed: () {},
              backgroundColor: theme.colorScheme.primary,
              elevation: 0,
              padding: MySpacing.xy(12, 20),
              borderRadiusAll: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText.bodyMedium(
                    'Checkout',
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildHomeDetail() {
    return ListView.separated(
      itemCount: controller.shopping.length,
      shrinkWrap: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      itemBuilder: (context, index) {
        return MyCard(
          onTap: () {
            controller.onChangeProduct(controller.shopping[index]);
          },
          shadow: MyShadow(elevation: 0.5),
          child: Row(
            children: [
              MyContainer(
                paddingAll: 0,
                borderRadiusAll: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: AssetImage(controller.shopping[index].image),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              MySpacing.width(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: MyText.bodyMedium(
                          controller.shopping[index].name,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: 600,
                        )),
                        Icon(
                          controller.shopping[index].favorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          size: 18,
                          color: controller.shopping[index].color,
                        ),
                      ],
                    ),
                    MySpacing.height(4),
                    MyText.bodySmall(
                      controller.dummyTexts[1],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    MySpacing.height(4),
                    MyText.labelLarge(
                      '\$${controller.shopping[index].price}',
                      fontWeight: 700,
                    ),
                    MySpacing.height(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyContainer(
                          borderRadiusAll: 2,
                          padding: MySpacing.xy(8, 4),
                          color: theme.colorScheme.primary,
                          child: Row(
                            children: [
                              Icon(
                                LucideIcons.star,
                                color: theme.colorScheme.onPrimary,
                                size: 12,
                              ),
                              MySpacing.width(4),
                              MyText.bodySmall(
                                "${controller.shopping[index].rating}",
                                fontWeight: 600,
                                color: theme.colorScheme.onPrimary,
                              ),
                            ],
                          ),
                        ),
                        MyContainer.bordered(
                          paddingAll: 4,
                          borderRadiusAll: 4,
                          child: Icon(
                            LucideIcons.plus,
                            size: 14,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12,
        );
      },
    );
  }
}
