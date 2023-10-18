import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class chart extends StatelessWidget {
  const chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF043D5E),
          title: Text(
            'chart',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true, // Center-align the title text
          elevation: 0,
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.topRight,
          //       colors: [
          //         Color.fromARGB(255, 178, 171, 171),
          //         Color(0xFF043D5E),
          //       ],
          //     ),
          //   ),
          // ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'food'),
              Tab(text: 'price'),
            ],
            labelColor: Colors.white, // Set the selected tab text color
            unselectedLabelColor: const Color.fromARGB(
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
  return AspectRatio(
    aspectRatio: 1,
    child: PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Color.fromARGB(255, 171, 24, 24),
            title: 'beverge',
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            radius: 150,
          ),
          PieChartSectionData(
            color: Color.fromARGB(255, 0, 0, 0),
            title: 'breakfast',
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            radius: 150,
          ),
          PieChartSectionData(
            color: Color.fromARGB(255, 118, 187, 65),
            title: 'all',
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            radius: 150,
          ),
        ],
        centerSpaceRadius: 0,
        sectionsSpace: 0,
        borderData: FlBorderData(
          show: false,
        ),
      ),
    ),
  );
}

Widget chart2() {
  return AspectRatio(
    aspectRatio: 1,
    child: PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Color.fromARGB(255, 172, 20, 20),
            title: 'food',
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            radius: 150,
          ),
          PieChartSectionData(
            color: Color.fromARGB(255, 0, 0, 0),
            title: 'food1',
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            radius: 150,
          ),
          PieChartSectionData(
            color: Color.fromARGB(255, 104, 85, 85),
            title: 'food2',
            titleStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            radius: 150,
          ),
        ],
        centerSpaceRadius: 0,
        sectionsSpace: 0,
        borderData: FlBorderData(
          show: false,
        ),
      ),
    ),
  );
}
