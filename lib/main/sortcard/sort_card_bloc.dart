import 'dart:async';
import 'dart:math';

import 'package:SortyQuizz/main/sortcard/finish_step2_model.dart';
import 'package:SortyQuizz/shared/bloc/bloc.dart';
import 'package:SortyQuizz/shared/models/card.dart';
import 'package:SortyQuizz/shared/models/rule.dart';
import 'package:SortyQuizz/shared/models/user_pack.dart';
import 'package:SortyQuizz/shared/repository/card_repository.dart';
import 'package:rxdart/rxdart.dart';

class SortCardBloc extends Bloc {

  final _cards = BehaviorSubject<List<CardDTO>>();

  final _currentUserPack = BehaviorSubject<UserPack>();

  final _timer = BehaviorSubject<int>();

  Stream<List<CardDTO>> get cardsStream => _cards.stream;

  Stream<int> get timerStream => _timer.stream;

  Stream<UserPack> get currentUserPackStream => _currentUserPack.stream;

  CardRepository cardRepository = new CardRepository();

  StreamSubscription<int> currentTimerSub;

  Stream<int> currentTimer;

  SortCardBloc() {
    _timer.add(0);
  }

  loadCards(UserPack userPack){
    userPack.pack.cards.shuffle(Random.secure());
    _cards.add(userPack.pack.cards);
    _currentUserPack.add(userPack);
  }

  startTimer(UserPack userPack) async {
    stopTimer();

    Rule rule = userPack.pack.rule;
    var timeForSorting = rule.timeForSorting;

    Stream<int> currentTimer = Stream<int>.periodic(Duration(seconds: 1), (timeLeft) => timeForSorting - timeLeft)
        .take(timeForSorting + 1);

    currentTimerSub = currentTimer.listen((timeLeft) =>  _timer.add(timeLeft), onDone: () => endTimer());
  }

  int computeTimePassAtQuestion() {
    return _currentUserPack.value.pack.rule.timeForSorting - _timer.value;
  }

  stopTimer() {
    if (currentTimerSub != null) {
      currentTimerSub.cancel();
    }
  }

  endTimer() async {
    validateSorting();
  }

  changeCardOrder(CardDTO cardDTO, int newIndex) {
    List<CardDTO> currentCard = _cards.value;
    currentCard.remove(cardDTO);
    currentCard.insert(newIndex, cardDTO);
    _cards.add(_cards.value);
  }

  Future<UserPack> validateSorting() async {
    var timePassed = computeTimePassAtQuestion();
    FinishStep2DTO step2dto = new FinishStep2DTO(timePassed, _currentUserPack.value.pack.cards.length, _cards.value);
    return await cardRepository.validateSorting(step2dto);
  }

  @override
  void dispose() {
    _cards.close();
    _timer.close();
    _currentUserPack.close();
    stopTimer();
  }
}
