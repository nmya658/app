import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RealEyeScreen extends StatelessWidget {
  final String realEyeUrl = "https://www.realeye.io/your-test-url"; // Replace with your actual test link

  void _launchRealEyeTest() async {
    final Uri url = Uri.parse(realEyeUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $realEyeUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eye Tracking Test"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "RealEye Eye-Tracking Test",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Next, you will take an eye-tracking test using RealEye. This test captures key visual behaviors like fixations and saccades to help identify autism-related traits.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: _launchRealEyeTest,
                icon: Icon(Icons.open_in_browser),
                label: Text("Start Eye Test"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/result');
                },
                child: Text("I've Completed the Test"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
