import 'package:SortyQuizz/bloc/bloc_provider.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'questions/questions_widget.dart';

class QuizzScreen extends StatelessWidget {
  QuizzScreen() : super(key: QuizzKeys.quizzScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quizz"),
        ),
        body: BlocProvider<QuestionBloc>(
            bloc: QuestionBloc(), child: QuestionsWidget()));
  }
}
