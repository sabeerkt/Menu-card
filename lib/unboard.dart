import 'package:flutter/material.dart';
import 'package:foodmenu/Components/bottom.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Onboarding Page'),
      // ),

      backgroundColor: Color(0xFF053E5E),
      body: PageView(
        children: [
          OnboardingScreen(
            title: 'Welcome to MenuCard',
            description: '"Snap, Crackle, Pop." ',
            imagePath: 'assets/Illustration.png',
          ),
          OnboardingScreen(
            title: 'Get Started',
            description: 'Click!',
            imagePath: 'assets/Illustrations.png',
            // Add a callback function to handle navigation
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      BottomBar(), // Replace 'NextPage' with your desired next page
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback? onTap; // Callback for handling tap events

  const OnboardingScreen({
    required this.title,
    required this.description,
    required this.imagePath,
    this.onTap, // Include the onTap callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, // Call the onTap callback when tapped
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
