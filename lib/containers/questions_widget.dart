import 'package:SortyQuizz/actions/actions.dart';
import 'package:SortyQuizz/containers/question_widget.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/models/app_state.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:SortyQuizz/selectors/selectors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'loading_indicator_widget.dart';

class QuestionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        if (vm.questions.isEmpty) {
          return LoadingIndicator(key: QuizzKeys.loading);
        } else {
          return QuestionWidget(vm.questions.first, vm.onSortAnswerCallback);
        }
      },
    );
  }
}

class _ViewModel {
  final List<Question> questions;
  final OnSortAnswerCallback onSortAnswerCallback;

  _ViewModel({@required this.questions, @required this.onSortAnswerCallback});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        questions: questionsSelector(store.state),
        onSortAnswerCallback: (answer, question) {
          store.dispatch(SortAnswerAction(answer, question));
        });
  }
}
