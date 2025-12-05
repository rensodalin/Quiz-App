class Answer {
  final String id;
  String userChoice;

  Answer({required this.id, required this.userChoice});

  bool isCorrect(String correctChoice) {
    return userChoice == correctChoice;
  }
}


