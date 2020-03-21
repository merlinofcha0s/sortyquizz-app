import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';

class QuestionsRepository {
  final Duration delay;

  const QuestionsRepository([this.delay = const Duration(milliseconds: 3000)]);

  /// Mock that "fetches" some Todos from a "web service" after a short delay
  Future<List<Question>> loadQuestions() async {
    List<Answer> answers = new List();
    Answer a = new Answer("Réponse A", 1);
    Answer b = new Answer("Réponse B", 2);
    Answer c = new Answer("Réponse C", 3);
    Answer d = new Answer("Réponse D", 4);
    answers.add(a);
    answers.add(b);
    answers.add(c);
    answers.add(d);

    return Future.delayed(
        delay,
        () => [
              Question('1', 'Whats this question a ?', 1, answers),
              Question('2', 'Whats this question b ?', 1, answers),
              Question('3', 'Whats this question c ?', 1, answers),
              Question('4', 'Whats this question d ?', 1, answers),
              Question('5', 'Whats this question e ?', 1, answers),
              Question('6', 'Whats this question f ?', 1, answers),
            ]);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> saveQuestions(List<Question> questions) async {
    return Future.value(true);
  }
}
