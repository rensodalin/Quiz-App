
import '../../models/question.dart';

class QuizMockRepository {
  List<Question> loadQuestions() {
    return [
      Question(
        id: "q1",
        title: "What is 2 + 2?",
        choices: ["1", "2", "4", "8"],
        correctChoice: "4",
      ),
      Question(
        id: "q2",
        title: "Capital of Cambodia?",
        choices: ["Siem Reap", "Phnom Penh", "Kampot"],
        correctChoice: "Phnom Penh",
      ),
      Question(
        id: "q3",
        title: "What is 5 - 3?",
        choices: ["1", "2", "3", "4"],
        correctChoice: "2",
      ),
    ];
  }
}

