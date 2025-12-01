// import 'package:flutter/material.dart';

// class HistoryScreen extends StatelessWidget {
//   final List<int> historyScores;

//   const HistoryScreen({super.key, required this.historyScores});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(title: const Text("Score History")),
//       body: ListView.builder(
//         itemCount: historyScores.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//               "Quiz #${index + 1}",
//               style: const TextStyle(color: Colors.white),
//             ),
//             subtitle: Text(
//               "Score: ${historyScores[index]}",
//               style: const TextStyle(color: Colors.white70),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<int> historyScores;

  const HistoryScreen({super.key, required this.historyScores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: const Text("Score History")),
      body: ListView.builder(
        itemCount: historyScores.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Quiz #${index + 1}",
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "Score: ${historyScores[index]}",
              style: const TextStyle(color: Colors.white70),
            ),
          );
        },
      ),
    );
  }
}
