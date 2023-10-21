import 'package:flutter/material.dart';

class term extends StatelessWidget {
  const term({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "term and condtion ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          flexibleSpace: Container(
            color: const Color.fromARGB(255, 129, 44, 226),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Terms and Conditions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "By using this food menu card app, you agree to the following terms and conditions:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "1. Data Storage and Privacy:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "   This app uses Hive to store and manage data, including menu items, user preferences, and other related information. Your data may be stored locally on your device and is not shared with third parties unless required by law.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "2. Accuracy of Information:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "   We strive to provide accurate and up-to-date information in the menu card. However, we do not guarantee the accuracy, completeness, or availability of menu items. Prices, availability, and descriptions may change without notice.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "3. User Conduct:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "   You agree to use this app responsibly and not engage in any unlawful or harmful activities, including but not limited to spamming, hacking, or any form of abuse.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "4. Updates and Changes:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "   We reserve the right to update or change these terms and conditions, app features, or pricing without prior notice. It is your responsibility to review these terms periodically.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "5. Contact Information:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "   For any questions or concerns about these terms and conditions or the app, please contact us at [Your Contact Information].",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ));
  }
}
