// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class chart extends StatefulWidget {
//   const chart({super.key});

//   @override
//   State<chart> createState() => _chartState();
// }

// class _chartState extends State<chart> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white, // Set the background color to white
//           elevation: 0, // Remove the elevation (border)
//           centerTitle: true, // Center-align the title
//           title: Text(
//             "Chart",
//             style: TextStyle(
//               color: Colors.black, // Set the text color
//               fontSize: 16, // Set the text size to a smaller value
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 80),
//           child: Column(
//             children: [
//               Container(
//                 width: MediaQuery.of(context)
//                     .size
//                     .width, // Set the width to screen width
//                 height: 350, // Set the fixed height
//                 child: PieChart(PieChartData(sections: [
//                   PieChartSectionData(value: 20, color: Colors.lime),
//                   PieChartSectionData(
//                       value: 50, color: const Color.fromARGB(255, 156, 34, 34)),
//                   PieChartSectionData(value: 20, color: Colors.lightBlue),
//                   PieChartSectionData(value: 20, color: Colors.pink),
//                 ])),
//               ),
//               Container(
//                 width: 11,
//                 height: 10,
//                 decoration: BoxDecoration(color: Color(0xFFB09FFF)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/screens/widgets/all.dart';
import 'package:foodmenu/screens/detial.dart';
import 'package:foodmenu/screens/widgets/bevarge.dart';

class chart extends StatelessWidget {
  const chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'chart',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true, // Center-align the title text
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(255, 178, 171, 171),
                  Color(0xFF043D5E),
                ],
              ),
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'food'),
              Tab(text: 'price'),
            ],
            labelColor: Colors.white, // Set the selected tab text color
            unselectedLabelColor:
                Colors.white, // Set the unselected tab text color
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
