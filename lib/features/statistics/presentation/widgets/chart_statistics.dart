import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../fill_service_details/presentation/inputs_style.dart';

class ChartStatistics extends StatelessWidget {
  const ChartStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'احصائيات تفصيلية',
                style: Get.textTheme.bodySmall!.copyWith(
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(
                chartData,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: ColorManager.greyColor,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Feb', style: style);
        break;
      case 4:
        text = const Text('Mar', style: style);
        break;
      case 6:
        text = const Text('Apr', style: style);
        break;
      case 8:
        text = const Text('May', style: style);
        break;
      case 10:
        text = const Text('Jun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: ColorManager.greyColor,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 2:
        text = '20';
        break;
      case 4:
        text = '40';
        break;
      case 6:
        text = '60';
        break;
      case 8:
        text = '80';
        break;
      case 10:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData get chartData => LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: ColorManager.lightGreyColor,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 3.1),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            isCurved: true,
            color: ColorManager.primaryColor,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: false,
            ),
          ),
        ],
      );
}
