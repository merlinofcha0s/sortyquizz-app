import 'package:SortyQuizz/models/app_state.dart';
import 'package:SortyQuizz/reducers/questions_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    questions: questionsReducer(state.questions, action)
  );
}
