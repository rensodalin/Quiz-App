// import 'package:flutter/material.dart';
// import 'data/repositories/quiz_mock_repository.dart';
// import 'models/answer.dart';
// import 'models/quiz.dart';
// import 'ui/screens/start_screen.dart';
// import 'ui/screens/question_screen.dart';
// import 'ui/screens/result_screen.dart';
// import 'ui/screens/history_screen.dart';

// enum AppScreen { start, question, result, history }

// void main() {
//   runApp(const QuizAppRoot());
// }

// class QuizAppRoot extends StatefulWidget {
//   const QuizAppRoot({super.key});

//   @override
//   State<QuizAppRoot> createState() => _QuizAppRootState();
// }

// class _QuizAppRootState extends State<QuizAppRoot> {
//   AppScreen currScreen = AppScreen.start;

//   late Quiz quiz;
//   int currQuestionIndex = 0;

//   List<int> historyScores = [];

//   @override
//   void initState() {
//     super.initState();
//     quiz = Quiz(questions: QuizMockRepository().loadQuestions());
//   }

//   void startQuiz() {
//     setState(() {
//       currScreen = AppScreen.question;
//       currQuestionIndex = 0;
//       quiz.answers.clear();
//     });
//   }

//   void chooseAnswer(String choice) {
//     final q = quiz.questions[currQuestionIndex];
//     quiz.addAnswer(Answer(id: q.id, userChoice: choice));

//     if (currQuestionIndex < quiz.questions.length - 1) {
//       setState(() => currQuestionIndex++);
//     } else {
//       int score = quiz.getScore();
//       historyScores.add(score);

//       setState(() => currScreen = AppScreen.result);
//     }
//   }

//   void restartQuiz() {
//     setState(() => currScreen = AppScreen.start);
//   }

//   void openHistory() {
//     setState(() => currScreen = AppScreen.history);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget screen;

//     switch (currScreen) {
//       case AppScreen.start:
//         screen = StartScreen(onStart: startQuiz);
//         break;
//       case AppScreen.question:
//         screen = QuestionScreen(
//           question: quiz.questions[currQuestionIndex],
//           onChoose: chooseAnswer,
//         );
//         break;
//       case AppScreen.result:
//         screen = ResultScreen(
//           quiz: quiz,
//           onRestart: restartQuiz,
//           onViewHistory: openHistory,
//         );
//         break;
//       case AppScreen.history:
//         screen = HistoryScreen(historyScores: historyScores);
//         break;
//     }

//     return MaterialApp(debugShowCheckedModeBanner: false, home: screen);
//   }
// }
import 'package:flutter/material.dart';
import 'data/repositories/quiz_mock_repository.dart';
import 'data/quiz_storage.dart';
import 'models/answer.dart';
import 'models/quiz.dart';
import 'ui/screens/start_screen.dart';
import 'ui/screens/question_screen.dart';
import 'ui/screens/result_screen.dart';
import 'ui/screens/history_screen.dart';

enum AppScreen { start, question, result, history }

void main() {
  runApp(const QuizAppRoot());
}

class QuizAppRoot extends StatefulWidget {
  const QuizAppRoot({super.key});

  @override
  State<QuizAppRoot> createState() => _QuizAppRootState();
}

class _QuizAppRootState extends State<QuizAppRoot> {
  AppScreen currScreen = AppScreen.start;
  late Quiz quiz;
  int currQuestionIndex = 0;
  List<int> historyScores = [];

  @override
  void initState() {
    super.initState();
    quiz = Quiz(questions: QuizMockRepository().loadQuestions());
    loadHistory();
  }

  void loadHistory() async {
    historyScores = await QuizStorage.loadHistory();
    setState(() {});
  }

  void startQuiz() {
    setState(() {
      currScreen = AppScreen.question;
      currQuestionIndex = 0;
      quiz.answers.clear();
    });
  }

  void chooseAnswer(String choice) async {
    final q = quiz.questions[currQuestionIndex];
    quiz.addAnswer(Answer(id: q.id, userChoice: choice));

    if (currQuestionIndex < quiz.questions.length - 1) {
      setState(() => currQuestionIndex++);
    } else {
      int score = quiz.getScore();
      await QuizStorage.saveScore(score);
      historyScores = await QuizStorage.loadHistory();

      setState(() => currScreen = AppScreen.result);
    }
  }

  void restartQuiz() {
    setState(() => currScreen = AppScreen.start);
  }

  void openHistory() {
    setState(() => currScreen = AppScreen.history);
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (currScreen) {
      case AppScreen.start:
        screen = StartScreen(onStart: startQuiz);
        break;
      case AppScreen.question:
        screen = QuestionScreen(
          question: quiz.questions[currQuestionIndex],
          onChoose: chooseAnswer,
        );
        break;
      case AppScreen.result:
        screen = ResultScreen(
          quiz: quiz,
          onRestart: restartQuiz,
          onViewHistory: openHistory,
        );
        break;
      case AppScreen.history:
        screen = HistoryScreen(historyScores: historyScores);
        break;
    }

    return MaterialApp(debugShowCheckedModeBanner: false, home: screen);
  }
}
