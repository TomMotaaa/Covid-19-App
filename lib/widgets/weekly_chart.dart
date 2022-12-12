import 'package:covid_19_app/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          barGroups: getBarGroups(),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getWeek,
              )
            )
          )
        ),
      ),
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
    (i, value) => barChartGroups.add(
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: value,
            color: i == 4 ? kPrimaryColor : kInactiveChartColor,
            width: 16,
          )
        ]
      )
    )
  );
  return barChartGroups;
}

Widget getWeek(double value, TitleMeta meta) {
  switch (value.toInt()) {
    case 0:
      return const Text('SEG');
    case 1:
      return const Text('TER');
    case 2:
      return const Text('QUA');
    case 3:
      return const Text('QUI');
    case 4:
      return const Text('SEX');
    case 5:
      return const Text('SAB');
    case 6:
      return const Text('DOM');
    default:
      return const Text('');
  }
}