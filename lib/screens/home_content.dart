/*

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/local/colors.dart';
import '../shared/local/component.dart';
import 'state/appstates.dart';
import 'state/screens_controller.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<Map<String, String>> symptoms = [
    {"image": "assets/images/n1.png", "title": "Hyperactive"},
    {"image": "assets/images/n2.png", "title": "Depression"},
    {"image": "assets/images/n3.png", "title": "Rejecting Cuddles"},
    {"image": "assets/images/n4.png", "title": "Not Responding"},
    {"image": "assets/images/n5.png", "title": "Epilepsy"},
    {"image": "assets/images/n6.png", "title": "Plays Alone"},
    {"image": "assets/images/n7.png", "title": "Connection Issues"},
    {"image": "assets/images/n8.png", "title": "Learning Disability"},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            CustomAppBar(context: context, scaffoldkey: GlobalKey()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Common Symptoms',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),

            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: _pageController,
                itemCount: symptoms.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            symptoms[index]["image"]!,
                            fit: BoxFit.cover,
                            height: 180,
                            width: width * 0.9,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          symptoms[index]["title"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: symptoms.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 20,
                  activeDotColor: ColorManager.blueFont,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Top-Rated Centers',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),

            SizedBox(
              height: 250,
              child: BlocBuilder<AppCubit, AppStates>(
                builder: (context, state) {
                  final centers = AppCubit.get(context).highCentersList;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: centers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: width * 0.75,
                        margin: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                              child: Image.asset(
                                "assets/images/center.jpg",
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              centers[index]["center"]["centerName"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              centers[index]["center"]["address"],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            RatingBarIndicator(
                              rating: (centers[index]["validation"] as int).toDouble(),
                              itemBuilder: (context, _) =>
                                  const Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 30,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/local/colors.dart';
import 'state/appstates.dart';
import 'state/screens_controller.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<Map<String, String>> symptoms = [
    {"image": "assets/images/n1.png", "title": "Hyperactive"},
    {"image": "assets/images/n2.png", "title": "Depression"},
    {"image": "assets/images/n3.png", "title": "Rejecting Cuddles"},
    {"image": "assets/images/n4.png", "title": "Not Responding"},
    {"image": "assets/images/n5.png", "title": "Epilepsy"},
    {"image": "assets/images/n6.png", "title": "Plays Alone"},
    {"image": "assets/images/n7.png", "title": "Connection Issues"},
    {"image": "assets/images/n8.png", "title": "Learning Disability"},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'Common Symptoms',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),

        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: _pageController,
            itemCount: symptoms.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        symptoms[index]["image"]!,
                        fit: BoxFit.contain,
                        height: 180,
                        width: width * 0.9,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      symptoms[index]["title"]!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: symptoms.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 20,
              activeDotColor: Colors.teal,
              dotColor: Colors.grey.shade300,
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            'Top-Rated Centers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),

        SizedBox(
          height: 250,
          child: BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) {
              final centers = AppCubit.get(context).highCentersList;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: centers.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: width * 0.75,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            "assets/images/center.jpg",
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          centers[index]["center"]["centerName"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          centers[index]["center"]["address"],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        RatingBarIndicator(
                          rating: (centers[index]["validation"] as int).toDouble(),
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 30,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeContent extends StatefulWidget {
  final TextEditingController userIdController;

  const HomeContent({Key? key, required this.userIdController}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<Map<String, String>> symptoms = [
    {"image": "assets/images/n1.png", "title": "Hyperactive"},
    {"image": "assets/images/n2.png", "title": "Depression"},
    {"image": "assets/images/n3.png", "title": "Rejecting Cuddles"},
    {"image": "assets/images/n4.png", "title": "Not Responding"},
    {"image": "assets/images/n5.png", "title": "Epilepsy"},
    {"image": "assets/images/n6.png", "title": "Plays Alone"},
    {"image": "assets/images/n7.png", "title": "Connection Issues"},
    {"image": "assets/images/n8.png", "title": "Learning Disability"},
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'Common Symptoms',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: _pageController,
            itemCount: symptoms.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        symptoms[index]["image"]!,
                        fit: BoxFit.contain,
                        height: 180,
                        width: width * 0.9,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      symptoms[index]["title"]!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            controller: _pageController,
            count: symptoms.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 20,
              activeDotColor: Colors.teal,
              dotColor: Colors.grey.shade300,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            'Enter Your User ID',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: widget.userIdController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              labelText: 'User ID',
              hintText: 'Enter your unique user ID',
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
