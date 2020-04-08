import 'package:SortyQuizz/quizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/quizz/bloc/result_bloc.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/quizz/questions/question_widget.dart';
import 'package:SortyQuizz/shared/bloc/bloc_provider.dart';
import 'package:SortyQuizz/shared/containers/loading_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../quizz_bar_buttons.dart';

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
