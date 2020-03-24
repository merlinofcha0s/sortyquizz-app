import 'package:SortyQuizz/actions/actions.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/containers/question_widget.dart';
import 'package:SortyQuizz/models/app_state.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:SortyQuizz/selectors/selectors.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import '../app_data.dart';

class QuestionsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _questionsProvider = Provider.of<QuestionBloc>(context);
    return StreamProvider<List<Question>>.value (
      value: _questionsProvider.loadQuestions(),
      initialData: List<Question>(),
      child: QuestionWidget(_questionsProvider.questions.first)
    );
  }
}
