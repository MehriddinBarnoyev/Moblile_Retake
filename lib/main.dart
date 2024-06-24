import 'package:flutter/material.dart';
import 'pages/landing_page.dart';

void main() {
  runApp(GuessingGameApp());
}

class GuessingGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guessing Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}
