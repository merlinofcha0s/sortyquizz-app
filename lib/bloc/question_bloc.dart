import 'dart:async';
import 'dart:ffi';

import 'package:SortyQuizz/bloc/bloc.dart';
import 'package:SortyQuizz/directory/question_repository.dart';
import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class QuestionBloc extends Bloc {
  List<Question> questionsLoaded;
  Question current;
  int index;

  final _streamController = StreamController<Question>();

  Stream<Question> get stream => _streamController.stream;

  Sink<Question> get sink => _streamController.sink;

  QuestionBloc() {
    this.fetchQuestions();
  }

  fetchQuestions() async {
    this.questionsLoaded = await QuestionsRepository().loadQuestions();
    sink.add(this.questionsLoaded.first);
    this.index = 0;
  }

  getNextQuestion() {
    if (index <= questionsLoaded.length &&
        this.questionsLoaded.asMap()[index + 1] != null) {
      this.current = this.questionsLoaded[index + 1];
      this.index = index + 1;
      sink.add(this.current);
    } else {
      sink.add(null);
    }
  }

  @override
  void dispose() => _streamController.close();
}
