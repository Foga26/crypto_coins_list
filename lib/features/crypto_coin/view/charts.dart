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
      // Генерация случайных высоких и низких цен
      highPrices.add((widget.coin.details.priceInUSD +
              (DateTime.now().millisecondsSinceEpoch % 100))
          .toDouble());
      lowPrices.add((widget.coin.details.priceInUSD +
              (DateTime.now().millisecondsSinceEpoch % 90))
          .toDouble());

      // Ограничение количества точек для отображения
      if (highPrices.length > 12) {
        highPrices.removeAt(0);
        lowPrices.removeAt(0);
      }

      setState(() {});
    });
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontSize: 6,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(' ${value}\$',
          style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.0),
        body: LineChart(createChartData()),
      ),
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
        show: false,
      ),
      backgroundColor: Colors.black,
      lineBarsData: lineBarsData,
      titlesData: FlTitlesData(
        rightTitles: AxisTitles(
            drawBelowEverything: false,
            sideTitles: SideTitles(
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 100,
              interval: 20,
              showTitles: false,
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

class CharBar extends StatefulWidget {
  final CryptoCoin? coin;

  const CharBar({super.key, this.coin});
  @override
  _CharBarState createState() => _CharBarState();
}

class _CharBarState extends State<CharBar> {
  List<double> highPrices = [];
  List<double> lowPrices = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      // Генерация случайных высоких и низких цен
      highPrices.add((widget.coin!.details.hight24Hour +
              (DateTime.now().millisecondsSinceEpoch % 100))
          .toDouble());
      lowPrices.add((widget.coin!.details.low24Hours +
              (DateTime.now().millisecondsSinceEpoch % 90))
          .toDouble());

      // Ограничение количества точек для отображения
      if (highPrices.length > 12) {
        highPrices.removeAt(0);
        lowPrices.removeAt(0);
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: BarChart(createChartData()),
        ),
      ),
    );
  }

  BarChartData createChartData() {
    List<BarChartGroupData> barGroups = [
      BarChartGroupData(x: 0, barsSpace: 2, barRods: [
        BarChartRodData(
            toY: widget.coin!.details.priceInUSD, color: Colors.green)
      ]),
      BarChartGroupData(
          x: 1,
          barsSpace: 2,
          barRods: [BarChartRodData(toY: lowPrices.first, color: Colors.red)]),
    ];

    return BarChartData(
      barGroups: barGroups,
      titlesData: const FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
    );
  }
}
