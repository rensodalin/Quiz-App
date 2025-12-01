import 'package:shared_preferences/shared_preferences.dart';

class QuizStorage {
  static const String historyKey = "quiz_history";

  static Future<void> saveScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(historyKey) ?? [];
    history.add(score.toString());
    await prefs.setStringList(historyKey, history);
  }

  static Future<List<int>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(historyKey) ?? [];
    return history.map(int.parse).toList();
  }
}
