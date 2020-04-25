import 'package:SortyQuizz/shared/models/card.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class FinishStep2DTO {

  @JsonProperty(name: 'passedTime')
  int passedTime;
  @JsonProperty(name: 'nbCards')
  int nbCards;

  @JsonProperty(name: 'cards')
  List<CardDTO> cards;

  FinishStep2DTO(this.passedTime, this.nbCards, this.cards);

  @override
  String toString() {
    return 'FinishStep2Argument{passedTime: $passedTime, nbCards: $nbCards, cards: $cards}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinishStep2DTO &&
          runtimeType == other.runtimeType &&
          passedTime == other.passedTime &&
          nbCards == other.nbCards &&
          cards == other.cards;

  @override
  int get hashCode => passedTime.hashCode ^ nbCards.hashCode ^ cards.hashCode;
}
