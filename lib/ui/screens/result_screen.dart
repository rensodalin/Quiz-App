import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({required this.quiz, required this.onRestart, super.key});

  @override
  Widget build(BuildContext context) {
    int score = quiz.getScore();
    int total = quiz.questions.length;

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Score",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "$score / $total",
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(height: 40),
            AppButton(text: "Restart Quiz", onPressed: onRestart),
          ],
        ),
      ),
    );
  }
}
