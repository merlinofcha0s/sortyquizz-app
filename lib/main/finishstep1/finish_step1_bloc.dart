import 'dart:async';

import 'package:SortyQuizz/main/finishstep1/finish_step1_model.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/result_step1_type.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class FinishStep1Bloc extends Bloc {
  final _result = BehaviorSubject<ResultStep>();

  Stream<ResultStep> get resultStream => _result.stream;

  final userPackRepository = UserPackRepository();

  FinishStep1Bloc();

  loadState(FinishStep1DTO finishStep1Argument) async {
    _result.add(finishStep1Argument.userPack.resultStep);
  }

  abortPack(int userPack) async {
    await userPackRepository.abortPack(userPack);
  }

  @override
  void dispose() => () {
        _result.close();
      };
}
