// class Answer {
//   final String id;
//   final String userChoice;

//   Answer({required this.id, required this.userChoice});

//   bool isCorrect(String correctChoice) => userChoice == correctChoice;
// }
class Answer {
  final String id;
  final String userChoice;

  Answer({required this.id, required this.userChoice});

  bool isCorrect(String correctChoice) => userChoice == correctChoice;
}
