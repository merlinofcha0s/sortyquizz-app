import 'dart:async';

import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/mixins/validators_mixin.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends Bloc with ValidatorMixin {
  final _numberOpenPack = BehaviorSubject<int>();

  final packRepository = UserPackRepository();

  Stream<int> get numberOpenPackStream => _numberOpenPack.stream;

  Function(int) get changeNumberOpenPack => _numberOpenPack.sink.add;

  MainBloc();

  getCountOpenPack() async {
    int countOpenPackForConnectedUser = await packRepository.getCountOpenPackForConnectedUser();
    _numberOpenPack.add(countOpenPackForConnectedUser);
  }

  @override
  void dispose() => () {
        _numberOpenPack.close();
      };
}
