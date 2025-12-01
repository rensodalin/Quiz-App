// import 'package:flutter/material.dart';
// import '../widgets/app_button.dart';

// class StartScreen extends StatelessWidget {
//   final VoidCallback onStart;

//   const StartScreen({super.key, required this.onStart});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.question_mark, color: Colors.white, size: 180),
//             const SizedBox(height: 40),
//             AppButton(text: "Start Quiz", onPressed: onStart),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.question_mark, color: Colors.white, size: 180),
            const SizedBox(height: 40),
            AppButton(text: "Start Quiz", onPressed: onStart),
          ],
        ),
      ),
    );
  }
}
