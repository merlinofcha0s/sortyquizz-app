import 'package:SortyQuizz/bloc/bloc_provider.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'questions/questions_widget.dart';

class QuizzScreen extends StatefulWidget {

  QuizzScreen() : super(key: QuizzKeys.quizzScreen);

  @override
  State<StatefulWidget> createState() => QuizzScreenState();
}

class QuizzScreenState extends State<QuizzScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quizz"),
        ),
        body: BlocProvider<QuestionBloc>(bloc: QuestionBloc(), child: QuestionsWidget())
    );
  }
}
