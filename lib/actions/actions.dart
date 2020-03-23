import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';

class LoadQuestionsAction {}

class QuestionsNotLoadedAction {}

class QuestionsLoadedAction {
  final List<Question> questions;

  QuestionsLoadedAction(this.questions);

  @override
  String toString() {
    return 'QuestionsLoadedAction{questions: $questions}';
  }
}

class AddQuestionAction {
  final Question question;

  AddQuestionAction(this.question);

  @override
  String toString() {
    return 'AddQuestionAction{question: $question}';
  }
}

class SortAnswerAction {
  final Answer answer;
  final Question question;

  SortAnswerAction(this.answer, this.question);

  @override
  String toString() {
    return 'SortAnswerAction{answer: $answer, question: $question}';
  }
}

