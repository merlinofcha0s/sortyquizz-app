import 'package:SortyQuizz/app_data.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/containers/questions_widget.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class QuizzScreen extends StatefulWidget {

  QuizzScreen() : super(key: QuizzKeys.quizzScreen);

  @override
  State<StatefulWidget> createState() => QuizzScreenState();
}

class QuizzScreenState extends State<QuizzScreen> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionBloc>(
      create: (BuildContext context) => QuestionBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Quizz"),
          ),
          body: QuestionsWidget()
      ),
    );
  }
}
