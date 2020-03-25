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
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 60),
          itemCount: question.answers.length,
          itemBuilder: (BuildContext context, int index) {
            Answer currentAnswer = question.answers[index];
            return Center(
              child: DragTarget<Answer>(
                onWillAccept: (answer) {
                  return question.answers.indexOf(answer) != index;
                },
                onAccept: (answer) {
                  bloc.changeOrderAnswer(answer, index);
                },
                builder: (BuildContext context, List<Answer> candidateData, List<dynamic> rejectedData) {
                  return Draggable(
                    data: currentAnswer,
                    child: Text(currentAnswer.answer),
                    childWhenDragging: Text(currentAnswer.answer, style: TextStyle(fontWeight: FontWeight.bold)),
                    feedback: Text(currentAnswer.answer, style: TextStyle(fontSize: 20, color: Colors.blue, decorationStyle: TextDecorationStyle.solid, decoration: TextDecoration.none)),
                  );
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 30,
          ),
        ),
      ],
    );
  }
}
