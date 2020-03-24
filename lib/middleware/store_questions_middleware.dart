import 'package:SortyQuizz/actions/actions.dart';
import 'package:SortyQuizz/directory/question_repository.dart';
import 'package:SortyQuizz/models/app_state.dart';
import 'package:SortyQuizz/selectors/selectors.dart';
import 'package:redux/redux.dart';


List<Middleware<AppState>> createStoreQuizzMiddleware() {
  final QuestionsRepository repository = QuestionsRepository();

  final saveQuestions = _createSaveQuestions(repository);
  final loadQuestions = _createLoadQuestions(repository);

  return [
    TypedMiddleware<AppState, LoadQuestionsAction>(loadQuestions),
    TypedMiddleware<AppState, AddQuestionAction>(saveQuestions),
    TypedMiddleware<AppState, QuestionsLoadedAction>(saveQuestions)
  ];
}

Middleware<AppState> _createSaveQuestions(QuestionsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveQuestions(
      questionsSelector(store.state).toList(),
    );
  };
}

Middleware<AppState> _createLoadQuestions(QuestionsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    /*repository.loadQuestions().then(
      (questions) {
        store.dispatch(
          QuestionsLoadedAction(
            questions,
          ),
        );
      },
    ).catchError((_) => store.dispatch(QuestionsNotLoadedAction()));*/

    next(action);
  };
}
