import 'package:SortyQuizz/bloc/bloc_provider.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/bloc/result_bloc.dart';
import 'package:SortyQuizz/keys.dart';
import 'package:SortyQuizz/models/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'questions/questions_widget.dart';

class QuizzButtonBar extends StatelessWidget {
  final QuestionBloc questionBloc;

  QuizzButtonBar(this.questionBloc);

  @override
  Widget build(BuildContext context) {
    final resultBloc = BlocProvider.of<ResultBloc>(context);
    return StreamBuilder<Result>(
        stream: resultBloc.stream,
        builder: (context, snapshot) {
          return new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                  color: Colors.deepOrange,
                  onPressed: () => Navigator.pop(context),
                  child: Text('Quit', style: TextStyle(fontSize: 15))),
              new RaisedButton(
                color: Colors.blue,
                onPressed: () => onPressNextQuestion(context, questionBloc, resultBloc),
                child: getNextButtonText(questionBloc),
              )
            ],
          );
        }
    );
  }

  Text getNextButtonText(QuestionBloc bloc) {
    if (bloc.hasNextQuestion()) {
      return Text('Next Question', style: TextStyle(fontSize: 15));
    } else {
      return Text('Finish', style: TextStyle(fontSize: 15));
    }
  }

  onPressNextQuestion(BuildContext context, QuestionBloc questionBloc, ResultBloc resultBloc) {
    if (questionBloc.hasNextQuestion()) {
      questionBloc.getNextQuestion();
    } else {
      Result quizzResult = resultBloc.finish(questionBloc.questionsLoaded);
      showScorePopup(context, quizzResult);
    }
  }

  Future<void> showScorePopup(BuildContext context, Result quizzResult) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your score'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Score: ${quizzResult.score}'),
                Text('Right answers: ${quizzResult.right}'),
                Text('Wrong answers: ${quizzResult.wrong}'),
                Text('Total questions: ${quizzResult.total}'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
