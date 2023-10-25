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

      backgroundColor: const Color(0xFF053E5E),
      body: PageView(
        children: [
          const OnboardingScreen(
            title: 'Welcome to MenuCard',
            description: '"Snap, Crackle, Pop." ',
            imagePath: 'assets/Eating together-bro.png',
          ),
          OnboardingScreen(
            title: 'Get Started',
            description: 'Click!',
            imagePath: 'assets/Order food-bro.png',
            // Add a callback function to handle navigation
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      const BottomBar(

                        name: '', 
        
        
        cost: '', image: '',
                      ), // Replace 'NextPage' with your desired next page
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
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
