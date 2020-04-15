import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:SortyQuizz/quizz/model/answer.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/quizz/model/score.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/pack.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class QuizzBloc extends Bloc {

  final _startQuizz = BehaviorSubject<Pack>();

  final _nextQuestion = BehaviorSubject<Question>();

  final _chooseAnswer = BehaviorSubject<Answer>();

  final _updateScore = BehaviorSubject<Result>();

  final _updateWonCards = BehaviorSubject<int>();

  final _updateQuestionNumber = BehaviorSubject<int>();

  Queue<Question> questionsQueue = new Queue<Question>();

  final packRepository = PackRepository();

  Stream<Pack> get startQuizzStream => _startQuizz.stream;

  Stream<Question> get nextQuestionStream => _nextQuestion.stream;

  Stream<Answer> get chooseAnswerStream => _chooseAnswer.stream;

  Stream<Result> get updateScore => _updateScore.stream;

  Stream<int> get updateWonCards => _updateWonCards.stream;

  Stream<int> get updateQuestionNumber => _updateQuestionNumber.stream;

  QuizzBloc() {}

  getPackByIdByUser(int id) async {
    Pack packById = await packRepository.getPackByIdByConnectedUser(id);
    _startQuizz.add(packById);

    //Prepare all the questions
    List<Question> questions = packById.questions;
    questions.shuffle(Random.secure());
    questionsQueue.clear();
    questionsQueue.addAll(questions);
    getNextQuestion();
  }

  getNextQuestion() {
    if (questionsQueue.length >= 1) {
      var nextQuestion = questionsQueue.removeLast();
      nextQuestion.answers.shuffle(Random.secure());
      _nextQuestion.add(nextQuestion);

      var currentQuestionNumber = _startQuizz.value.questions.length - questionsQueue.length;
      _updateQuestionNumber.add(currentQuestionNumber);

      if(currentQuestionNumber == _startQuizz.value.questions.length){
        //FINISHEDDDDD !!!!
      }
    }
  }

  chooseAnswer(Answer answer) {
    // Compute score
    // TODO: Afficher les couleurs
    Result resultToUpdate;
    if (!_updateScore.hasValue) {
      resultToUpdate = new Result(0, 0, 0, 0);
    } else {
      resultToUpdate = _updateScore.value;
    }

    if (answer.isTheRightAnswer) {
      resultToUpdate.right++;
      _updateWonCards.add(resultToUpdate.right);
    }

    getNextQuestion();
  }

  @override
  void dispose() => () {
        _startQuizz.close();
        _nextQuestion.close();
        _chooseAnswer.close();
        _updateScore.close();
        _updateQuestionNumber.close();
        _updateWonCards.close();
      };
}
