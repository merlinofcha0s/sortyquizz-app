import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'answer.dart';

@jsonSerializable
class Question {

  @JsonProperty(name: 'id')
  int id;
  @JsonProperty(name: 'question')
  String question;
  @JsonProperty(name: 'level')
  int level;
  @JsonProperty(name: 'answers')
  List<Answer> answers;

  @override
  int get hashCode => question.hashCode ^ level.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          level == other.level &&
          id == other.id;

  @override
  String toString() {
    return 'Question{question: $question, level: $level, id: $id}';
  }
}
