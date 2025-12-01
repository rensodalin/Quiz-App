// import '../../models/question.dart';

// class QuizMockRepository {
//   List<Question> loadQuestions() {
//     return [
//       Question(
//         id: "q1",
//         title: "What is 2 + 2?",
//         choice: ["1", "2", "4", "8"], // FIXED
//         correctChoice: "4",
//       ),
//       Question(
//         id: "q2",
//         title: "Capital of Cambodia?",
//         choice: ["Siem Reap", "Phnom Penh", "Kampot"], // FIXED
//         correctChoice: "Phnom Penh",
//       ),
//     ];
//   }
// }


import '../../models/question.dart';

class QuizMockRepository {
  List<Question> loadQuestions() {
    return [
      Question(
        id: "q1",
        title: "What is 2 + 2?",
        choice: ["1", "2", "4", "8"],
        correctChoice: "4",
      ),
      Question(
        id: "q2",
        title: "Capital of Cambodia?",
        choice: ["Siem Reap", "Phnom Penh", "Kampot"],
        correctChoice: "Phnom Penh",
      ),
      Question(
        id: "q3",
        title: "Which color is a primary color?",
        choice: ["Green", "Blue", "Pink"],
        correctChoice: "Blue",
      ),
    ];
  }
}

