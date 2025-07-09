import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Optional: Accept AI result from arguments
    final result = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text("AI Assessment Result"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assessment Summary",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal[800]),
            ),
            SizedBox(height: 16),
            Text(
              "Based on your responses and eye-tracking data, here is a preliminary analysis:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),

            // Example result display
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.insights, size: 48, color: Colors.teal),
                    SizedBox(height: 10),
                    Text(
                      result != null
                          ? result['message'] ?? "Your child shows moderate traits associated with ASD. Early follow-up is recommended."
                          : "Your child shows moderate traits associated with ASD. Early follow-up is recommended.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text("Back to Home"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
