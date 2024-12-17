import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:gap/gap.dart';
import 'package:report_ui/model/sub_menu_items.dart';
import 'package:report_ui/view/dashboard/widget/drop_menu_expanding.dart';
import 'package:report_ui/view/dashboard/widget/menu_items_card.dart';

class DrawerMenuItems extends StatefulWidget {
  const DrawerMenuItems(
      {super.key,
      required this.advancedDrawerController,
      required this.onIndexChange});
  final AdvancedDrawerController advancedDrawerController;
  final void Function(int index) onIndexChange;

  @override
  State<DrawerMenuItems> createState() => _DrawerMenuItemsState();
}

class _DrawerMenuItemsState extends State<DrawerMenuItems> {
  int menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          "Logo",
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    MenuItemsCard(
                      isMenuIndex: menuIndex == 0,
                      onTap: () {
                        widget.onIndexChange(0);
                        setState(() {
                          menuIndex = 0;
                        });
                        widget.advancedDrawerController.hideDrawer();
                      },
                      icon: "assets/icons/dashboard.png",
                      title: "Dashboard",
                    ),
                    DropMenuExpanding(
                      onIndexChange: (index) {
                        setState(() {
                          menuIndex = index;
                        });
                      },
                      index: 1,
                      isMenuIndex: menuIndex == 1,
                      parentIcon: "assets/icons/income.png",
                      parentName: "Income",
                      submenu: [
                        SubMenuItems(
                          icon: "assets/icons/earnings.png",
                          title: "Earnings",
                        ),
                        SubMenuItems(
                          icon: "assets/icons/refund.png",
                          title: "Refunds",
                        ),
                        SubMenuItems(
                          icon: "assets/icons/decline.png",
                          title: "Declines",
                        ),
                        SubMenuItems(
                          icon: "assets/icons/payouts.png",
                          title: "Payouts",
                        ),
                      ],
                    ),
                    Gap(15),
                    DropMenuExpanding(
                      onIndexChange: (index) {
                        setState(() {
                          menuIndex = index;
                        });
                      },
                      index: 2,
                      isMenuIndex: menuIndex == 2,
                      parentIcon: "assets/icons/finance_report.png",
                      parentName: "Finance Report",
                      submenu: [
                        SubMenuItems(
                          icon: "assets/icons/income_statement.png",
                          title: "Income Statement",
                        ),
                        SubMenuItems(
                          icon: "assets/icons/balance_sheet.png",
                          title: "Balance Sheet",
                        ),
                        SubMenuItems(
                          icon: "assets/icons/expense_breakdown.png",
                          title: "Expense Breakdown",
                        ),
                      ],
                    ),
                    Gap(15),
                    DropMenuExpanding(
                      onIndexChange: (index) {
                        setState(() {
                          menuIndex = index;
                        });
                      },
                      index: 3,
                      isMenuIndex: menuIndex == 3,
                      parentIcon: "assets/icons/sales_Report.png",
                      parentName: "Sales Reports",
                      submenu: [
                        SubMenuItems(
                          icon: "assets/icons/sales_summary.png",
                          title: "Sales Summary",
                        ),
                        SubMenuItems(
                          icon: "assets/icons/sales_preformance.png",
                          title: "Team Performance",
                        ),
                        SubMenuItems(
                          icon: "assets/icons/expense_breakdown.png",
                          title: "Expense Breakdown",
                        ),
                      ],
                    ),
                    Gap(15),
                  ],
                ),
              ),
            ),
            const Gap(5),
            Card(
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                textColor: theme.colorScheme.onPrimary,
                tileColor: theme.colorScheme.primary,
                iconColor: theme.colorScheme.onPrimary,
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
