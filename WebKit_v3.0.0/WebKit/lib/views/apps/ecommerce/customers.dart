import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:webkit/controller/apps/ecommerce/customers_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/utils/utils.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/models/customer.dart';
import 'package:webkit/views/layouts/layout.dart';

class Customers extends StatefulWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers>
    with SingleTickerProviderStateMixin, UIMixin {
  late CustomersController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CustomersController());
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
                      "customers".tr(),
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'ecommerce'.tr()),
                        MyBreadcrumbItem(name: 'customers'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MySpacing.height(16),
                    if (controller.data != null)
                      PaginatedDataTable(
                        arrowHeadColor: contentTheme.primary,
                        header: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText.titleLarge("Customers List"),
                            MyButton(
                              onPressed: controller.goToDashboard,
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: contentTheme.primary,
                              borderRadiusAll: AppStyle.buttonRadius.medium,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    LucideIcons.monitor,
                                    size: 18,
                                    color: contentTheme.light,
                                  ),
                                  MySpacing.width(8),
                                  MyText.labelMedium(
                                    'dashboard'.tr(),
                                    color: contentTheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        source: controller.data!,
                        columns: [
                          DataColumn(
                              label: MyText.bodyMedium(
                            'Id',
                            fontWeight: 600,
                          )),
                          DataColumn(
                              label: MyText.bodyMedium(
                            'Name',
                            fontWeight: 600,
                          )),
                          DataColumn(
                              label: MyText.bodyMedium(
                            'Phone',
                            fontWeight: 600,
                          )),
                          DataColumn(
                              label: MyText.bodyMedium(
                            'Balance',
                            fontWeight: 600,
                          )),
                          DataColumn(
                              label: MyText.bodyMedium(
                            'Order',
                            fontWeight: 600,
                          )),
                          DataColumn(
                              label: MyText.bodyMedium(
                            'Last Order At',
                            fontWeight: 600,
                          )),
                          DataColumn(
                              label: MyText.bodyMedium(
                            'Action',
                            fontWeight: 600,
                          )),
                        ],
                        columnSpacing: 170,
                        horizontalMargin: 28,
                        rowsPerPage: 10,
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

class MyData extends DataTableSource with UIMixin {
  List<Customer> data = [];

  MyData(this.data);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(MyText.bodyMedium(
          data[index].id.toString(),
          fontWeight: 600,
        )),
        DataCell(MyText.bodyMedium(
          data[index].firstName,
          fontWeight: 600,
        )),
        DataCell(MyText.bodyMedium(data[index].phoneNumber.toString())),
        DataCell(MyText.bodyMedium(data[index].balance.toString())),
        DataCell(MyText.bodyMedium(data[index].ordersCount.toString())),
        DataCell(MyText.bodyMedium(
            Utils.getDateStringFromDateTime(data[index].lastOrder).toString())),
        DataCell(
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                MyContainer.bordered(
                  onTap: () => {},
                  padding: MySpacing.xy(6, 6),
                  borderColor: contentTheme.primary.withAlpha(40),
                  child: Icon(
                    LucideIcons.edit2,
                    size: 12,
                    color: contentTheme.primary,
                  ),
                ),
                MySpacing.width(12),
                MyContainer.bordered(
                  onTap: () => {},
                  padding: MySpacing.xy(6, 6),
                  borderColor: contentTheme.primary.withAlpha(40),
                  child: Icon(
                    LucideIcons.trash2,
                    size: 12,
                    color: contentTheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
