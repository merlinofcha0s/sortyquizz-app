import 'package:SortyQuizz/models/app_state.dart';
import 'package:SortyQuizz/models/question.dart';

List<Question> questionsSelector(AppState state) => state.questions;

Question questionSelector(List<Question> questions, String id) {
  try {
    return questions.firstWhere((todo) => todo.id == id);
  } catch (e) {
    return null;
  }
}
