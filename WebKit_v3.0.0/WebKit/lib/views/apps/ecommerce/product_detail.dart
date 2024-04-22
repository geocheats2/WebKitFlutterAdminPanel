import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_list_extension.dart';
import 'package:webkit/helpers/widgets/my_progress_bar.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

import '../../../controller/apps/ecommerce/product_detail_controller.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin, UIMixin {
  late ProductDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProductDetailController());
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
                      "Product Detail",
                      fontWeight: 600,
                      fontSize: 18,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Ecommerce"),
                        MyBreadcrumbItem(name: "Product Detail", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyContainer(
                  child: MyFlex(
                    contentPadding: false,
                    wrapAlignment: WrapAlignment.start,
                    wrapCrossAlignment: WrapCrossAlignment.start,
                    children: [
                      MyFlexItem(
                        sizes: "lg-4",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyContainer(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              paddingAll: 0,
                              child: Image.asset(
                                controller.selectedImage,
                                fit: BoxFit.cover,
                                height: 500,
                              ),
                            ),
                            MySpacing.height(16),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 12,
                              spacing: 14,
                              children: controller.images
                                  .mapIndexed(
                                    (index, images) => MyContainer.bordered(
                                      onTap: () {
                                        controller.onChangeImage(images);
                                      },
                                      height: 100,
                                      bordered:
                                          images == controller.selectedImage,
                                      border: Border.all(
                                        color: contentTheme.primary,
                                        width: 2,
                                      ),
                                      paddingAll: 0,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        images,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            MySpacing.height(20),
                            MyContainer.bordered(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.bodyMedium(
                                    "Detail",
                                    fontSize: 16,
                                    fontWeight: 600,
                                  ),
                                  MySpacing.height(20),
                                  buildDetail(
                                    "Head",
                                    "12%",
                                  ),
                                  const Divider(),
                                  buildDetail(
                                    "On-Chain Collection",
                                    "JH7UHG...OUYRV",
                                  ),
                                  const Divider(),
                                  buildDetail(
                                    "Token Address",
                                    "GTC...IHTR",
                                  ),
                                  const Divider(),
                                  buildDetail(
                                    "Creator Royalties",
                                    "JYRKI58...LHFEHJ",
                                  ),
                                  const Divider(),
                                  buildDetail(
                                    "Token Address",
                                    "BGV4...MGD",
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      MyFlexItem(
                        sizes: "lg-8",
                        child: Padding(
                          padding: MySpacing.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        LucideIcons.badgeCheck,
                                        color: contentTheme.primary,
                                      ),
                                      MySpacing.width(8),
                                      MyText.bodyMedium(
                                        "Verified",
                                        color: contentTheme.primary,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MyContainer(
                                        color: !controller.showLike
                                            ? contentTheme.red.withAlpha(30)
                                            : contentTheme.dark.withAlpha(30),
                                        paddingAll: 0,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: IconButton(
                                          onPressed: () {
                                            controller.onChangeLike();
                                          },
                                          icon: Icon(
                                              !controller.showLike
                                                  ? Icons.favorite_outlined
                                                  : LucideIcons.heart,
                                              size: 24,
                                              color: !controller.showLike
                                                  ? contentTheme.red
                                                  : contentTheme.dark),
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      MyContainer(
                                        color:
                                            contentTheme.success.withAlpha(30),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        paddingAll: 0,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            LucideIcons.forward,
                                            color: contentTheme.success,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              MySpacing.height(20),
                              MyText.titleLarge(
                                "All Images",
                                fontSize: 32,
                                fontWeight: 600,
                              ),
                              MySpacing.height(20),
                              MyText.bodyMedium(
                                controller.dummyTexts[2],
                                maxLines: 3,
                              ),
                              MySpacing.height(24),
                              MyFlex(
                                wrapAlignment: WrapAlignment.start,
                                wrapCrossAlignment: WrapCrossAlignment.start,
                                contentPadding: false,
                                children: [
                                  MyFlexItem(
                                    sizes: "lg-6",
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyMedium(
                                          "Current Price",
                                          fontSize: 20,
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(8),
                                        MyText.bodyMedium(
                                          "\$ 69",
                                          fontSize: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              MySpacing.height(24),
                              MyContainer.bordered(
                                width: double.infinity,
                                // borderRadiusAll: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.bodyMedium(
                                      "Attribute",
                                      fontSize: 16,
                                    ),
                                    MySpacing.height(16),
                                    Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      runAlignment: WrapAlignment.spaceBetween,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        buildAttributeContainer(
                                          "Background",
                                          "bg-plain-granite",
                                        ),
                                        buildAttributeContainer(
                                          "Level",
                                          "Level 99",
                                        ),
                                        buildAttributeContainer(
                                          "Body",
                                          "Grey Crawler",
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              MySpacing.height(24),
                              MyContainer.bordered(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText.titleMedium(
                                      "Add Item",
                                      fontWeight: 600,
                                      fontSize: 16,
                                    ),
                                    MySpacing.height(12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            if (controller.itemCount != 0)
                                              MyContainer.roundBordered(
                                                borderColor: contentTheme.dark,
                                                onTap: () {
                                                  controller.priceDecrement();
                                                },
                                                paddingAll: 4,
                                                child: const Icon(
                                                  LucideIcons.minus,
                                                  size: 16,
                                                ),
                                              )
                                            else
                                              MyContainer.roundBordered(
                                                paddingAll: 4,
                                                borderColor: contentTheme.dark,
                                                child: const Icon(
                                                  LucideIcons.minus,
                                                  size: 16,
                                                ),
                                              ),
                                            MySpacing.width(12),
                                            MyContainer(
                                              paddingAll: 0,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              height: 25,
                                              width: 30,
                                              child: Center(
                                                child: MyText.bodyMedium(
                                                  controller.itemCount
                                                      .toString(),
                                                  fontWeight: 600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            MySpacing.width(12),
                                            MyContainer.roundBordered(
                                              borderColor: contentTheme.dark,
                                              onTap: () {
                                                controller.priceIncrement();
                                              },
                                              paddingAll: 4,
                                              child: const Icon(
                                                LucideIcons.plus,
                                                size: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            MyText.bodyMedium(
                                              "Total Price",
                                              fontWeight: 600,
                                              fontSize: 16,
                                            ),
                                            MySpacing.width(16),
                                            MyText.bodyMedium(
                                              "\$ ${controller.itemCountPlus * controller.itemCount}",
                                              fontWeight: 600,
                                              fontSize: 16,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      height: 48,
                                    ),
                                    Row(
                                      children: [
                                        MyButton(
                                          onPressed: () {},
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          borderColor: contentTheme.primary,
                                          backgroundColor: contentTheme.primary
                                              .withOpacity(0.12),
                                          splashColor: contentTheme.primary
                                              .withOpacity(0.2),
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'Buy Now',
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        MySpacing.width(12),
                                        MyButton(
                                          onPressed: () {},
                                          elevation: 0,
                                          padding: MySpacing.xy(20, 16),
                                          borderColor: contentTheme.secondary,
                                          backgroundColor: contentTheme
                                              .secondary
                                              .withOpacity(0.12),
                                          splashColor: contentTheme.secondary
                                              .withOpacity(0.2),
                                          borderRadiusAll:
                                              AppStyle.buttonRadius.medium,
                                          child: MyText.bodySmall(
                                            'Add To Cart',
                                            color: contentTheme.secondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              MySpacing.height(20),
                              SizedBox(
                                height: 260,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: MyContainer.bordered(
                                    paddingAll: 0,
                                    child: DataTable(
                                      sortAscending: true,
                                      onSelectAll: (value) {},
                                      headingRowColor: MaterialStatePropertyAll(
                                          contentTheme.primary.withAlpha(30)),
                                      columns: [
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Outlets",
                                            fontWeight: 600,
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Price",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Stock",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                        DataColumn(
                                          label: MyText.labelLarge(
                                            "Revenue",
                                            color: contentTheme.primary,
                                          ),
                                        ),
                                      ],
                                      rows: [
                                        buildDataRows(
                                            "ASOS Radley Outlet - NYC",
                                            "\$584.11",
                                            0.2,
                                            "\$5,84,445"),
                                        buildDataRows("Marco Outlet - SRT",
                                            "\$123.06", 0.1, "\$15,84,445"),
                                        buildDataRows("Chastest Outlet - HY",
                                            "\$452.00", 0.5, "\$12,84,445"),
                                        buildDataRows("World Group - India",
                                            "\$120.00", 0.8, "\$16,84,445"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildAttributeContainer(String title, String subtitle) {
    return MyContainer(
      width: 150,
      color: contentTheme.primary.withAlpha(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium(
            title,
            muted: true,
          ),
          MyText.bodyMedium(
            subtitle,
            fontWeight: 600,
            color: contentTheme.primary,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildDetail(String title, String subTitle) {
    return Row(
      children: [
        Expanded(
          child: MyText.bodyMedium(
            title,
            fontWeight: 600,
          ),
        ),
        Expanded(
          child: MyText.bodyMedium(
            subTitle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  buildDataRows(String outLets, String price, dynamic stock, String revenue) {
    return DataRow(
      cells: [
        DataCell(
          SizedBox(
            width: 300,
            child: MyText.bodySmall(
              outLets,
              fontWeight: 600,
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: 100,
            child: MyText.bodySmall(
              price,
            ),
          ),
        ),
        DataCell(
          MyProgressBar(
            width: 300,
            height: 4,
            inactiveColor: contentTheme.secondary.withAlpha(40),
            activeColor: contentTheme.primary,
            progress: stock,
          ),
        ),
        DataCell(
          SizedBox(
            width: 100,
            child: MyText.bodySmall(
              revenue,
            ),
          ),
        ),
      ],
    );
  }
}
