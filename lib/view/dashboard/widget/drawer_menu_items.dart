import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:gap/gap.dart';
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
                      icon: Icons.dashboard,
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
                      parentIcon: Icons.bar_chart_rounded,
                      parentName: "Reports",
                      submenu: const [
                        {
                          "icon": Icons.analytics_outlined,
                          "title": "Finance Report"
                        },
                        {"icon": Icons.sell, "title": "Sales Report"},
                        {"icon": Icons.person, "title": "HR report"},
                      ],
                    ),
                    DropMenuExpanding(
                      onIndexChange: (index) {
                        setState(() {
                          menuIndex = index;
                        });
                      },
                      index: 2,
                      isMenuIndex: menuIndex == 2,
                      parentIcon: Icons.money,
                      parentName: "Income",
                      submenu: const [
                        {"icon": Icons.payment, "title": "Earnings"},
                        {
                          "icon": Icons.receipt_long_outlined,
                          "title": "Refunds"
                        },
                        {"icon": Icons.close, "title": "Declines"},
                        {"icon": Icons.paid, "title": "Payouts"}
                      ],
                    ),
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
