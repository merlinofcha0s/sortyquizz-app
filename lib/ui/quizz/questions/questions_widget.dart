import 'package:SortyQuizz/bloc/bloc_provider.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:SortyQuizz/ui/quizz/questions/question_widget.dart';
import 'package:flutter/widgets.dart';

class QuestionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<QuestionBloc>(context);
    return StreamBuilder<List<Question>>(
        stream: bloc.stream,
        builder: (context, snap) {
          if (snap.hasData) {
            return new QuestionWidget(snap.data.first);
          } else {
            return new LoadingIndicator();
          }
        });
  }
}
