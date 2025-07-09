import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldkey;

  const CustomAppBar({
    Key? key,
    required this.context,
    required this.scaffoldkey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
            color: Color(0xFFE6F0FA),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Row(
            children: [
              Image.asset(
                'assets/icon/head_icon.png',
                height: 36,
              ),
              const SizedBox(width: 10),
              const Text(
                "BrightPath",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Spacer(),
              Icon(Icons.menu, color: Colors.black), // static for now
            ],
          ),
        ),
      ],
    );
  }
}
