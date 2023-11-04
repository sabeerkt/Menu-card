import 'dart:io';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:foodmenu/Screens/Widgets/Tabs/Deserts.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Database/Function/db_function.dart';

class chart extends StatelessWidget {
  const chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Food> foods = FoodListNotifier.value;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: const Text(
            'chart',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true, // Center-align the title text
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              // Tab(text: 'food'),
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
          children: [
            //chart1(foods),

            chart2(foods: foods)
          ],
        ),
      ),
    );
  }
}

// Widget chart1(List<Food> foods) {
//   Map<String, double> categoryCosts = {};

//   // Calculate the total cost for each category
//   for (var food in foods) {
//     if (categoryCosts.containsKey(food.category)) {
//       categoryCosts[food.category.toString()] = double.parse(food.cost);
//     } else {
//       categoryCosts[food.category.toString()] = double.parse(food.cost);
//     }
//   }

//   // Generate data for the PieChart
//   List<_PieData> pieData = categoryCosts.entries
//       .map((entry) => _PieData(entry.key, entry.value,
//           '${(entry.value / calculateTotalCost(foods) * 100).toStringAsFixed(2)}%'))
//       .toList();

//   return SizedBox(
//     height: 500,
//     child: PieChart(
//       PieChartData(
//         sections: pieData
//             .map((data) => PieChartSectionData(
//                   titlePositionPercentageOffset: 0.7,
//                   badgePositionPercentageOffset: 1.1,
//                   title: data.text,
//                   color: getRandomColor(),
//                   value: data.yData as double,
//                   titleStyle: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ))
//             .toList(),
//         sectionsSpace: 5,
//         centerSpaceRadius: 90,
//         startDegreeOffset: 0,
//       ),
//     ),
//   );
// }

// class _PieData {
//   _PieData(this.xData, this.yData, this.text);
//   final String xData;
//   final num yData;
//   final String text;
// }

// final List<_PieData> pieData = [
//   _PieData('breakfast A', 30, '30%'),
//   _PieData('desrts', 20, '20%'),
//   _PieData('drinks', 15, '15%'),
// ];

Widget chart2({required foods}) {
  return SizedBox(
    height: 500,
    child: PieChart(
      PieChartData(
        sections: List.generate(
          foods.length,
          (index) {
            double cost = double.parse(foods[index].cost);
            double totalCost = calculateTotalCost(foods);
            double percentage = (cost / totalCost) * 100;
            final image = foods[index].image;
            final name = foods[index].name;

            return PieChartSectionData(
              badgePositionPercentageOffset: 1.1,
              titlePositionPercentageOffset: .4,
              // badgeWidget: ClipOval(
              //   child: SizedBox(
              //     width: 60,
              //     height: 60,
              //     child: Image(
              //       image: image != null
              //           ? FileImage(File(image))
              //           : const AssetImage('assets/images/food.png')
              //               as ImageProvider,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              color: getRandomColor(),
              value: percentage,
              title: '''₹ ${cost.toStringAsFixed(2)}
    (${percentage.toStringAsFixed(2)}%)
    ${name}
    ''',
              radius: 80,
              titleStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            );
          },
        ),
        // borderData: FlBorderData(show: true),
        sectionsSpace: 5,
        centerSpaceRadius: 90,
        startDegreeOffset: 0,
      ),
    ),
  );
}

Color getRandomColor() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
