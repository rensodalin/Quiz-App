
import 'package:flutter/material.dart';
import '../../models/question.dart';
import '../widgets/app_button.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String) onChoose;

  const QuestionScreen({
    required this.question,
    required this.onChoose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Question"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Text(
                question.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ...question.choices.map(
                (c) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: AppButton(text: c, onPressed: () => onChoose(c)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
