
// import 'package:flutter/material.dart';
// import '../../models/quiz.dart';
// import '../widgets/app_button.dart';

// class ResultScreen extends StatelessWidget {
//   final Quiz quiz;
//   final VoidCallback onRestart;

//   const ResultScreen({required this.quiz, required this.onRestart, super.key});

//   @override
//   Widget build(BuildContext context) {
//     int score = quiz.getScore();
//     int total = quiz.questions.length;

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(32),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.purpleAccent, Colors.deepPurple],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Your Score",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               "$score / $total",
//               style: const TextStyle(
//                 fontSize: 48,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.yellow,
//               ),
//             ),
//             const SizedBox(height: 40),
//             AppButton(text: "Restart Quiz", onPressed: onRestart),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import '../../models/answer.dart';
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
          children: [
            const SizedBox(height: 60),

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

            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, i) {
                  final q = quiz.questions[i];
                  final userAnswer = quiz.answers.firstWhere(
                    (a) => a.id == q.id,
                    orElse: () => Answer(id: q.id, userChoice: ""),
                  );

                  bool isCorrect = userAnswer.userChoice == q.correctChoice;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isCorrect
                          ? Colors.green.withOpacity(0.3)
                          : Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          q.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Your answer: ${userAnswer.userChoice}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Correct answer: ${q.correctChoice}",
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            AppButton(text: "Restart Quiz", onPressed: onRestart),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

