import 'package:flutter/material.dart';
import 'game_page.dart';

class ResultPage extends StatelessWidget {
  final String player1Name;
  final String player2Name;
  final int player1Score;
  final int player2Score;
  final String winnerName;

  ResultPage({
    required this.player1Name,
    required this.player2Name,
    required this.player1Score,
    required this.player2Score,
    required this.winnerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$winnerName wins!'),
            SizedBox(height: 20),
            Text('$player1Name\'s Score: $player1Score'),
            Text('$player2Name\'s Score: $player2Score'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamePage(
                      player1Name: player1Name,
                      player2Name: player2Name,
                    ),
                  ),
                );
              },
              child: Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
