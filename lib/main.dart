/*import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/ehs_redirect_screen.dart';
import 'screens/form_screen.dart';
import 'screens/realeye_screen.dart';
import 'screens/result_screen.dart';
import 'screens/state/screens_controller.dart';
import 'screens/home_layout.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 🔧 Required for platform plugins
  runApp(AutismInsightApp());
}

class AutismInsightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit(),
      child: MaterialApp(
        title: 'Autism Insight',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Colors.grey[100],
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeLayout(),
          '/ehs': (context) => EhsRedirectScreen(),
          '/form': (context) => FormScreen(),
          '/realeye': (context) => RealEyeScreen(),
          '/result': (context) => ResultScreen(),
        },
      ),
    );
  }
}*/

import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            '🧪 Test Screen Only',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}


