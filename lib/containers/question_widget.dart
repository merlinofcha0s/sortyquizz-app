import 'package:SortyQuizz/models/app_state.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;

  QuestionWidget(this.question);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(question.question),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: question.answers.length,
          itemBuilder: (BuildContext context, int index) {
            return Draggable(
              data: question.answers[index].order,
              child: Center(child: Text(question.answers[index].answer)),
              childWhenDragging: Center(
                child: Text(question.answers[index].answer,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              feedback: Center(
                child: Text(question.answers[index].answer,
                    style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ],
    );
  }
}
