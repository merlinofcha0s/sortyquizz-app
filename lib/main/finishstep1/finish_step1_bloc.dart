import 'dart:async';

import 'package:SortyQuizz/main/finishstep1/finish_step1_arguments.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/pack.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class FinishStep1Bloc extends Bloc {
  final _startQuizz = BehaviorSubject<Pack>();

  final userPackRepository = UserPackRepository();

  Stream<Pack> get startQuizzStream => _startQuizz.stream;

  Stream<int> currentTimer;

  FinishStep1Bloc() {}

  recordScore(FinishStep1Argument finishStep1Argument) {
    UserPack userPack = new UserPack();
    userPack.packId = finishStep1Argument.pack.id;
    userPack.nbQuestionsToSucceed = finishStep1Argument.usedQuestions;
    userPack.timeAtQuizzStep = finishStep1Argument.passedTime;
    var succeed = userPackRepository.completeUserPackForStep1(userPack);
  }

  @override
  void dispose() => () {
        _startQuizz.close();
      };
}
