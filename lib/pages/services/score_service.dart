class ScoreService {
  // Singleton pattern
  static final ScoreService _instance = ScoreService._internal();

  factory ScoreService() {
    return _instance;
  }

  ScoreService._internal();

  int player1Score = 0;
  int player2Score = 0;
}

final scoreService = ScoreService();
