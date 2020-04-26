import 'package:SortyQuizz/shared/models/user_pack.dart';

class FinishStep1DTO {
  int usedQuestions;
  int passedTime;
  int wonCards;

  UserPack userPack;

  FinishStep1DTO(this.usedQuestions, this.passedTime, this.wonCards, this.userPack);
}
