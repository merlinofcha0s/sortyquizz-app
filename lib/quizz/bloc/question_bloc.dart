import 'dart:async';
import 'dart:math';

import 'package:SortyQuizz/quizz/model/answer.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/quizz/questions/question_repository.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';


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
    this.questionsLoaded = await QuestionsRepository().start(1);
    this.current = this.questionsLoaded.first;
    this.index = 0;
    this.current.answers.shuffle(Random.secure());
    sink.add(this.current);
  }

  getNextQuestion() {
    if (index <= questionsLoaded.length &&
        this.questionsLoaded.asMap()[index + 1] != null) {
      this.current = this.questionsLoaded[index + 1];
      this.index = index + 1;
      this.current.answers.shuffle(Random.secure());
      sink.add(this.current);
    }
  }

  changeOrderAnswer(Answer answer, int newIndex) {
    List<Answer> currentAnswers = current.answers;
    currentAnswers.remove(answer);
    currentAnswers.insert(newIndex, answer);
    sink.add(this.current);
  }

  hasNextQuestion() {
    if (index <= questionsLoaded.length &&
        this.questionsLoaded.asMap()[index + 1] != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() => _streamController.close();
}
