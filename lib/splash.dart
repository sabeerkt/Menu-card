import 'package:flutter/material.dart';
import 'package:foodmenu/unboard.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 255, 255, 255), // Set the background color to dark blue
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          padding: const EdgeInsets.all(16.0), // Adjust padding
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFF043D5E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // Remove border radius
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'YUMMMY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(height: 42.0), // Adjust the spacing
              SizedBox(
                width:
                    screenWidth * 0.9, // Adjust the width based on screen width
                child: Column(
                  children: [
                    Lottie.asset("assets/Animation - 1698586603854.json"),
                    Text(
                      'Someone with discerning taste and expertise in food.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth *
                            0.04, // Adjust font size based on screen width
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.2, // Adjust line height
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
