import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EhsRedirectScreen extends StatelessWidget {
  final String ehsUrl = "https://www.ehs.gov.ae/en/AutismScreeningForm"; // replace with actual EHS URL if different

  void _launchEHSForm() async {
    final Uri url = Uri.parse(ehsUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $ehsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EHS Screening"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Official Autism Screening",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "You will be redirected to the official EHS autism screening form. This form is for institutional use only and cannot be accessed in real time by this app.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _launchEHSForm,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Open EHS Form", style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/form');
                },
                child: Text("Continue In-App Assessment"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
