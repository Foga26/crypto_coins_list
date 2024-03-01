import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartsLine extends StatefulWidget {
  final CryptoCoin coin;

  const ChartsLine({super.key, required this.coin});

  @override
  // ignore: library_private_types_in_public_api
  _ChartsLineState createState() => _ChartsLineState();
}

class _ChartsLineState extends State<ChartsLine> {
  List<double> highPrices = [];
  List<double> lowPrices = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      /* Генерация случайного значения для высокой цены.
К текущей цене эмулируемой монеты (widget.coin.details.priceInUSD) добавляется случайное число от 0 до 99 (это делается путем взятия остатка от деления миллисекунд текущего времени на 100).
Полученное значение конвертируется в формат с плавающей точкой (double) и добавляется в список highPrices.
       */
      highPrices.add((widget.coin.details.priceInUSD +
              (DateTime.now().millisecondsSinceEpoch % 100))
          .toDouble());

      // Ограничение количества точек для отображения
      if (highPrices.length > 12) {
        highPrices.removeAt(0);
      }

      setState(() {});
    });
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      fitInside: const SideTitleFitInsideData(
          enabled: true,
          axisPosition: -1,
          parentAxisSize: 0,
          distanceFromEdge: -7),
      space: 2,
      axisSide: meta.axisSide,
      child: Text(' ${value.toStringAsFixed(1)} \$',
          style: const TextStyle(color: Colors.white, fontSize: 10)),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LineChart(createChartData()),
    );
  }

  LineChartData createChartData() {
    List<LineChartBarData> lineBarsData = [
      LineChartBarData(
        spots: highPrices.asMap().entries.map((entry) {
          return FlSpot(entry.key.toDouble(), entry.value);
        }).toList(),
        barWidth: 2,
        color: Colors.green,
        isCurved: false,
      ),
    ];

    return LineChartData(
      lineTouchData: const LineTouchData(
          touchTooltipData: LineTouchTooltipData(tooltipBgColor: Colors.black)),
      baselineX: widget.coin.details.priceInUSD,
      baselineY: widget.coin.details.priceInUSD,
      gridData: const FlGridData(show: true, drawVerticalLine: true),
      borderData: FlBorderData(
        show: true,
      ),
      backgroundColor: Colors.black,
      lineBarsData: lineBarsData,
      titlesData: FlTitlesData(
        rightTitles: AxisTitles(
            drawBelowEverything: false,
            sideTitles: SideTitles(
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 55,
              showTitles: true,
            )),
        bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
        )),
        topTitles: const AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
        )),
        leftTitles: const AxisTitles(
            axisNameSize: 5, sideTitles: SideTitles(showTitles: false)),
      ),
    );
  }
}
