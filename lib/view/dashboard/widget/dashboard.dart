import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:gap/gap.dart';
import 'package:report_ui/view/dashboard/widget/average.dart';
import 'package:report_ui/view/dashboard/widget/recent_transaction.dart';
import 'package:report_ui/view/dashboard/widget/revenue_sources.dart';
import 'package:report_ui/view/dashboard/widget/revenue_trend.dart';
import 'package:report_ui/view/dashboard/widget/total_earnings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.advancedDrawerController});
  final AdvancedDrawerController advancedDrawerController;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            widget.advancedDrawerController.showDrawer();
          },
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: widget.advancedDrawerController,
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
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TotalEarnings(),
            const Gap(5),
            const Divider(),
            const Gap(5),
            const RevenueTrend(),
            const Gap(5),
            const Divider(),
            const Gap(5),
            const Average(),
            const Gap(5),
            const Divider(),
            const Gap(5),
            Text(
              "Revenue Sources",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10),
            const RevenueSources(),
            const Gap(5),
            Card(
              margin: const EdgeInsets.all(0),
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: _getLegendItems(),
                  ),
                ),
              ),
            ),
            const Gap(5),
            const Divider(),
            const Gap(5),
            Text(
              "Recent Transactions",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10),
            Card(
              margin: const EdgeInsets.all(0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: const Column(
                  children: [
                    RecentTransaction(
                      title: "Online Store",
                      time: "Today, 2:30 PM",
                      price: "+₹1,240",
                    ),
                    Divider(),
                    RecentTransaction(
                      title: "Direct Transfer",
                      time: "Today, 11:15 AM",
                      price: "+₹850",
                    ),
                    Divider(),
                    RecentTransaction(
                      title: "Partner Revenue",
                      time: "Yesterday",
                      price: "+₹2180",
                    ),
                  ],
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}

List<Widget> _getLegendItems() {
  final items = [
    {'label': 'Online Store', 'color': Colors.blue},
    {'label': 'Direct Sales', 'color': Colors.green},
    {'label': 'Partners', 'color': Colors.orange},
    {'label': 'Others', 'color': Colors.red},
  ];

  return items.map((item) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: item['color'] as Color,
        ),
        const Gap(5),
        Text(item['label'] as String),
        const Gap(10),
      ],
    );
  }).toList();
}
