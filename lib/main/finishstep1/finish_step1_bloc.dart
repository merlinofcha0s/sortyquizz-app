import 'dart:async';

import 'package:SortyQuizz/main/finishstep1/finish_step1_arguments.dart';
import 'package:SortyQuizz/main/finishstep1/result_step1_type.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class FinishStep1Bloc extends Bloc {
  final _result = BehaviorSubject<ResultStep1>();

  Stream<ResultStep1> get resultStream => _result.stream;

  final userPackRepository = UserPackRepository();

  FinishStep1Bloc();

  recordScore(FinishStep1Argument finishStep1Argument) async {
    UserPack userPack = new UserPack();
    userPack.packId = finishStep1Argument.userPack.pack.id;
    userPack.nbQuestionsToSucceed = finishStep1Argument.usedQuestions;
    userPack.timeAtQuizzStep = finishStep1Argument.passedTime;

    if(finishStep1Argument.wonCards < finishStep1Argument.userPack.pack.rule.nbMinCardToWin && finishStep1Argument.userPack.pack.lifeLeft > 0) {
      _result.add(ResultStep1.FAIL_WITH_LIFE);
    } else if (finishStep1Argument.wonCards < finishStep1Argument.userPack.pack.rule.nbMinCardToWin && finishStep1Argument.userPack.pack.lifeLeft == 0){
      _result.add(ResultStep1.FAIL_WITHOUT_LIFE);
    } else {
      _result.add(ResultStep1.SUCCEED);
    }

    await userPackRepository.completeUserPackForStep1(userPack);
  }

  restartPack(int userPack) async {
    await userPackRepository.looseWithLifeStep1(userPack);
  }

  abortPack(int userPack) async {
    await userPackRepository.abortPack(userPack);
  }

  @override
  void dispose() => () {
        _result.close();
      };
}