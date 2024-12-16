import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:report_ui/view/dashboard/widget/dashboard.dart';
import 'package:report_ui/view/dashboard/widget/drawer_menu_items.dart';

class AdvancedDrawerCustom extends StatefulWidget {
  const AdvancedDrawerCustom({super.key});

  @override
  State<AdvancedDrawerCustom> createState() => _AdvancedDrawerCustomState();
}

class _AdvancedDrawerCustomState extends State<AdvancedDrawerCustom> {
  final _advancedDrawerController = AdvancedDrawerController();
  int menuIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primaryContainer,
              theme.colorScheme.primaryContainer.withOpacity(0.2),
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      drawer: DrawerMenuItems(
        onIndexChange: (index) {
          setState(() {
            menuIndex = index;
          });
        },
        advancedDrawerController: _advancedDrawerController,
      ),
      child: IndexedStack(
        index: menuIndex,
        children: [
          Dashboard(advancedDrawerController: _advancedDrawerController),
          Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  _advancedDrawerController.showDrawer();
                },
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              title: const Text("Reports"),
            ),
          )
        ],
      ),
    );
  }
}
