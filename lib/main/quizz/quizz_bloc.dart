import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:SortyQuizz/main/finishstep1/finish_step1_arguments.dart';
import 'package:SortyQuizz/quizz/model/answer.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/quizz/model/score.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/rule.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class QuizzBloc extends Bloc {
  final _startQuizz = BehaviorSubject<UserPack>();

  final _nextQuestion = BehaviorSubject<Question>();

  final _chooseAnswer = BehaviorSubject<Answer>();

  final _updateScore = BehaviorSubject<Result>();

  final _updateWonCards = BehaviorSubject<int>();

  final _updateQuestionNumber = BehaviorSubject<int>();

  final _timer = BehaviorSubject<int>();

  final _scoreTime = BehaviorSubject<int>();

  Queue<Question> questionsQueue = new Queue<Question>();

  final userPackRepository = UserPackRepository();

  Stream<UserPack> get startQuizzStream => _startQuizz.stream;

  Stream<Question> get nextQuestionStream => _nextQuestion.stream;

  Stream<Answer> get chooseAnswerStream => _chooseAnswer.stream;

  Stream<Result> get updateScore => _updateScore.stream;

  Stream<int> get updateWonCards => _updateWonCards.stream;

  Stream<int> get updateQuestionNumber => _updateQuestionNumber.stream;

  Stream<int> get timer => _timer.stream;

  Stream<int> get scoreTime => _scoreTime.stream;

  Stream<int> currentTimer;

  StreamSubscription<int> currentTimerSub;

  QuizzBloc() {
    _scoreTime.add(0);
  }

  getUserPackByIdByUser(int id) async {
    UserPack userPackById = await userPackRepository.getByIdAndConnectedUser(id);
    _startQuizz.add(userPackById);

    //Prepare all the questions
    List<Question> questions = userPackById.pack.questions;
    questions.shuffle(Random.secure());
    questionsQueue.clear();
    questionsQueue.addAll(questions);
    _updateWonCards.add(0);
    await getNextQuestion();
  }

  startTimer() async {
    if (currentTimerSub != null) {
      currentTimerSub.cancel();
    }

    Rule rule = _startQuizz.value.pack.rule;
    var timePerQuestion = rule.timePerQuestion;

    currentTimer = Stream<int>.periodic(Duration(seconds: 1), (timeLeft) => timePerQuestion - timeLeft)
        .take(timePerQuestion + 1);

    currentTimerSub = currentTimer.listen((timeLeft) => processTimer(timeLeft), onDone: () => endTimer());
  }

  processTimer(int timeLeft) {
    _timer.add(timeLeft);
  }

  endTimer() {
    computeTimePassAtQuestion();
    getNextQuestion();
  }

  getNextQuestion() async {
    if (questionsQueue.length >= 1) {
      var nextQuestion = questionsQueue.removeLast();
      nextQuestion.answers.shuffle(Random.secure());
      _nextQuestion.add(nextQuestion);

      var currentQuestionNumber = _startQuizz.value.pack.questions.length - questionsQueue.length;
      _updateQuestionNumber.add(currentQuestionNumber);

      await startTimer();
    }
  }

  bool hasNextQuestion(){
    var currentQuestionNumber = _startQuizz.value.pack.questions.length - questionsQueue.length;
    return currentQuestionNumber != _startQuizz.value.pack.questions.length;
  }

  FinishStep1Argument finishStep1() {
    return FinishStep1Argument(_updateQuestionNumber.value, _scoreTime.value, _updateWonCards.value, _startQuizz.value);
  }

  computeTimePassAtQuestion() {
    // Compute time pass at question
    _scoreTime.add((_startQuizz.value.pack.rule.timePerQuestion - _timer.value) + _scoreTime.value);
  }

  validateAnswer(Answer answer) async {
    Result resultToUpdate;
    if (!_updateScore.hasValue) {
      resultToUpdate = new Result(0, 0, 0, 0);
    } else {
      resultToUpdate = _updateScore.value;
    }

    if (answer.isTheRightAnswer) {
      resultToUpdate.right++;
      _updateWonCards.add(resultToUpdate.right);
      _updateScore.add(resultToUpdate);
    }

    computeTimePassAtQuestion();
  }

  @override
  void dispose() => () {
        _startQuizz.close();
        _nextQuestion.close();
        _chooseAnswer.close();
        _updateScore.close();
        _updateQuestionNumber.close();
        _updateWonCards.close();
        _timer.close();
        _scoreTime.close();
        if (currentTimerSub != null) {
          currentTimerSub.cancel();
        }
      };
}
