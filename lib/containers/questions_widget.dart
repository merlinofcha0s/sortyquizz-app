import 'package:SortyQuizz/containers/question_widget.dart';
import 'package:SortyQuizz/models/app_state.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:SortyQuizz/selectors/selectors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class QuestionsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return QuestionWidget(vm.questions.first);
      },
    );
  }
}

class _ViewModel {
  final List<Question> questions;
  final bool loading;

  _ViewModel({
    @required this.questions,
    @required this.loading,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      questions: questionsSelector(store.state),
      loading: store.state.loading
    );
  }
}
