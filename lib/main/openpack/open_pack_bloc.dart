import 'dart:async';

import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class OpenPackBloc extends Bloc {
  final _openPack = BehaviorSubject<List<UserPack>>();

  final packRepository = UserPackRepository();

  Stream<List<UserPack>> get openPackStream => _openPack.stream;

  Function(List<UserPack>) get changeOpenPack => _openPack.sink.add;

  OpenPackBloc() {
    _openPack.add(new List<UserPack>());
  }

  getAllPackForConnectedUser() async {
    List<UserPack> openPackForConnectedUser = await packRepository.getAllPackForConnectedUser();
    _openPack.add(openPackForConnectedUser);
  }

  @override
  void dispose() => () {
        _openPack.close();
      };
}
