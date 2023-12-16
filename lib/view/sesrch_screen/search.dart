// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:foodmenu/db_functions/db_function.dart';
// import 'package:foodmenu/model/model.dart';

// import 'package:foodmenu/view/detail_screen/detial.dart';

// import 'package:lottie/lottie.dart';

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final String defaultImage = 'assets/default_image.jpg';
//   List<Food> _foundfood = [];

//   loadFood() async {
//     final allfood = FoodListNotifier.value;
//     setState(() {
//       _foundfood = allfood;
//     });
//   }

//   _filter(String enteredName) {
//     List<Food> result = [];

//     if (enteredName.isEmpty) {
//       result = FoodListNotifier.value;
//     } else {
//       result = FoodListNotifier.value
//           .where((Food food) =>
//               food.name.toLowerCase().contains(enteredName.toLowerCase()))
//           .toList();
//     }

//     setState(() {
//       _foundfood = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "search",
//           style: TextStyle(
//             color: Color.fromARGB(255, 246, 246, 246),
//             fontSize: 16,
//           ),
//         ),
//         flexibleSpace: Container(
//           color: Color.fromARGB(255, 0, 0, 0),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
//             child: TextFormField(
//               onChanged: (value) => _filter(value),
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.all(10),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40.0),
//                   borderSide: const BorderSide(
//                     color: Colors.orange,
//                     width: 2.0,
//                   ),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//                 suffixIcon: const Icon(
//                   Icons.search_sharp,
//                   color: Colors.orange,
//                 ),
//                 hintText: "Find  food...",
//                 hintStyle: const TextStyle(
//                   color: Color(0xFF636262),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Expanded(
//             child: _foundfood.isEmpty
//                 ? Center(
//                     child: Lottie.asset("assets/searcgh.json"),
//                   )
//                 : ListView.builder(
//                     itemCount: _foundfood.length,
//                     itemBuilder: (context, index) {
//                       final data = _foundfood[index];
//                       return Card(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.all(10),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => DetailPage(
//                                   name: data.name,
//                                   cost: data.cost,
//                                   description: data.description,
//                                   image: data.image,
//                                   category: data.category!,
//                                   index: index,
//                                 ),
//                               ),
//                             );
//                           },
//                           leading: Container(
//                             height: double.infinity,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               image: data.image != null
//                                   ? DecorationImage(
//                                       image: FileImage(File(data.image)),
//                                       fit: BoxFit.cover,
//                                     )
//                                   : DecorationImage(
//                                       image: AssetImage(defaultImage),
//                                       fit: BoxFit.cover,
//                                     ),
//                             ),
//                           ),
//                           title: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: <Widget>[
//                                       Column(
//                                         children: [
//                                           Text(data.name),
//                                           Text(data.category ?? 'default')
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       IconButton(
//                                         onPressed: () {
//                                           addToCart(data);
//                                         },
//                                         icon: Icon(
//                                           Icons.shopping_cart,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                       IconButton(
//                                         onPressed: () {
//                                           deletfood(index);
//                                         },
//                                         icon: Icon(
//                                           Icons.delete,
//                                           color: Colors.red,
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                           subtitle: Text(
//                             "\$${data.cost}",
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 58, 95, 33),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
