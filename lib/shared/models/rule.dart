import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Rule {

  @JsonProperty(name: 'id')
  int id;

  @JsonProperty(name: 'nbMaxQuestions')
  int nbMaxQuestions;

  @JsonProperty(name: 'timePerQuestion')
  int timePerQuestion;

  @JsonProperty(name: 'timeForSorting')
  int timeForSorting;

  @JsonProperty(name: 'nbMinCardToWin')
  int nbMinCardToWin;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Rule &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nbMaxQuestions == other.nbMaxQuestions &&
          timePerQuestion == other.timePerQuestion &&
          timeForSorting == other.timeForSorting &&
          nbMinCardToWin == other.nbMinCardToWin;

  @override
  int get hashCode =>
      id.hashCode ^
      nbMaxQuestions.hashCode ^
      timePerQuestion.hashCode ^
      timeForSorting.hashCode ^
      nbMinCardToWin.hashCode;

  @override
  String toString() {
    return 'Rule{id: $id, nbMaxQuestions: $nbMaxQuestions, timePerQuestion: $timePerQuestion, timeForSorting: $timeForSorting, nbMinCardToWin: $nbMinCardToWin}';
  }
}
