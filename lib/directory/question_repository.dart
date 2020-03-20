import 'package:SortyQuizz/models/question.dart';

class QuestionsRepository {
  final Duration delay;

  const QuestionsRepository([this.delay = const Duration(milliseconds: 3000)]);

  /// Mock that "fetches" some Todos from a "web service" after a short delay
  Future<List<Question>> loadQuestions() async {
    return Future.delayed(
        delay,
        () => [
              Question('1', 'Whats this question ?', 1),
              Question('2', 'Whats this question ?', 1),
              Question('3', 'Whats this question ?', 1),
              Question('4', 'Whats this question ?', 1),
              Question('5', 'Whats this question ?', 1),
              Question('6', 'Whats this question ?', 1),
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> saveQuestions(List<Question> questions) async {
    return Future.value(true);
  }
}
