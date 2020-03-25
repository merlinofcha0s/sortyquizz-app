import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';

class QuestionsRepository {
  final Duration delay;

  const QuestionsRepository([this.delay = const Duration(milliseconds: 2000)]);

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
          Question('1', 'Whats this question a ?', 1, answers.toList()),
          Question('2', 'Whats this question b ?', 1, answers.toList()),
          Question('3', 'Whats this question c ?', 1, answers.toList()),
          Question('4', 'Whats this question d ?', 1, answers.toList()),
          Question('5', 'Whats this question e ?', 1, answers.toList()),
          Question('6', 'Whats this question f ?', 1, answers.toList()),
        ]);
  }
}
