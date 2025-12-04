import 'package:flutter/material.dart';
import 'models/answer.dart';
import 'models/quiz.dart';
import 'ui/screens/start_screen.dart';
import 'ui/screens/question_screen.dart';
import 'ui/screens/result_screen.dart';
import 'data/repositories/quiz_mock_repository.dart';

enum AppScreen { start, question, result }

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

  @override
  void initState() {
    super.initState();
    quiz = Quiz(questions: QuizMockRepository().loadQuestions());
  }

  void startQuiz() {
    setState(() {
      currScreen = AppScreen.question;
      currQuestionIndex = 0;
      quiz.answers.clear();
    });
  }

  void chooseAnswer(String choice) {
    final currentQuestion = quiz.questions[currQuestionIndex];
    quiz.addAnswer(Answer(id: currentQuestion.id, userChoice: choice));

    if (currQuestionIndex < quiz.questions.length - 1) {
      setState(() {
        currQuestionIndex++;
      });
    } else {
      setState(() {
        currScreen = AppScreen.result;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currScreen = AppScreen.start;
    });
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
         
        );
        break;
    }

    return MaterialApp(debugShowCheckedModeBanner: false, home: screen);
  }
}
