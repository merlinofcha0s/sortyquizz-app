import 'dart:async';

import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/mixins/validators_mixin.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class OpenPackBloc extends Bloc with ValidatorMixin {
  final _openPack = BehaviorSubject<List<UserPack>>();

  final packRepository = PackRepository();

  Stream<List<UserPack>> get openPackStream => _openPack.stream;

  Function(List<UserPack>) get changeOpenPack => _openPack.sink.add;

  OpenPackBloc();

  getAllPackForConnectedUser() async {
    List<UserPack> openPackForConnectedUser = await packRepository.getAllPackForConnectedUser();
    _openPack.add(openPackForConnectedUser);
  }

  @override
  void dispose() => () {
        _openPack.close();
      };
}
