// import 'package:flutter/material.dart';
// import '../../models/quiz.dart';
// import '../widgets/app_button.dart';

// class ResultScreen extends StatelessWidget {
//   final Quiz quiz;
//   final VoidCallback onRestart;
//   final VoidCallback onViewHistory;

//   const ResultScreen({
//     super.key,
//     required this.quiz,
//     required this.onRestart,
//     required this.onViewHistory,
//   });

//   @override
//   Widget build(BuildContext context) {
//     int score = quiz.getScore();

//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             Text(
//               "You answered $score on ${quiz.questions.length}!",
//               style: const TextStyle(color: Colors.white, fontSize: 22),
//             ),
//             const SizedBox(height: 30),

//             // List questions + answers
//             Expanded(
//               child: ListView.builder(
//                 itemCount: quiz.questions.length,
//                 itemBuilder: (context, i) {
//                   final q = quiz.questions[i];
//                   final a = quiz.answers[i];

//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "${i + 1}. ${q.title}",
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Your answer: ${a.userChoice}",
//                           style: TextStyle(
//                             color: a.isCorrect(q.correctChoice)
//                                 ? Colors.green
//                                 : Colors.red,
//                           ),
//                         ),
//                         Text(
//                           "Correct: ${q.correctChoice}",
//                           style: const TextStyle(color: Colors.blue),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),

//             AppButton(text: "Restart Quiz", onPressed: onRestart),
//             const SizedBox(height: 10),
//             AppButton(text: "View History", onPressed: onViewHistory),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;
  final VoidCallback onViewHistory;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.onRestart,
    required this.onViewHistory,
  });

  @override
  Widget build(BuildContext context) {
    int score = quiz.getScore();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              "You answered $score / ${quiz.questions.length} correctly!",
              style: const TextStyle(color: Colors.white, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, i) {
                  final q = quiz.questions[i];
                  final a = quiz.answers[i];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${i + 1}. ${q.title}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Your answer: ${a.userChoice}",
                          style: TextStyle(
                            color: a.isCorrect(q.correctChoice)
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Text(
                          "Correct: ${q.correctChoice}",
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            AppButton(text: "Restart Quiz", onPressed: onRestart),
            const SizedBox(height: 10),
            AppButton(text: "View History", onPressed: onViewHistory),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
