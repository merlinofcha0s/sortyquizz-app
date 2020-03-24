import 'dart:async';
import 'dart:ffi';

import 'package:SortyQuizz/directory/question_repository.dart';
import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class QuestionBloc with ChangeNotifier {
  List<Question> questions;

  QuestionBloc() {
    this.questions = List();
  }

  Stream<List<Question>> loadQuestions() {
    List<Answer> answers = new List();
    Answer a = new Answer("Réponse A", 1);
    Answer b = new Answer("Réponse B", 2);
    Answer c = new Answer("Réponse C", 3);
    Answer d = new Answer("Réponse D", 4);
    answers.add(a);
    answers.add(b);
    answers.add(c);
    answers.add(d);

    this.questions =  [
      Question('1', 'Whats this question a ?', 1, answers),
      Question('2', 'Whats this question b ?', 1, answers),
      Question('3', 'Whats this question c ?', 1, answers),
      Question('4', 'Whats this question d ?', 1, answers),
      Question('5', 'Whats this question e ?', 1, answers),
      Question('6', 'Whats this question f ?', 1, answers),
    ];

    return Stream.value(questions);
  }
}
