// import 'question.dart';
// import 'answer.dart';

// class Quiz {
//   final List<Question> questions;
//   final List<Answer> answers = [];

//   Quiz({required this.questions});

//   void addAnswer(Answer a) => answers.add(a);

//   int getScore() {
//     int count = 0;
//     for (int i = 0; i < questions.length; i++) {
//       if (answers[i].userChoice == questions[i].correctChoice) {
//         count++;
//       }
//     }
//     return count;
//   }
// }

import 'question.dart';
import 'answer.dart';

class Quiz {
  final List<Question> questions;
  final List<Answer> answers = [];

  Quiz({required this.questions});

  void addAnswer(Answer a) => answers.add(a);

  int getScore() {
    int count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (answers[i].userChoice == questions[i].correctChoice) count++;
    }
    return count;
  }
}

