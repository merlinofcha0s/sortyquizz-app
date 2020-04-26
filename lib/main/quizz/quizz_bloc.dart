import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:SortyQuizz/main/finishstep1/finish_step1_model.dart';
import 'package:SortyQuizz/quizz/model/answer.dart';
import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/quizz/model/score.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/result_step1_type.dart';
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

  final _answers = BehaviorSubject<List<Answer>>();

  Queue<Question> questionsQueue = new Queue<Question>();

  final userPackRepository = UserPackRepository();

  Stream<UserPack> get startQuizzStream => _startQuizz.stream;

  Stream<Question> get nextQuestionStream => _nextQuestion.stream;

  Stream<Answer> get chooseAnswerStream => _chooseAnswer.stream;

  Stream<Result> get updateScoreStream => _updateScore.stream;

  Stream<int> get updateWonCardsStream => _updateWonCards.stream;

  Stream<int> get updateQuestionNumberStream => _updateQuestionNumber.stream;

  Stream<int> get timerStream => _timer.stream;

  Stream<int> get scoreTimeStream => _scoreTime.stream;

  Stream<List<Answer>> get answersStream => _answers.stream;

  StreamSubscription<int> currentTimerSub;

  bool lockAnswer = false;

  QuizzBloc() {
    _scoreTime.add(0);
    _answers.add(new List<Answer>());
    _timer.add(0);
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
    stopTimer();

    Rule rule = _startQuizz.value.pack.rule;
    var timePerQuestion = rule.timePerQuestion;

    Stream<int> currentTimer = Stream<int>.periodic(Duration(seconds: 1), (timeLeft) => timePerQuestion - timeLeft)
        .take(timePerQuestion + 1);

    currentTimerSub = currentTimer.listen((timeLeft) => _timer.add(timeLeft), onDone: () => endTimer());
  }

  stopTimer() {
    if (currentTimerSub != null) {
      currentTimerSub.cancel();
    }
  }

  endTimer() async {
    computeTimePassAtQuestion();
    await getNextQuestion();
  }

  getNextQuestion() async {
    if (questionsQueue.length >= 1) {
      var nextQuestion = questionsQueue.removeLast();
      nextQuestion.answers.shuffle(Random.secure());
      _nextQuestion.add(nextQuestion);
      _answers.add(nextQuestion.answers);

      var currentQuestionNumber = _startQuizz.value.pack.questions.length - questionsQueue.length;
      _updateQuestionNumber.add(currentQuestionNumber);

      await startTimer();
      lockAnswer = false;
    }
  }

  bool hasNextQuestion(){
    var currentQuestionNumber = _startQuizz.value.pack.questions.length - questionsQueue.length;
    return currentQuestionNumber != _startQuizz.value.pack.questions.length;
  }

  Future<FinishStep1DTO> finishStep1() async {
    FinishStep1DTO finishStepArgument = FinishStep1DTO(_updateQuestionNumber.value, _scoreTime.value, _updateWonCards.value, _startQuizz.value);

    UserPack userPack = new UserPack();
    userPack.packId = finishStepArgument.userPack.pack.id;
    userPack.nbQuestionsToSucceed = finishStepArgument.usedQuestions;
    userPack.timeAtQuizzStep = finishStepArgument.passedTime;

    if (finishStepArgument.wonCards < finishStepArgument.userPack.pack.rule.nbMinCardToWin && finishStepArgument.userPack.lifeLeft - 1 > 0) {
      userPack.resultStep = ResultStep.FAIL_WITH_LIFE;
    } else if (finishStepArgument.wonCards < finishStepArgument.userPack.pack.rule.nbMinCardToWin && finishStepArgument.userPack.lifeLeft - 1 <= 0) {
      userPack.resultStep = ResultStep.FAIL_WITHOUT_LIFE;
    } else {
      userPack.resultStep = ResultStep.SUCCEED;
    }

    var userPackUpdated = await userPackRepository.completeUserPackForStep1(userPack);
    userPackUpdated.resultStep = userPack.resultStep;
    finishStepArgument.userPack = userPackUpdated;

    return finishStepArgument;
  }

  computeTimePassAtQuestion() {
    // Compute time pass at question
    _scoreTime.add((_startQuizz.value.pack.rule.timePerQuestion - _timer.value) + _scoreTime.value);
  }

  validateAnswer(Answer answer) {
    answer.hasBeenChoose = true;
    lockAnswer = true;
    _answers.add(_answers.value);
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
    stopTimer();
  }

  Future<bool> waitFor(int secondToWait) {
    return new Future<bool>.delayed(Duration(seconds: secondToWait), () => true);
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
        _answers.close();
        if (currentTimerSub != null) {
          currentTimerSub.cancel();
        }
      };
}
