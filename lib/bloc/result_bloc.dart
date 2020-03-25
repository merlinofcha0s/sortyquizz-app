import 'dart:async';
import 'dart:math';

import 'package:SortyQuizz/bloc/bloc.dart';
import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:SortyQuizz/models/score.dart';
import 'package:collection/collection.dart';

class ResultBloc extends Bloc {
  final _streamController = StreamController<Result>();

  Stream<Result> get stream => _streamController.stream;

  Sink<Result> get sink => _streamController.sink;

  ResultBloc();

  Result finish(List<Question> questions) {
    int score = 0;
    int right = 0;
    int wrong = 0;
    int total = questions.length;

    for (Question question in questions) {
      List<Answer> clonedAnswers = question.answers.toList();
      clonedAnswers
          .sort((answerA, answerB) => answerA.order.compareTo(answerB.order));
      List<Answer> userAnswers = question.answers;

      if (IterableEquality().equals(clonedAnswers, userAnswers)) {
        score++;
        right++;
      } else {
        wrong++;
      }
    }

    return Result(score, right, wrong, total);
  }

  @override
  void dispose() => _streamController.close();
}
