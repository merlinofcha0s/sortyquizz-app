import 'package:SortyQuizz/bloc/bloc_provider.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/bloc/result_bloc.dart';
import 'package:SortyQuizz/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:SortyQuizz/ui/quizz/questions/question_widget.dart';
import 'package:SortyQuizz/ui/quizz/quizz_bar_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final questionBloc = BlocProvider.of<QuestionBloc>(context);
    return new StreamBuilder<Question>(
        stream: questionBloc.stream,
        builder: (context, snap) {
          if (snap.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new QuestionWidget(snap.data),
                quizzButtonBar(questionBloc)
              ],
            );
          } else {
            return new LoadingIndicator();
          }
        });
  }

  BlocProvider<ResultBloc> quizzButtonBar(QuestionBloc bloc) {
    return BlocProvider<ResultBloc>(
        bloc: ResultBloc(), child: QuizzButtonBar(bloc));
  }
}
