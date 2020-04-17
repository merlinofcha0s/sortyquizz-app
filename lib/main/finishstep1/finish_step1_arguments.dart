import 'package:SortyQuizz/shared/models/pack.dart';

class FinishStep1Argument {
  final int usedQuestions;
  final int passedTime;
  final int wonCards;

  final Pack pack;

  FinishStep1Argument(this.usedQuestions, this.passedTime, this.wonCards, this.pack);
}
