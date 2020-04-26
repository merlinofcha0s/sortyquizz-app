import 'dart:async';

import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class FinishStep2Bloc extends Bloc {
  final _result = BehaviorSubject<UserPack>();

  Stream<UserPack> get resultStream => _result.stream;

  final userPackRepository = UserPackRepository();

  FinishStep2Bloc();

  loadState(UserPack currentPack) async {
    _result.add(currentPack);
  }

  abortPack(int userPack) async {
    await userPackRepository.abortPack(userPack);
  }

  @override
  void dispose() => () {
        _result.close();
      };
}
