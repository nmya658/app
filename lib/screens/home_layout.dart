/*
import 'package:flutter/material.dart';
import 'home_content.dart'; // this will be your original HomeScreen content
import 'predict_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
} 

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(), // your original HomeScreen body
    const PredictScreen(),
    const Center(child: Text("Advice Page")),
    const Center(child: Text("Activity Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Predict"),
          BottomNavigationBarItem(icon: Icon(Icons.tips_and_updates), label: "Advice"),
          BottomNavigationBarItem(icon: Icon(Icons.extension), label: "Activity"),
        ],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import '../screens/home_content.dart';
import '../screens/predict_screen.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    PredictScreen(),
    const Center(child: Text("Advice Page")),
    const Center(child: Text("Activity Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔵 HEADER SHARED ACROSS SCREENS
          Container(
            height: 150,
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFE6F0FA),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon/head_icon.png',
                  height: 500,
                ),
                const SizedBox(width: 30),
                const Text(
                  "BrightPath",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.menu),
              ],
            ),
          ),

          // 🔵 MAIN SCREEN BODY
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Predict"),
          BottomNavigationBarItem(icon: Icon(Icons.tips_and_updates), label: "Advice"),
          BottomNavigationBarItem(icon: Icon(Icons.extension), label: "Activity"),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import '../screens/home_content.dart';
import '../screens/predict_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  final TextEditingController userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔵 HEADER (optional content)
          Container(
            height: 150,
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFE6F0FA),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon/head_icon.png',
                  height: 100,
                ),
                const SizedBox(width: 20),
                const Text(
                  "BrightPath",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.menu),
              ],
            ),
          ),

          // 🔵 MAIN BODY
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                const Center(child: Text("Home")),
                const Center(child: Text("Predict")),
                const Center(child: Text("Advice")),
                const Center(child: Text("Activity")),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Predict"),
          BottomNavigationBarItem(icon: Icon(Icons.tips_and_updates), label: "Advice"),
          BottomNavigationBarItem(icon: Icon(Icons.extension), label: "Activity"),
        ],
      ),
    );
  }
}

