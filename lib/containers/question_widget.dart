import 'package:SortyQuizz/models/app_state.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class QuestionWidget extends StatelessWidget {

  final Question question;

  QuestionWidget(this.question);

  @override
  Widget build(BuildContext context) {
    return Text(
        question.question
    );
  }
}
