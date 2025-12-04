import 'answer.dart';
import 'question.dart';

class Quiz {
  final List<Question> questions;
  final List<Answer> answers = [];

  Quiz({required this.questions});

  void addAnswer(Answer a) => answers.add(a);

  int getScore() {
    int score = 0;
    for (var q in questions) {
      final userAnswer = answers.firstWhere(
        (a) => a.id == q.id,
        orElse: () => Answer(id: q.id, userChoice: ""),
      );
      if (userAnswer.userChoice == q.correctChoice) score++;
    }
    return score;
  }
}

