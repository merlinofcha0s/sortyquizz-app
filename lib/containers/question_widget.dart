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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(question.question),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: question.answers.length,
          itemBuilder: (BuildContext context, int index) {
            return DragTarget<Answer>(
              onWillAccept: (track) {
                return question.answers.indexOf(track) != index;
              },
              onAccept: (answer) {
                //this.onSortAnswerCallback(answer, question);
              },
              builder: (BuildContext context, List<Answer> candidateData, List<dynamic> rejectedData) {
                return Draggable(
                  data: question.answers[index],
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
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ],
    );
  }
}
