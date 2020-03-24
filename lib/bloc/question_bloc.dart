import 'dart:async';
import 'dart:ffi';

import 'package:SortyQuizz/bloc/bloc.dart';
import 'package:SortyQuizz/directory/question_repository.dart';
import 'package:SortyQuizz/models/answer.dart';
import 'package:SortyQuizz/models/question.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class QuestionBloc extends Bloc {
  final _streamController = StreamController<List<Question>>();
  Stream<List<Question>> get stream => _streamController.stream;
  Sink<List<Question>> get sink => _streamController.sink;


  fetchQuestions() async {
    final questions = await QuestionsRepository().loadQuestions();
    sink.add(questions);
  }

  QuestionBloc() {
    this.fetchQuestions();
  }

  @override
  void dispose() => _streamController.close();
}
