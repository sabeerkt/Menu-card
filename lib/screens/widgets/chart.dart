import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class chart extends StatelessWidget {
  const chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 129, 44, 226),
          title: const Text(
            'chart',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true, // Center-align the title text
          elevation: 0,

          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'food'),
              Tab(text: 'price'),
            ],
            labelColor: Colors.white, // Set the selected tab text color
            unselectedLabelColor: Color.fromARGB(
                255, 155, 149, 149), // Set the unselected tab text color
            labelStyle: TextStyle(
              fontSize: 16, // You can adjust the font size if needed
            ),
          ),
        ),
        body: TabBarView(
          children: [chart1(), chart2()],
        ),
      ),
    );
  }
}

Widget chart1() {
  return Padding(
    padding: const EdgeInsets.all(50),
    child: PieChart(
        swapAnimationDuration: const Duration(milliseconds: 0),
        PieChartData(sections: [
          PieChartSectionData(
            value: 200,
            title: 'Section 3',
            color: Color.fromARGB(255, 127, 65, 181),
          ),
          PieChartSectionData(
            value: 200,
            color: const Color.fromARGB(255, 145, 82, 82),
          ),
          PieChartSectionData(
            value: 300,
            title: 'Section 2',
            color: const Color.fromARGB(255, 241, 233, 233),
          ),
          PieChartSectionData(
            value: 20,
            title: 'Section 1',
            color: Color.fromARGB(255, 53, 180, 192),
          ),
        ])),
  );
}

Widget chart2() {
  return SfCircularChart(
      title: ChartTitle(text: 'Sales of the day'),
      legend: const Legend(isVisible: true),
      series: <PieSeries<_PieData, String>>[
        PieSeries<_PieData, String>(
            explode: true,
            explodeIndex: 0,
            dataSource: pieData,
            xValueMapper: (_PieData data, _) => data.xData,
            yValueMapper: (_PieData data, _) => data.yData,
            dataLabelMapper: (_PieData data, _) => data.text,
            dataLabelSettings: const DataLabelSettings(isVisible: true)),
      ]);
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

final List<_PieData> pieData = [
  _PieData('Category A', 30, '30%'),
  _PieData('Category B', 20, '20%'),
  _PieData('Category C', 15, '15%'),
  _PieData('Category D', 10, '10%'),
  _PieData('Category E', 25, '25%'),
];
