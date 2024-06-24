import 'package:flutter/material.dart';
import 'dart:math';
import 'result_page.dart';
import './services/score_service.dart';

class GamePage extends StatefulWidget {
  final String player1Name;
  final String player2Name;

  GamePage({required this.player1Name, required this.player2Name});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _guessController = TextEditingController();
  int _targetNumber = Random().nextInt(100) + 1;
  int _minRange = 1;
  int _maxRange = 100;
  bool _isPlayer1Turn = true;
  String _feedback = '';

  @override
  void initState() {
    super.initState();
    print('Target Number: $_targetNumber'); // Print target number to console
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess the Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Current Range: $_minRange - $_maxRange'),
            TextField(
              controller: _guessController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your guess',
                errorText: _feedback.isNotEmpty ? _feedback : null,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Current Turn: ${_isPlayer1Turn ? widget.player1Name : widget.player2Name}',
            ),
            ElevatedButton(
              onPressed: _submitGuess,
              child: Text('Submit Guess'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitGuess() {
    final guess = int.tryParse(_guessController.text);
    if (guess == null) {
      setState(() {
        _feedback = 'Please enter a valid number';
      });
      return;
    }
    
    if (guess < _minRange || guess > _maxRange) {
      setState(() {
        _feedback = 'Please enter a number between $_minRange and $_maxRange';
      });
      return;
    }

    setState(() {
      _feedback = '';
    });

    if (guess == _targetNumber) {
      setState(() {
        if (_isPlayer1Turn) {
          scoreService.player1Score++;
        } else {
          scoreService.player2Score++;
        }
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            player1Name: widget.player1Name,
            player2Name: widget.player2Name,
            player1Score: scoreService.player1Score,
            player2Score: scoreService.player2Score,
            winnerName: _isPlayer1Turn ? widget.player1Name : widget.player2Name,
          ),
        ),
      );
    } else {
      setState(() {
        if (guess < _targetNumber) {
          _minRange = guess + 1;
        } else {
          _maxRange = guess - 1;
        }
        _isPlayer1Turn = !_isPlayer1Turn;
      });
      _guessController.clear(); // Clear the input field
    }
  }
}
