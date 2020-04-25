import 'package:SortyQuizz/quizz/model/question.dart';
import 'package:SortyQuizz/shared/models/card.dart';
import 'package:SortyQuizz/shared/models/pack_type.dart';
import 'package:SortyQuizz/shared/models/rule.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Pack {
  @JsonProperty(name: 'id')
  int id;

  @JsonProperty(name: 'name')
  String name;

  @JsonProperty(name: 'level')
  int level;

  @JsonProperty(name: 'type', enumValues: PackType.values)
  PackType type;

  @JsonProperty(name: 'life')
  int life;

  @JsonProperty(name: 'ruleId')
  int ruleId;

  @JsonProperty(name: 'themeId')
  int themeId;

  @JsonProperty(name: 'themeName')
  String themeName;

  @JsonProperty(name: 'rule')
  Rule rule;

  @JsonProperty(name: 'questions')
  List<Question> questions = new List<Question>();

  @JsonProperty(name: 'cards')
  List<CardDTO> cards = new List<CardDTO>();
}
