import 'package:SortyQuizz/shared/models/user_pack.dart';

class FinishStep1Argument {
  int usedQuestions;
  int passedTime;
  int wonCards;

  UserPack userPack;

  FinishStep1Argument(this.usedQuestions, this.passedTime, this.wonCards, this.userPack);
}
