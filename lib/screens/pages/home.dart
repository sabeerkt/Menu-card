import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:foodmenu/screens/pages/item.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> imageList = [
    'assets/slide3.jpg',
    'assets/sliddish.jpg',
    'assets/slidword.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Set the background color to white
          elevation: 0, // Remove the elevation (border)
          flexibleSpace: Container(
            child: Center(
              child: GlowText(
                'Satisfy your cravings!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(
                      255, 48, 50, 51), // Set the text color to white
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 5,
              ),
              //CarouselSlider
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250, // Set the height of the container to 250
                  child: CarouselSlider(
                    items: imageList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height:
                                500, // Set the height of the CarouselSlider to 500
                            child: Image.asset(
                              item,
                              fit: BoxFit
                                  .cover, // Fit the image within the container
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: MediaQuery.of(context).size.width /
                          500, // Match screen width and set height to 500
                      viewportFraction:
                          1.0, // Set this to 1.0 to occupy the full width
                      initialPage: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              Text("products"),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const item(
                                name: '',
                                cost: '',
                                description: '',
                                image: '',
                              )));
                },
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset("assets/slid2.jpg"),
                          //Text(title),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/slid1.jpg",
                          ),
                          //Text(title),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
