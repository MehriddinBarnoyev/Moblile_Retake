import 'package:flutter/material.dart';
import 'initiate_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guessing Game'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InitiatePage()),
            );
          },
          child: Text('Start the game'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            textStyle: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
