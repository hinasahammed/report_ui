import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueSources extends StatefulWidget {
  const RevenueSources({super.key});

  @override
  State<RevenueSources> createState() => _RevenueSourcesState();
}

class _RevenueSourcesState extends State<RevenueSources> {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(8),
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            sectionsSpace: 4,
            centerSpaceRadius: 40,
            sections: _getSections(touchedIndex),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> _getSections(int touchIndex) {
  return [
    PieChartSectionData(
      value: 40,
      title: '40%',
      color: Colors.blue,
      radius: touchIndex == 0 ? 50 : 40,
      titleStyle: TextStyle(
        fontSize: touchIndex == 0 ? 20 : 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 30,
      title: '30%',
      color: Colors.green,
      radius: touchIndex == 1 ? 50 : 40,
      titleStyle: TextStyle(
        fontSize: touchIndex == 1 ? 20 : 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 20,
      title: '20%',
      color: Colors.orange,
      radius: touchIndex == 2 ? 50 : 40,
      titleStyle: TextStyle(
        fontSize: touchIndex == 2 ? 20 : 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 10,
      title: '10%',
      color: Colors.red,
      radius: touchIndex == 3 ? 50 : 40,
      titleStyle: TextStyle(
        fontSize: touchIndex == 3 ? 20 : 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];
}
