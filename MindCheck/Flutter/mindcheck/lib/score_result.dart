class ScoreResult {
  final int score;
  final String riskLevel;

  ScoreResult(this.score, this.riskLevel);
}

int calculateTotalScore(List<String> responses) {
  int totalScore = 0;
  for (String response in responses) {
    totalScore += int.parse(response);
  }
  return totalScore;
}

ScoreResult getScoreResult(int score) {
  if (score >= 10 && score <= 14) {
    return ScoreResult(score, 'Mild');
  } else if (score >= 15 && score <= 19) {
    return ScoreResult(score, 'Moderate');
  } else if (score >= 20) {
    return ScoreResult(score, 'Severe');
  } else {
    return ScoreResult(score, 'None');
  }
}
