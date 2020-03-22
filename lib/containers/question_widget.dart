import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              onAccept: (track) {
                setState(() {
                  int currentIndex = question.answers.indexOf(track);
                  question.answers.remove(track);
                  question.answers.insert(currentIndex > index ? index : index - 1, track);
                });
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
