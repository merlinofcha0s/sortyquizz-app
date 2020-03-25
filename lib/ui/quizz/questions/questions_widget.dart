import 'package:SortyQuizz/bloc/bloc_provider.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/containers/loading_indicator_widget.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:SortyQuizz/ui/quizz/questions/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<QuestionBloc>(context);
    return StreamBuilder<Question>(
        stream: bloc.stream,
        builder: (context, snap) {
          if (snap.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new QuestionWidget(snap.data),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                      color: Colors.deepOrange,
                      onPressed: () => Navigator.pop(context),
                      child:
                      Text('Quit', style: TextStyle(fontSize: 15))
                    ),
                    new RaisedButton(
                      color: Colors.blue,
                      onPressed: () => bloc.getNextQuestion(),
                      child:
                          Text('Next Question', style: TextStyle(fontSize: 15)),
                    )
                  ],
                ),
              ],
            );
          } else {
            return new LoadingIndicator();
          }
        });
  }
}
