import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RevenueTrend extends StatelessWidget {
  const RevenueTrend({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Revenue Trend",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(25),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(

                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(

                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 20,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return const Text('Mon');
                            case 3:
                              return const Text('Wed');
                            case 5:
                              return const Text('Fri');
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withOpacity(.5),
                      width: 1,
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      
                      spots: const [
                        FlSpot(0, 5000),
                        FlSpot(1, 10000),
                        FlSpot(2, 12000),
                        FlSpot(3, 15000),
                        FlSpot(4, 13500),
                        FlSpot(5, 15000),
                        FlSpot(6, 14000),
                      ],
                      isCurved: true,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 18000,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
