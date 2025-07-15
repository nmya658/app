/*
import 'package:flutter/material.dart';

class PredictScreen extends StatelessWidget {
  const PredictScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView( // Added to support smaller screens
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/head_icon.png',
                height: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                'Start Autism Detection',
                style: TextStyle(
                  fontSize: 28, // Larger title
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.chat_bubble, size: 28),
                  label: const Text('Complete Questionnaire'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/form');
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.remove_red_eye, size: 28),
                  label: const Text('Take RealEye Test'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/realeye');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'dart:convert';
import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictScreen extends StatefulWidget {
  const PredictScreen({Key? key}) : super(key: key);

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  String? prediction;

  Future<void> uploadScanpathFile() async {
    final XFile? file = await openFile(
      acceptedTypeGroups: [XTypeGroup(label: 'Text', extensions: ['txt'])],
    );

    if (file == null) return;

    final uri = Uri.parse('http://10.0.2.2:5000/predict');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = jsonDecode(responseBody);
      setState(() {
        prediction = data['prediction'];
      });
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Prediction Result"),
          content: Text("This subject is predicted to be: ${data['prediction']}"),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
        ),
      );
    } else {
      setState(() {
        prediction = "Error: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/head_icon.png', height: 300),
              const SizedBox(height: 30),
              const Text(
                'Start Autism Detection',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: const Icon(Icons.chat_bubble, size: 28),
                label: const Text('Complete Questionnaire'),
                onPressed: () {
                  Navigator.pushNamed(context, '/form');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: const Icon(Icons.remove_red_eye, size: 28),
                label: const Text('Take RealEye Test'),
                onPressed: () {
                  Navigator.pushNamed(context, '/realeye');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: const Icon(Icons.upload_file, size: 28),
                label: const Text('Upload Scanpath File'),
                onPressed: uploadScanpathFile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'dart:convert';
import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Required for contentType

class PredictScreen extends StatefulWidget {
  const PredictScreen({Key? key}) : super(key: key);

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  String? prediction;

  Future<void> uploadScanpathFile() async {
    final XFile? file = await openFile(
      acceptedTypeGroups: [XTypeGroup(label: 'Text', extensions: ['txt'])],
    );

    if (file == null) return;

    final uri = Uri.parse('https://nejad.app.n8n.cloud/webhook-test/upload-scanpath');

    final request = http.MultipartRequest('POST', uri)
      ..fields['user_id'] = 'U123' // Later replace with dynamic ID
      ..files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: file.name,
          contentType: MediaType('text', 'plain'),
        ),
      );

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = jsonDecode(responseBody);
      setState(() {
        prediction = "${data['prediction']} (Action: ${data['action'] ?? 'N/A'})";
      });
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Prediction Result"),
          content: Text("Prediction: ${data['prediction']}\nAction: ${data['action'] ?? 'Not specified'}"),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
        ),
      );
    } else {
      setState(() {
        prediction = "Error: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/head_icon.png', height: 300),
              const SizedBox(height: 30),
              const Text(
                'Start Autism Detection',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: const Icon(Icons.chat_bubble, size: 28),
                label: const Text('Complete Questionnaire'),
                onPressed: () {
                  Navigator.pushNamed(context, '/form');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: const Icon(Icons.remove_red_eye, size: 28),
                label: const Text('Take RealEye Test'),
                onPressed: () {
                  Navigator.pushNamed(context, '/realeye');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: const Icon(Icons.upload_file, size: 28),
                label: const Text('Upload Scanpath File'),
                onPressed: uploadScanpathFile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'dart:convert';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:url_launcher/url_launcher.dart';


class PredictScreen extends StatefulWidget {
  final TextEditingController userIdController;
  const PredictScreen({Key? key, required this.userIdController}) : super(key: key);

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  String? prediction;
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://forms.office.com/r/ry40knbvtk');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
  Future<void> fetchPredictionFromFlask(String userId) async {
    final uri = Uri.parse('https://4355-94-200-93-26.ngrok-free.app/get_feedback/$userId');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          prediction = "${data['prediction']} (Feedback: ${data['feedback'] ?? 'N/A'})";
        });

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Your Results"),
          content: Text(
            "Prediction: ${data['prediction']}\n"
            "Feedback: ${data['feedback'] ?? 'N/A'}\n"
            "SVM Time: ${data['svm_latency_ms'] ?? 'N/A'} ms\n"
            "Agent Time: ${data['agent_latency_seconds'] ?? 'N/A'} s",
          ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No feedback found (Code ${response.statusCode})")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching feedback: $e")),
      );
    }
  }

  Future<void> uploadScanpathFile() async {
    final XFile? file = await openFile(
      acceptedTypeGroups: [XTypeGroup(label: 'Text', extensions: ['txt'])],
    );

    if (file == null) return;

    final userId = widget.userIdController.text.trim();

    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User ID is missing. Please enter it on the home screen.')),
      );
      return;
    }

    final uri = Uri.parse('https://00c2-94-200-93-26.ngrok-free.app/webhook/upload-scanpath');

    final request = http.MultipartRequest('POST', uri)
      ..fields['user_id'] = userId
      ..files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: file.name,
          contentType: MediaType('text', 'plain'),
        ),
      );

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = jsonDecode(responseBody);
      setState(() {
        prediction = "${data['prediction']} (Action: ${data['action'] ?? 'N/A'})";
      });


      for (int attempt = 0; attempt < 10; attempt++) {
        await Future.delayed(const Duration(seconds: 2));
        print("🔁 Fetch attempt $attempt for user ID: $userId");
        print("🚀 Trying GET: https://4355-94-200-93-26.ngrok-free.app/get_feedback/$userId");
        final flaskResponse = await http.get(Uri.parse('https://4355-94-200-93-26.ngrok-free.app/get_feedback/$userId'));
        print("Status Code: ${flaskResponse.statusCode}");
        print("Body: ${flaskResponse.body}");
        if (flaskResponse.statusCode == 200) {
          final data = jsonDecode(flaskResponse.body);
          print("✅ Received data: $data");

          setState(() {
            prediction = "${data['prediction']} (Feedback: ${data['feedback'] ?? 'N/A'})";
          });

          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("AI Agent Feedback"),
              content: Text(
                "Prediction: ${data['prediction']}\n"
                "Feedback: ${data['feedback'] ?? 'N/A'}\n"
                "SVM Time: ${data['svm_latency_seconds']}s\n"
                "Agent Time: ${data['agent_latency_seconds']}s"
              ),
              actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
            ),
          );
          break;
        } else {
          print("❌ Attempt $attempt failed: ${flaskResponse.statusCode}");
        }
      }


    } else {
      setState(() {
        prediction = "Error: ${response.statusCode}";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon/head_icon.png', height: 300),
              const SizedBox(height: 30),
              const Text(
                'Start Autism Detection',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: _launchURL,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.chat_bubble, size: 24),
                      SizedBox(width: 12),
                      Text('Complete Questionnaire', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () async {
                    final userId = widget.userIdController.text.trim();

                    if (userId.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User ID is required')),
                      );
                      return;
                    }

                    final realeyeUrl = Uri.parse(
                      'https://app.realeye.io/test/53ec43bf-0d14-4c21-960c-f40206c179d3/run?externalUserId=$userId&realeye-eyetracker-quick_calibration=1',
                    );

                    if (!await launchUrl(realeyeUrl, mode: LaunchMode.externalApplication)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Could not open RealEye test')),
                      );
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.remove_red_eye, size: 24),
                      SizedBox(width: 12),
                      Text('Take RealEye Test', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              /*ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: uploadScanpathFile,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.upload_file, size: 24),
                    SizedBox(width: 12),
                    Text('Upload Scanpath File', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),*/

              if (prediction != null) ...[
                const SizedBox(height: 40),
                const Divider(),
                const SizedBox(height: 20),
                const Text(
                  'Latest Result',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: Text(
                    prediction!,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
