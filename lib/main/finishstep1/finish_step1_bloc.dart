import 'dart:async';

import 'package:SortyQuizz/main/finishstep1/finish_step1_arguments.dart';
import 'package:SortyQuizz/main/finishstep1/result_step1_type.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class FinishStep1Bloc extends Bloc {
  final _result = BehaviorSubject<ResultStep1>();

  Stream<ResultStep1> get resultStream => _result.stream;

  final userPackRepository = UserPackRepository();

  FinishStep1Bloc();

  loadState(FinishStep1Argument finishStep1Argument) async {
    _result.add(finishStep1Argument.userPack.resultStep1);
  }

  abortPack(int userPack) async {
    await userPackRepository.abortPack(userPack);
  }

  @override
  void dispose() => () {
        _result.close();
      };
}