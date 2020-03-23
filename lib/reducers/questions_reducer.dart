import 'package:SortyQuizz/actions/actions.dart';
import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:redux/redux.dart';

final questionsReducer = combineReducers<List<Question>>([
  TypedReducer<List<Question>, AddQuestionAction>(_addQuestion),
  TypedReducer<List<Question>, QuestionsLoadedAction>(_setLoadedQuestions),
  TypedReducer<List<Question>, QuestionsNotLoadedAction>(_setNoQuestions),
  TypedReducer<List<Question>, SortAnswerAction>(_sortAnswer),
]);

List<Question> _addQuestion(
    List<Question> questions, AddQuestionAction action) {
  return List.from(questions)..add(action.question);
}

List<Question> _setLoadedQuestions(
    List<Question> questions, QuestionsLoadedAction action) {
  return action.questions;
}

List<Question> _setNoQuestions(
    List<Question> questions, QuestionsNotLoadedAction action) {
  return [];
}

List<Answer> _sortAnswer(List<Question> questions, SortAnswerAction action) {
  return action.answer
}
