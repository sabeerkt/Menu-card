import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final List<String> imageList = [
    'assets/slide3.jpg',
    'assets/slide3.jpg',
    'assets/slide3.jpg',
    // Add more image paths here
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   centerTitle: true, // Center-align the title
        //   title: const Text(
        //     "home",
        //     style: TextStyle(
        //       color: Colors.black, // Set the text color to black
        //       fontSize: 16, // Set the text size to 16
        //     ),
        //   ),
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [
        //           Color.fromARGB(255, 178, 171, 171),
        //           Color(0xFF043D5E),
        //         ],
        //         begin: Alignment.topLeft,
        //         end: Alignment.topRight,
        //       ),
        //     ),
        //     child: Center(
        //       child: CircleAvatar(
        //         backgroundImage: AssetImage("your_image_path.png"),
        //         radius: 30, // Set the radius to your preferred size
        //       ),
        //     ),
        //   ),
        // ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 420,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(99, 255, 255, 255),
                ),
                child: Align(
                  alignment: Alignment.centerLeft, // Align text to the left
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.red
                        ], // Specify the gradient colors
                      ).createShader(bounds);
                    },
                    child: const Text(
                      "Satisfy your cravings!",
                      style: TextStyle(
                        fontSize: 25, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // Make the text bold
                        color: Colors.white, // Set the text color to white
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // const Search(),

            const SizedBox(
              height: 20,
            ),

            const SizedBox(
              height: 5,
            ),
            //CarouselSlider
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
                  child: CarouselSlider(
                    items: imageList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 500,
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: MediaQuery.of(context).size.width / 500,
                      viewportFraction: 1.0,
                      initialPage: 5,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: foodlist(),
            ),
          ],
        ),
      ),
    );
  }

  Container foodlist() {
    return Container(
      width: 407,
      height: 101,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: [
          const BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(20), // Adjust the radius as needed
              child: Image.asset(
                'assets/undoaed.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Food',
                style: TextStyle(
                  color: Color.fromARGB(255, 119, 116, 116),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Biryani',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                ' RS 900',
                style: TextStyle(
                  color: Color.fromARGB(255, 222, 41, 41),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
