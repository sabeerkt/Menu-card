import 'package:flutter/material.dart';
import 'package:foodmenu/unboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFF043D5E), // Set the background color to dark blue
      body: Center(
        child: Container(
          width: double.infinity, // Take up all available width
          height: double.infinity, // Take up all available height
          padding: const EdgeInsets.only(
            top: 320,
            left: 89,
            right: 89,
            bottom: 398,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFF043D5E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // Remove border radius
            ),
          ),
          child: Column(
            children: [
              Text(
                'YUMMMY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(height: 99),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Someone with discerning taste and expertise in food.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE7E7E7),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
