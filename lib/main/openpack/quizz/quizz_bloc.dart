import 'dart:async';

import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/pack.dart';
import 'package:SortyQuizz/shared/repository/user_pack_repository.dart';
import 'package:rxdart/rxdart.dart';

class QuizzBloc extends Bloc {
  final _startQuizz = BehaviorSubject<Pack>();

  final packRepository = PackRepository();

  Stream<Pack> get startQuizzStream => _startQuizz.stream;

  Function(Pack) get changeStartQuizz => _startQuizz.sink.add;

  OpenPackBloc() {}

  getPackByIdByUser(int id) async {
    Pack packById = await packRepository.getPackByIdByConnectedUser(id);
    _startQuizz.add(packById);
  }

  @override
  void dispose() => () {
        _startQuizz.close();
      };
}
