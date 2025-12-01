// // lib/models/question.dart
// class Question {
//   final String id;
//   final String title;
//   final List<String> choice; // <- name used by UI
//   final String correctChoice;

//   Question({
//     required this.id,
//     required this.title,
//     required this.choice,
//     required this.correctChoice,
//   });
// }

class Question {
  final String id;
  final String title;
  final List<String> choice;
  final String correctChoice;

  Question({
    required this.id,
    required this.title,
    required this.choice,
    required this.correctChoice,
  });
}

