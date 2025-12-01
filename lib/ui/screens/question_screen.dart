// import 'package:flutter/material.dart';
// import '../../models/question.dart';
// import '../widgets/app_button.dart';

// class QuestionScreen extends StatelessWidget {
//   final Question question;
//   final Function(String) onChoose;

//   const QuestionScreen({
//     super.key,
//     required this.question,
//     required this.onChoose,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // Shrinks column to fit content
//               children: [
//                 Text(
//                   question.title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 40),
//                 ...question.choice.map(
//                   (c) => Padding(
//                     padding: const EdgeInsets.only(bottom: 12),
//                     child: AppButton(text: c, onPressed: () => onChoose(c)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../../models/question.dart';
import '../widgets/app_button.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String) onChoose;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.onChoose,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  question.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ...question.choice.map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: AppButton(text: c, onPressed: () => onChoose(c)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
