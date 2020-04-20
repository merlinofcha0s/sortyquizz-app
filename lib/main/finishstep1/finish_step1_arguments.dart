import 'package:SortyQuizz/shared/models/user_pack.dart';

class FinishStep1Argument {
  final int usedQuestions;
  final int passedTime;
  final int wonCards;

  final UserPack userPack;

  FinishStep1Argument(this.usedQuestions, this.passedTime, this.wonCards, this.userPack);
}
