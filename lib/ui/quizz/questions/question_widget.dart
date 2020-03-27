import 'dart:ui';

import 'package:SortyQuizz/bloc/bloc_provider.dart';
import 'package:SortyQuizz/bloc/question_bloc.dart';
import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef OnSortAnswerCallback = void Function(Answer answer, Question question);

class QuestionWidget extends StatelessWidget {
  final Question question;

  QuestionWidget(this.question);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<QuestionBloc>(context);
    return Column(
      children: <Widget>[
        Text(question.question,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 60),
            itemCount: question.answers.length,
            itemBuilder: (BuildContext context, int index) {
              Answer currentAnswer = question.answers[index];
              return DragTarget<Answer>(
                onWillAccept: (answer) {
                  return question.answers.indexOf(answer) != index;
                },
                onAccept: (answer) {
                  bloc.changeOrderAnswer(answer, index);
                },
                builder: (BuildContext context, List<Answer> candidateData,
                    List<dynamic> rejectedData) {
                  return Draggable(
                    data: currentAnswer,
                    child: answerWidget(currentAnswer, null),
                    childWhenDragging: answerWidget(currentAnswer, TextStyle(fontWeight: FontWeight.bold)),
                    feedback: answerWidget(currentAnswer, TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.none)),
                  );
                },
              );
            }),
      ],
    );
  }

  Card answerWidget(Answer answer, TextStyle style) {
    return Card(
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
              child: Text(
            answer.answer,
            style: style,
          )),
        ));
  }
}
